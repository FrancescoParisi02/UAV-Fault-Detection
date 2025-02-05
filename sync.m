function synchronize = sync(file,Hz)

fprintf("Caricamento dati da %s...\n", file);

    % Load data from the file
    load(file);
    num_motors = 6;

    % Filtering
    [IMU_0, IMU_1, IMU_2] = compare3(IMU_0, IMU_1, IMU_2);
    [XKF1_0, XKF1_1] = compare(XKF1_0, XKF1_1);
    [VIBE_0, VIBE_1, VIBE_2] = compare3(VIBE_0, VIBE_1, VIBE_2);
    ESC_data = {ESC_0, ESC_1, ESC_2, ESC_3, ESC_4, ESC_5};
    % Average IMU data
    IMU = average_imu_data(IMU_0, IMU_1, IMU_2);

    % Extract PWM data
    PWM = RCOU(:, 11:11 + num_motors - 1);

    % Extract ESC data
    ESC = extract_esc_data(num_motors, ESC_data);

    % Extract attitude data
    ATTITUDE = extract_attitude_data(ATT);

    % Average XKF1 data
    XKF1 = average_xkf1_data(XKF1_0, XKF1_1);

    % Average VIBE data
    VIBE = average_vibe_data(VIBE_0, VIBE_1, VIBE_2);

    % Extract and synchronize time data
    Time = extract_and_sync_time(IMU_0, RCOU, ATT, XKF1_0, VIBE_0, num_motors,ESC_data, Hz);

    % Synchronize data using Zero-Order Hold (ZOH)
    [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = synchronize_data(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, Time, num_motors, Hz);

    % Remove takeoff and landing phases
    [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = remove_takeoff_landing(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, num_motors);

    % Remove first and last 2 seconds of data
    [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = remove_edges(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, num_motors, Hz);

    % Save the processed data
    synchronize = save_processed_data(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE);
end

function IMU = average_imu_data(IMU_0, IMU_1, IMU_2)
    n = size(IMU_0, 1);
    IMU.GYR = [(IMU_0(:, 4) + IMU_1(:, 4) + IMU_2(:, 4)) / 3, ...
               (IMU_0(:, 5) + IMU_1(:, 5) + IMU_2(:, 5)) / 3, ...
               (IMU_0(:, 6) + IMU_1(:, 6) + IMU_2(:, 6)) / 3];
    IMU.ACC = [(IMU_0(:, 7) + IMU_1(:, 7) + IMU_2(:, 7)) / 3, ...
               (IMU_0(:, 8) + IMU_1(:, 8) + IMU_2(:, 8)) / 3, ...
               (IMU_0(:, 9) + IMU_1(:, 9) + IMU_2(:, 9)) / 3];
end

function ESC = extract_esc_data(num_motors, ESC_data)
    ESC = struct(); % Inizializza la struttura vuota
    for k = 1:num_motors
        ESC.("RPM" + num2str(k-1)) = ESC_data{k}(:, 4);
        ESC.("CURR" + num2str(k-1)) = ESC_data{k}(:, 7);
    end
end
%     %ESC = struct();
%     for k=1:num_motors
%         ESC.("RPM"+num2str(k-1))=eval("ESC_"+num2str(k-1)+"(:,4)");
%         ESC.("CURR"+num2str(k-1))=eval("ESC_"+num2str(k-1)+"(:,7)");
%     end
% end

function ATTITUDE = extract_attitude_data(ATT)
    ATTITUDE.ROLL = ATT(:, 4);
    ATTITUDE.PITCH = ATT(:, 6);
    ATTITUDE.YAW = ATT(:, 8);
    ATTITUDE.DesROLL = ATT(:, 3);
    ATTITUDE.DesPITCH = ATT(:, 5);
    ATTITUDE.DesYAW = ATT(:, 7);
end

function XKF1 = average_xkf1_data(XKF1_0, XKF1_1)
    n = min([size(XKF1_0, 1), size(XKF1_1, 1)]);
    XKF1.ROLL = (unwrap(XKF1_0(1:n, 4) / 360 * 2 * pi) + unwrap(XKF1_1(1:n, 4) / 360 * 2 * pi)) / 2;
    XKF1.PITCH = (unwrap(XKF1_0(1:n, 5) / 360 * 2 * pi) + unwrap(XKF1_1(1:n, 5) / 360 * 2 * pi)) / 2;
    XKF1.YAW = (unwrap(XKF1_0(1:n, 6) / 360 * 2 * pi) + unwrap(XKF1_1(1:n, 6) / 360 * 2 * pi)) / 2;
    XKF1.VN = (XKF1_0(1:n, 7) + XKF1_1(1:n, 7)) / 2;
    XKF1.VE = (XKF1_0(1:n, 8) + XKF1_1(1:n, 8)) / 2;
    XKF1.VD = (XKF1_0(1:n, 9) + XKF1_1(1:n, 9)) / 2;
end

function VIBE = average_vibe_data(VIBE_0, VIBE_1, VIBE_2)
    n = min([size(VIBE_0, 1), size(VIBE_1, 1), size(VIBE_2, 1)]);
    VIBE.ACC = [(VIBE_0(1:n, 4) + VIBE_1(1:n, 4) + VIBE_2(1:n, 4)) / 3, ...
                (VIBE_0(1:n, 5) + VIBE_1(1:n, 5) + VIBE_2(1:n, 5)) / 3, ...
                (VIBE_0(1:n, 6) + VIBE_1(1:n, 6) + VIBE_2(1:n, 6)) / 3];
end

function Time = extract_and_sync_time(IMU_0, RCOU, ATT, XKF1_0, VIBE_0, num_motors,ESC_data, Hz)
    Time.IMU = seconds(IMU_0(:, 2) / 1e6);
    Time.PWM = seconds(RCOU(:, 2) / 1e6);
    for k = 1:num_motors
        % Time.("ESC" + num2str(k-1)) = seconds(eval("ESC_" + num2str(k-1) + "(:,2)") / 1e6);
        Time.("ESC" + num2str(k-1)) = seconds(ESC_data{k}(:,2) / 1e6);
    end
    Time.ATT = seconds(ATT(:, 2) / 1e6);
    Time.XKF1 = seconds(XKF1_0(:, 2) / 1e6);
    Time.VIBE = seconds(VIBE_0(:, 2) / 1e6);

    % Synchronize time to start from 0
    initTime = min(structfun(@min, Time));
    Time = structfun(@(t) t - initTime, Time, 'UniformOutput', false);

    % Generate output time vector
    finishTime = max(structfun(@max, Time));
    timesout = (0:1/Hz:seconds(finishTime))';
    Time.timesout = timesout;
end

function [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = synchronize_data(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, Time, num_motors, Hz)
    IMU.GYR_sync = ZOHmatrix(IMU.GYR, seconds(Time.IMU), Time.timesout);
    IMU.ACC_sync = ZOHmatrix(IMU.ACC, seconds(Time.IMU), Time.timesout);
    PWM = ZOHmatrix(PWM, seconds(Time.PWM), Time.timesout);
    for k = 1:num_motors
        ESC.("RPM" + num2str(k-1) + "_sync") = ZOHmatrix(ESC.("RPM" + num2str(k-1)), seconds(Time.("ESC" + num2str(k-1))), Time.timesout);
        ESC.("CURR" + num2str(k-1) + "_sync") = ZOHmatrix(ESC.("CURR" + num2str(k-1)), seconds(Time.("ESC" + num2str(k-1))), Time.timesout);
    end
    ATTITUDE.ROLL_sync = ZOHmatrix(ATTITUDE.ROLL, seconds(Time.ATT), Time.timesout);
    ATTITUDE.PITCH_sync = ZOHmatrix(ATTITUDE.PITCH, seconds(Time.ATT), Time.timesout);
    ATTITUDE.YAW_sync = ZOHmatrix(ATTITUDE.YAW, seconds(Time.ATT), Time.timesout);
    ATTITUDE.DesROLL_sync = ZOHmatrix(ATTITUDE.DesROLL, seconds(Time.ATT), Time.timesout);
    ATTITUDE.DesPITCH_sync = ZOHmatrix(ATTITUDE.DesPITCH, seconds(Time.ATT), Time.timesout);
    ATTITUDE.DesYAW_sync = ZOHmatrix(ATTITUDE.DesYAW, seconds(Time.ATT), Time.timesout);
    XKF1.ROLL_sync = ZOHmatrix(XKF1.ROLL, seconds(Time.XKF1), Time.timesout);
    XKF1.PITCH_sync = ZOHmatrix(XKF1.PITCH, seconds(Time.XKF1), Time.timesout);
    XKF1.YAW_sync = ZOHmatrix(XKF1.YAW, seconds(Time.XKF1), Time.timesout);
    XKF1.VN_sync = ZOHmatrix(XKF1.VN, seconds(Time.XKF1), Time.timesout);
    XKF1.VE_sync = ZOHmatrix(XKF1.VE, seconds(Time.XKF1), Time.timesout);
    XKF1.VD_sync = ZOHmatrix(XKF1.VD, seconds(Time.XKF1), Time.timesout);
    VIBE.ACC_sync = ZOHmatrix(VIBE.ACC, seconds(Time.VIBE), Time.timesout);
end

function [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = remove_takeoff_landing(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, num_motors)
    idxcut = sum(PWM, 2) < 1450 * size(PWM, 2);
    IMU.GYR_sync(idxcut, :) = [];
    IMU.ACC_sync(idxcut, :) = [];
    PWM(idxcut, :) = [];
    for k = 1:num_motors
        ESC.("RPM" + num2str(k-1) + "_sync")(idxcut, :) = [];
        ESC.("CURR" + num2str(k-1) + "_sync")(idxcut, :) = [];
    end
    ATTITUDE.ROLL_sync(idxcut, :) = [];
    ATTITUDE.PITCH_sync(idxcut, :) = [];
    ATTITUDE.YAW_sync(idxcut, :) = [];
    ATTITUDE.DesROLL_sync(idxcut, :) = [];
    ATTITUDE.DesPITCH_sync(idxcut, :) = [];
    ATTITUDE.DesYAW_sync(idxcut, :) = [];
    XKF1.ROLL_sync(idxcut, :) = [];
    XKF1.PITCH_sync(idxcut, :) = [];
    XKF1.YAW_sync(idxcut, :) = [];
    XKF1.VN_sync(idxcut, :) = [];
    XKF1.VE_sync(idxcut, :) = [];
    XKF1.VD_sync(idxcut, :) = [];
    VIBE.ACC_sync(idxcut, :) = [];
end

function [IMU, PWM, ESC, ATTITUDE, XKF1, VIBE] = remove_edges(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE, num_motors, Hz)
    idxcut = 2 * Hz;
    IMU.GYR_sync(1:idxcut, :) = [];
    IMU.ACC_sync(1:idxcut, :) = [];
    PWM(1:idxcut, :) = [];
    for k = 1:num_motors
        ESC.("RPM" + num2str(k-1) + "_sync")(1:idxcut, :) = [];
        ESC.("CURR" + num2str(k-1) + "_sync")(1:idxcut, :) = [];
    end
    ATTITUDE.ROLL_sync(1:idxcut, :) = [];
    ATTITUDE.PITCH_sync(1:idxcut, :) = [];
    ATTITUDE.YAW_sync(1:idxcut, :) = [];
    ATTITUDE.DesROLL_sync(1:idxcut, :) = [];
    ATTITUDE.DesPITCH_sync(1:idxcut, :) = [];
    ATTITUDE.DesYAW_sync(1:idxcut, :) = [];
    XKF1.ROLL_sync(1:idxcut, :) = [];
    XKF1.PITCH_sync(1:idxcut, :) = [];
    XKF1.YAW_sync(1:idxcut, :) = [];
    XKF1.VN_sync(1:idxcut, :) = [];
    XKF1.VE_sync(1:idxcut, :) = [];
    XKF1.VD_sync(1:idxcut, :) = [];
    VIBE.ACC_sync(1:idxcut, :) = [];

    IMU.GYR_sync(end-idxcut+1:end, :) = [];
    IMU.ACC_sync(end-idxcut+1:end, :) = [];
    PWM(end-idxcut+1:end, :) = [];
    for k = 1:num_motors
        ESC.("RPM" + num2str(k-1) + "_sync")(end-idxcut+1:end, :) = [];
        ESC.("CURR" + num2str(k-1) + "_sync")(end-idxcut+1:end, :) = [];
    end
    ATTITUDE.ROLL_sync(end-idxcut+1:end, :) = [];
    ATTITUDE.PITCH_sync(end-idxcut+1:end, :) = [];
    ATTITUDE.YAW_sync(end-idxcut+1:end, :) = [];
    ATTITUDE.DesROLL_sync(end-idxcut+1:end, :) = [];
    ATTITUDE.DesPITCH_sync(end-idxcut+1:end, :) = [];
    ATTITUDE.DesYAW_sync(end-idxcut+1:end, :) = [];
    XKF1.ROLL_sync(end-idxcut+1:end, :) = [];
    XKF1.PITCH_sync(end-idxcut+1:end, :) = [];
    XKF1.YAW_sync(end-idxcut+1:end, :) = [];
    XKF1.VN_sync(end-idxcut+1:end, :) = [];
    XKF1.VE_sync(end-idxcut+1:end, :) = [];
    XKF1.VD_sync(end-idxcut+1:end, :) = [];
    VIBE.ACC_sync(end-idxcut+1:end, :) = [];
end

function synchronize = save_processed_data(IMU, PWM, ESC, ATTITUDE, XKF1, VIBE)
    synchronize.IMU = IMU;
    synchronize.PWM_sync = PWM;
    synchronize.ESC = ESC;
    synchronize.ATTITUDE = ATTITUDE;
    synchronize.XKF1 = XKF1;
    synchronize.VIBE = VIBE;
end