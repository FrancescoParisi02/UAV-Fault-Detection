function [featureTable,outputTable] = diagnosticFeaturesFinal(inputData)
%DIAGNOSTICFEATURES recreates results in Diagnostic Feature Designer.
%
% Input:
%  inputData: A table or a cell array of tables/matrices containing the
%  data as those imported into the app.
%
% Output:
%  featureTable: A table containing all features and condition variables.
%  outputTable: A table containing the computation results.
%
% This function computes spectra:
%  acc_x_ps/SpectrumData
%  acc_y_ps/SpectrumData
%  acc_z_ps/SpectrumData
%  gyr_x_ps/SpectrumData
%  gyr_y_ps/SpectrumData
%  gyr_z_ps/SpectrumData
%  pwm_1_ps/SpectrumData
%  pwm_2_ps/SpectrumData
%  pwm_3_ps/SpectrumData
%  pwm_4_ps/SpectrumData
%  pwm_5_ps/SpectrumData
%  pwm_6_ps/SpectrumData
%  roll_ps/SpectrumData
%  pitch_ps/SpectrumData
%  yaw_ps/SpectrumData
%  roll_des_ps/SpectrumData
%  pitch_des_ps/SpectrumData
%  yaw_des_ps/SpectrumData
%  vibe_x_ps/SpectrumData
%  vibe_y_ps/SpectrumData
%  vibe_z_ps/SpectrumData
%
% This function computes features:
%  acc_x_sigstats/ClearanceFactor
%  acc_x_sigstats/CrestFactor
%  acc_x_sigstats/ImpulseFactor
%  acc_x_sigstats/Kurtosis
%  acc_x_sigstats/Mean
%  acc_x_sigstats/PeakValue
%  acc_x_sigstats/RMS
%  acc_x_sigstats/ShapeFactor
%  acc_x_sigstats/Skewness
%  acc_x_sigstats/Std
%  acc_y_sigstats/ClearanceFactor
%  acc_y_sigstats/CrestFactor
%  acc_y_sigstats/ImpulseFactor
%  acc_y_sigstats/Kurtosis
%  acc_y_sigstats/Mean
%  acc_y_sigstats/PeakValue
%  acc_y_sigstats/RMS
%  acc_y_sigstats/ShapeFactor
%  acc_y_sigstats/Skewness
%  acc_y_sigstats/Std
%  acc_z_sigstats/ClearanceFactor
%  acc_z_sigstats/CrestFactor
%  acc_z_sigstats/ImpulseFactor
%  acc_z_sigstats/Kurtosis
%  acc_z_sigstats/Mean
%  acc_z_sigstats/PeakValue
%  acc_z_sigstats/RMS
%  acc_z_sigstats/ShapeFactor
%  acc_z_sigstats/Skewness
%  acc_z_sigstats/Std
%  gyr_x_sigstats/ClearanceFactor
%  gyr_x_sigstats/CrestFactor
%  gyr_x_sigstats/ImpulseFactor
%  gyr_x_sigstats/Kurtosis
%  gyr_x_sigstats/Mean
%  gyr_x_sigstats/PeakValue
%  gyr_x_sigstats/RMS
%  gyr_x_sigstats/ShapeFactor
%  gyr_x_sigstats/Skewness
%  gyr_x_sigstats/Std
%  gyr_y_sigstats/ClearanceFactor
%  gyr_y_sigstats/CrestFactor
%  gyr_y_sigstats/ImpulseFactor
%  gyr_y_sigstats/Kurtosis
%  gyr_y_sigstats/Mean
%  gyr_y_sigstats/PeakValue
%  gyr_y_sigstats/RMS
%  gyr_y_sigstats/ShapeFactor
%  gyr_y_sigstats/Skewness
%  gyr_y_sigstats/Std
%  gyr_z_sigstats/ClearanceFactor
%  gyr_z_sigstats/CrestFactor
%  gyr_z_sigstats/ImpulseFactor
%  gyr_z_sigstats/Kurtosis
%  gyr_z_sigstats/Mean
%  gyr_z_sigstats/PeakValue
%  gyr_z_sigstats/RMS
%  gyr_z_sigstats/ShapeFactor
%  gyr_z_sigstats/Skewness
%  gyr_z_sigstats/Std
%  pwm_1_sigstats/ClearanceFactor
%  pwm_1_sigstats/CrestFactor
%  pwm_1_sigstats/ImpulseFactor
%  pwm_1_sigstats/Kurtosis
%  pwm_1_sigstats/Mean
%  pwm_1_sigstats/PeakValue
%  pwm_1_sigstats/RMS
%  pwm_1_sigstats/ShapeFactor
%  pwm_1_sigstats/Skewness
%  pwm_1_sigstats/Std
%  pwm_2_sigstats/ClearanceFactor
%  pwm_2_sigstats/CrestFactor
%  pwm_2_sigstats/ImpulseFactor
%  pwm_2_sigstats/Kurtosis
%  pwm_2_sigstats/Mean
%  pwm_2_sigstats/PeakValue
%  pwm_2_sigstats/RMS
%  pwm_2_sigstats/ShapeFactor
%  pwm_2_sigstats/Skewness
%  pwm_2_sigstats/Std
%  pwm_3_sigstats/ClearanceFactor
%  pwm_3_sigstats/CrestFactor
%  pwm_3_sigstats/ImpulseFactor
%  pwm_3_sigstats/Kurtosis
%  pwm_3_sigstats/Mean
%  pwm_3_sigstats/PeakValue
%  pwm_3_sigstats/RMS
%  pwm_3_sigstats/ShapeFactor
%  pwm_3_sigstats/Skewness
%  pwm_3_sigstats/Std
%  pwm_4_sigstats/ClearanceFactor
%  pwm_4_sigstats/CrestFactor
%  pwm_4_sigstats/ImpulseFactor
%  pwm_4_sigstats/Kurtosis
%  pwm_4_sigstats/Mean
%  pwm_4_sigstats/PeakValue
%  pwm_4_sigstats/RMS
%  pwm_4_sigstats/ShapeFactor
%  pwm_4_sigstats/Skewness
%  pwm_4_sigstats/Std
%  pwm_5_sigstats/ClearanceFactor
%  pwm_5_sigstats/CrestFactor
%  pwm_5_sigstats/ImpulseFactor
%  pwm_5_sigstats/Kurtosis
%  pwm_5_sigstats/Mean
%  pwm_5_sigstats/PeakValue
%  pwm_5_sigstats/RMS
%  pwm_5_sigstats/ShapeFactor
%  pwm_5_sigstats/Skewness
%  pwm_5_sigstats/Std
%  pwm_6_sigstats/ClearanceFactor
%  pwm_6_sigstats/CrestFactor
%  pwm_6_sigstats/ImpulseFactor
%  pwm_6_sigstats/Kurtosis
%  pwm_6_sigstats/Mean
%  pwm_6_sigstats/PeakValue
%  pwm_6_sigstats/RMS
%  pwm_6_sigstats/ShapeFactor
%  pwm_6_sigstats/Skewness
%  pwm_6_sigstats/Std
%  roll_sigstats/ClearanceFactor
%  roll_sigstats/CrestFactor
%  roll_sigstats/ImpulseFactor
%  roll_sigstats/Kurtosis
%  roll_sigstats/Mean
%  roll_sigstats/PeakValue
%  roll_sigstats/RMS
%  roll_sigstats/ShapeFactor
%  roll_sigstats/Skewness
%  roll_sigstats/Std
%  pitch_sigstats/ClearanceFactor
%  pitch_sigstats/CrestFactor
%  pitch_sigstats/ImpulseFactor
%  pitch_sigstats/Kurtosis
%  pitch_sigstats/Mean
%  pitch_sigstats/PeakValue
%  pitch_sigstats/RMS
%  pitch_sigstats/ShapeFactor
%  pitch_sigstats/Skewness
%  pitch_sigstats/Std
%  yaw_sigstats/ClearanceFactor
%  yaw_sigstats/CrestFactor
%  yaw_sigstats/ImpulseFactor
%  yaw_sigstats/Kurtosis
%  yaw_sigstats/Mean
%  yaw_sigstats/PeakValue
%  yaw_sigstats/RMS
%  yaw_sigstats/ShapeFactor
%  yaw_sigstats/Skewness
%  yaw_sigstats/Std
%  roll_des_sigstats/ClearanceFactor
%  roll_des_sigstats/CrestFactor
%  roll_des_sigstats/ImpulseFactor
%  roll_des_sigstats/Kurtosis
%  roll_des_sigstats/Mean
%  roll_des_sigstats/PeakValue
%  roll_des_sigstats/RMS
%  roll_des_sigstats/ShapeFactor
%  roll_des_sigstats/Skewness
%  roll_des_sigstats/Std
%  pitch_des_sigstats/ClearanceFactor
%  pitch_des_sigstats/CrestFactor
%  pitch_des_sigstats/ImpulseFactor
%  pitch_des_sigstats/Kurtosis
%  pitch_des_sigstats/Mean
%  pitch_des_sigstats/PeakValue
%  pitch_des_sigstats/RMS
%  pitch_des_sigstats/ShapeFactor
%  pitch_des_sigstats/Skewness
%  pitch_des_sigstats/Std
%  yaw_des_sigstats/ClearanceFactor
%  yaw_des_sigstats/CrestFactor
%  yaw_des_sigstats/ImpulseFactor
%  yaw_des_sigstats/Kurtosis
%  yaw_des_sigstats/Mean
%  yaw_des_sigstats/PeakValue
%  yaw_des_sigstats/RMS
%  yaw_des_sigstats/ShapeFactor
%  yaw_des_sigstats/Skewness
%  yaw_des_sigstats/Std
%  vibe_x_sigstats/ClearanceFactor
%  vibe_x_sigstats/CrestFactor
%  vibe_x_sigstats/ImpulseFactor
%  vibe_x_sigstats/Kurtosis
%  vibe_x_sigstats/Mean
%  vibe_x_sigstats/PeakValue
%  vibe_x_sigstats/RMS
%  vibe_x_sigstats/ShapeFactor
%  vibe_x_sigstats/Skewness
%  vibe_x_sigstats/Std
%  vibe_y_sigstats/ClearanceFactor
%  vibe_y_sigstats/CrestFactor
%  vibe_y_sigstats/ImpulseFactor
%  vibe_y_sigstats/Kurtosis
%  vibe_y_sigstats/Mean
%  vibe_y_sigstats/PeakValue
%  vibe_y_sigstats/RMS
%  vibe_y_sigstats/ShapeFactor
%  vibe_y_sigstats/Skewness
%  vibe_y_sigstats/Std
%  vibe_z_sigstats/ClearanceFactor
%  vibe_z_sigstats/CrestFactor
%  vibe_z_sigstats/ImpulseFactor
%  vibe_z_sigstats/Kurtosis
%  vibe_z_sigstats/Mean
%  vibe_z_sigstats/PeakValue
%  vibe_z_sigstats/RMS
%  vibe_z_sigstats/ShapeFactor
%  vibe_z_sigstats/Skewness
%  vibe_z_sigstats/Std
%  acc_x_ps_spec/PeakAmp1
%  acc_x_ps_spec/PeakFreq1
%  acc_x_ps_spec/BandPower
%  acc_y_ps_spec/PeakAmp1
%  acc_y_ps_spec/PeakFreq1
%  acc_y_ps_spec/BandPower
%  acc_z_ps_spec/PeakAmp1
%  acc_z_ps_spec/PeakFreq1
%  acc_z_ps_spec/BandPower
%  gyr_x_ps_spec/PeakAmp1
%  gyr_x_ps_spec/PeakFreq1
%  gyr_x_ps_spec/BandPower
%  gyr_y_ps_spec/PeakAmp1
%  gyr_y_ps_spec/PeakFreq1
%  gyr_y_ps_spec/BandPower
%  gyr_z_ps_spec/PeakAmp1
%  gyr_z_ps_spec/PeakFreq1
%  gyr_z_ps_spec/BandPower
%  pwm_1_ps_spec/PeakAmp1
%  pwm_1_ps_spec/PeakFreq1
%  pwm_1_ps_spec/BandPower
%  pwm_2_ps_spec/PeakAmp1
%  pwm_2_ps_spec/PeakFreq1
%  pwm_2_ps_spec/BandPower
%  pwm_3_ps_spec/PeakAmp1
%  pwm_3_ps_spec/PeakFreq1
%  pwm_3_ps_spec/BandPower
%  pwm_4_ps_spec/PeakAmp1
%  pwm_4_ps_spec/PeakFreq1
%  pwm_4_ps_spec/BandPower
%  pwm_5_ps_spec/PeakAmp1
%  pwm_5_ps_spec/PeakFreq1
%  pwm_5_ps_spec/BandPower
%  pwm_6_ps_spec/PeakAmp1
%  pwm_6_ps_spec/PeakFreq1
%  pwm_6_ps_spec/BandPower
%  roll_ps_spec/PeakAmp1
%  roll_ps_spec/PeakFreq1
%  roll_ps_spec/BandPower
%  pitch_ps_spec/PeakAmp1
%  pitch_ps_spec/PeakFreq1
%  pitch_ps_spec/BandPower
%  yaw_ps_spec/PeakAmp1
%  yaw_ps_spec/PeakFreq1
%  yaw_ps_spec/BandPower
%  roll_des_ps_spec/PeakAmp1
%  roll_des_ps_spec/PeakFreq1
%  roll_des_ps_spec/BandPower
%  pitch_des_ps_spec/PeakAmp1
%  pitch_des_ps_spec/PeakFreq1
%  pitch_des_ps_spec/BandPower
%  yaw_des_ps_spec/PeakAmp1
%  yaw_des_ps_spec/PeakFreq1
%  yaw_des_ps_spec/BandPower
%  vibe_x_ps_spec/PeakAmp1
%  vibe_x_ps_spec/PeakFreq1
%  vibe_x_ps_spec/BandPower
%  vibe_y_ps_spec/PeakAmp1
%  vibe_y_ps_spec/PeakFreq1
%  vibe_y_ps_spec/BandPower
%  vibe_z_ps_spec/PeakAmp1
%  vibe_z_ps_spec/PeakFreq1
%  vibe_z_ps_spec/BandPower
%
% Frame Policy:
%  Frame name: FRM_1
%  Frame size: 1 seconds
%  Frame rate: 1 seconds
%
% Organization of the function:
% 1. Compute signals/spectra/features
% 2. Extract computed features into a table
%
% Modify the function to add or remove data processing, feature generation
% or ranking operations.

% Auto-generated by MATLAB on 14-Feb-2025 11:19:25

% Create output ensemble.
outputEnsemble = workspaceEnsemble(inputData,'DataVariables',["acc_x";"acc_y";"acc_z";"gyr_x";"gyr_y";"gyr_z";"pwm_1";"pwm_2";"pwm_3";"pwm_4";"pwm_5";"pwm_6";"roll";"pitch";"yaw";"roll_des";"pitch_des";"yaw_des";"vibe_x";"vibe_y";"vibe_z"],'ConditionVariables',["faultCode_multi";"faultCode_binary";"faultCode_motor"]);

% Reset the ensemble to read from the beginning of the ensemble.
reset(outputEnsemble);

% Append new frame policy name to DataVariables.
outputEnsemble.DataVariables = [outputEnsemble.DataVariables;"FRM_1"];

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = ["acc_x","acc_y","acc_z","gyr_x","gyr_y","gyr_z","pwm_1","pwm_2","pwm_3","pwm_4","pwm_5","pwm_6","roll","pitch","yaw","roll_des","pitch_des","yaw_des","vibe_x","vibe_y","vibe_z"];

% Initialize a cell array to store all the results.
allMembersResult = {};

% Loop through all ensemble members to read and write data.
while hasdata(outputEnsemble)
    % Read one member.
    member = read(outputEnsemble);

    % Read signals.
    acc_x_full = readMemberData(member,"acc_x",["Time","acc_x"]);
    acc_y_full = readMemberData(member,"acc_y",["Time","acc_y"]);
    acc_z_full = readMemberData(member,"acc_z",["Time","acc_z"]);
    gyr_x_full = readMemberData(member,"gyr_x",["Time","gyr_x"]);
    gyr_y_full = readMemberData(member,"gyr_y",["Time","gyr_y"]);
    gyr_z_full = readMemberData(member,"gyr_z",["Time","gyr_z"]);
    pwm_1_full = readMemberData(member,"pwm_1",["Time","pwm_1"]);
    pwm_2_full = readMemberData(member,"pwm_2",["Time","pwm_2"]);
    pwm_3_full = readMemberData(member,"pwm_3",["Time","pwm_3"]);
    pwm_4_full = readMemberData(member,"pwm_4",["Time","pwm_4"]);
    pwm_5_full = readMemberData(member,"pwm_5",["Time","pwm_5"]);
    pwm_6_full = readMemberData(member,"pwm_6",["Time","pwm_6"]);
    roll_full = readMemberData(member,"roll",["Time","roll"]);
    pitch_full = readMemberData(member,"pitch",["Time","pitch"]);
    yaw_full = readMemberData(member,"yaw",["Time","yaw"]);
    roll_des_full = readMemberData(member,"roll_des",["Time","roll_des"]);
    pitch_des_full = readMemberData(member,"pitch_des",["Time","pitch_des"]);
    yaw_des_full = readMemberData(member,"yaw_des",["Time","yaw_des"]);
    vibe_x_full = readMemberData(member,"vibe_x",["Time","vibe_x"]);
    vibe_y_full = readMemberData(member,"vibe_y",["Time","vibe_y"]);
    vibe_z_full = readMemberData(member,"vibe_z",["Time","vibe_z"]);

    % Get the frame intervals.
    lowerBound = min([acc_x_full.Time(1),acc_y_full.Time(1),acc_z_full.Time(1),gyr_x_full.Time(1),gyr_y_full.Time(1),gyr_z_full.Time(1),pwm_1_full.Time(1),pwm_2_full.Time(1),pwm_3_full.Time(1),pwm_4_full.Time(1),pwm_5_full.Time(1),pwm_6_full.Time(1),roll_full.Time(1),pitch_full.Time(1),yaw_full.Time(1),roll_des_full.Time(1),pitch_des_full.Time(1),yaw_des_full.Time(1),vibe_x_full.Time(1),vibe_y_full.Time(1),vibe_z_full.Time(1)]);
    upperBound = max([acc_x_full.Time(end),acc_y_full.Time(end),acc_z_full.Time(end),gyr_x_full.Time(end),gyr_y_full.Time(end),gyr_z_full.Time(end),pwm_1_full.Time(end),pwm_2_full.Time(end),pwm_3_full.Time(end),pwm_4_full.Time(end),pwm_5_full.Time(end),pwm_6_full.Time(end),roll_full.Time(end),pitch_full.Time(end),yaw_full.Time(end),roll_des_full.Time(end),pitch_des_full.Time(end),yaw_des_full.Time(end),vibe_x_full.Time(end),vibe_y_full.Time(end),vibe_z_full.Time(end)]);
    fullIntervals = frameintervals([lowerBound upperBound],1,1,'FrameUnit',"seconds");
    intervals = fullIntervals;

    % Initialize a table to store frame results.
    frames = table;

    % Loop through all frame intervals and compute results.
    for ct = 1:height(intervals)
        % Get all input variables.
        acc_x = acc_x_full(acc_x_full.Time>=intervals{ct,1}&acc_x_full.Time<intervals{ct,2},:);
        acc_y = acc_y_full(acc_y_full.Time>=intervals{ct,1}&acc_y_full.Time<intervals{ct,2},:);
        acc_z = acc_z_full(acc_z_full.Time>=intervals{ct,1}&acc_z_full.Time<intervals{ct,2},:);
        gyr_x = gyr_x_full(gyr_x_full.Time>=intervals{ct,1}&gyr_x_full.Time<intervals{ct,2},:);
        gyr_y = gyr_y_full(gyr_y_full.Time>=intervals{ct,1}&gyr_y_full.Time<intervals{ct,2},:);
        gyr_z = gyr_z_full(gyr_z_full.Time>=intervals{ct,1}&gyr_z_full.Time<intervals{ct,2},:);
        pwm_1 = pwm_1_full(pwm_1_full.Time>=intervals{ct,1}&pwm_1_full.Time<intervals{ct,2},:);
        pwm_2 = pwm_2_full(pwm_2_full.Time>=intervals{ct,1}&pwm_2_full.Time<intervals{ct,2},:);
        pwm_3 = pwm_3_full(pwm_3_full.Time>=intervals{ct,1}&pwm_3_full.Time<intervals{ct,2},:);
        pwm_4 = pwm_4_full(pwm_4_full.Time>=intervals{ct,1}&pwm_4_full.Time<intervals{ct,2},:);
        pwm_5 = pwm_5_full(pwm_5_full.Time>=intervals{ct,1}&pwm_5_full.Time<intervals{ct,2},:);
        pwm_6 = pwm_6_full(pwm_6_full.Time>=intervals{ct,1}&pwm_6_full.Time<intervals{ct,2},:);
        roll = roll_full(roll_full.Time>=intervals{ct,1}&roll_full.Time<intervals{ct,2},:);
        pitch = pitch_full(pitch_full.Time>=intervals{ct,1}&pitch_full.Time<intervals{ct,2},:);
        yaw = yaw_full(yaw_full.Time>=intervals{ct,1}&yaw_full.Time<intervals{ct,2},:);
        roll_des = roll_des_full(roll_des_full.Time>=intervals{ct,1}&roll_des_full.Time<intervals{ct,2},:);
        pitch_des = pitch_des_full(pitch_des_full.Time>=intervals{ct,1}&pitch_des_full.Time<intervals{ct,2},:);
        yaw_des = yaw_des_full(yaw_des_full.Time>=intervals{ct,1}&yaw_des_full.Time<intervals{ct,2},:);
        vibe_x = vibe_x_full(vibe_x_full.Time>=intervals{ct,1}&vibe_x_full.Time<intervals{ct,2},:);
        vibe_y = vibe_y_full(vibe_y_full.Time>=intervals{ct,1}&vibe_y_full.Time<intervals{ct,2},:);
        vibe_z = vibe_z_full(vibe_z_full.Time>=intervals{ct,1}&vibe_z_full.Time<intervals{ct,2},:);

        % Initialize a table to store results for one frame interval.
        frame = intervals(ct,:);

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = acc_x.acc_x;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_x_sigstats},'VariableNames',{'acc_x_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = acc_y.acc_y;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_y_sigstats},'VariableNames',{'acc_y_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = acc_z.acc_z;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            acc_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_z_sigstats},'VariableNames',{'acc_z_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyr_x.gyr_x;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_x_sigstats},'VariableNames',{'gyr_x_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyr_y.gyr_y;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_y_sigstats},'VariableNames',{'gyr_y_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = gyr_z.gyr_z;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            gyr_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_z_sigstats},'VariableNames',{'gyr_z_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_1.pwm_1;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_1_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_1_sigstats},'VariableNames',{'pwm_1_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_2.pwm_2;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_2_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_2_sigstats},'VariableNames',{'pwm_2_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_3.pwm_3;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_3_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_3_sigstats},'VariableNames',{'pwm_3_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_4.pwm_4;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_4_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_4_sigstats},'VariableNames',{'pwm_4_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_5.pwm_5;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_5_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_5_sigstats},'VariableNames',{'pwm_5_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pwm_6.pwm_6;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pwm_6_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_6_sigstats},'VariableNames',{'pwm_6_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = roll.roll;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            roll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            roll_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_sigstats},'VariableNames',{'roll_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pitch.pitch;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pitch_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_sigstats},'VariableNames',{'pitch_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = yaw.yaw;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            yaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            yaw_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_sigstats},'VariableNames',{'yaw_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = roll_des.roll_des;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            roll_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            roll_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_des_sigstats},'VariableNames',{'roll_des_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = pitch_des.pitch_des;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pitch_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            pitch_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_des_sigstats},'VariableNames',{'pitch_des_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = yaw_des.yaw_des;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            yaw_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            yaw_des_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_des_sigstats},'VariableNames',{'yaw_des_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibe_x.vibe_x;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_x_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_x_sigstats},'VariableNames',{'vibe_x_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibe_y.vibe_y;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_y_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_y_sigstats},'VariableNames',{'vibe_y_sigstats'})];

        %% SignalFeatures
        try
            % Compute signal features.
            inputSignal = vibe_z.vibe_z;
            ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
            CrestFactor = peak2rms(inputSignal);
            ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
            Kurtosis = kurtosis(inputSignal);
            Mean = mean(inputSignal,'omitnan');
            PeakValue = max(abs(inputSignal));
            RMS = rms(inputSignal,'omitnan');
            ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
            Skewness = skewness(inputSignal);
            Std = std(inputSignal,'omitnan');

            % Concatenate signal features.
            featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,ShapeFactor,Skewness,Std];

            % Store computed features in a table.
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,10);
            featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','ShapeFactor','Skewness','Std'};
            vibe_z_sigstats = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_z_sigstats},'VariableNames',{'vibe_z_sigstats'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(acc_x.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = acc_x.acc_x;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            acc_x_ps = ps;
        catch
            acc_x_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_x_ps},'VariableNames',{'acc_x_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(acc_y.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = acc_y.acc_y;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            acc_y_ps = ps;
        catch
            acc_y_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_y_ps},'VariableNames',{'acc_y_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(acc_z.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = acc_z.acc_z;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            acc_z_ps = ps;
        catch
            acc_z_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_z_ps},'VariableNames',{'acc_z_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyr_x.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyr_x.gyr_x;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyr_x_ps = ps;
        catch
            gyr_x_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_x_ps},'VariableNames',{'gyr_x_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyr_y.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyr_y.gyr_y;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyr_y_ps = ps;
        catch
            gyr_y_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_y_ps},'VariableNames',{'gyr_y_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(gyr_z.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = gyr_z.gyr_z;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            gyr_z_ps = ps;
        catch
            gyr_z_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_z_ps},'VariableNames',{'gyr_z_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_1.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_1.pwm_1;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_1_ps = ps;
        catch
            pwm_1_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_1_ps},'VariableNames',{'pwm_1_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_2.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_2.pwm_2;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_2_ps = ps;
        catch
            pwm_2_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_2_ps},'VariableNames',{'pwm_2_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_3.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_3.pwm_3;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_3_ps = ps;
        catch
            pwm_3_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_3_ps},'VariableNames',{'pwm_3_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_4.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_4.pwm_4;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_4_ps = ps;
        catch
            pwm_4_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_4_ps},'VariableNames',{'pwm_4_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_5.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_5.pwm_5;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_5_ps = ps;
        catch
            pwm_5_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_5_ps},'VariableNames',{'pwm_5_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pwm_6.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pwm_6.pwm_6;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pwm_6_ps = ps;
        catch
            pwm_6_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_6_ps},'VariableNames',{'pwm_6_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(roll.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = roll.roll;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            roll_ps = ps;
        catch
            roll_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_ps},'VariableNames',{'roll_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pitch.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pitch.pitch;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pitch_ps = ps;
        catch
            pitch_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_ps},'VariableNames',{'pitch_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(yaw.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = yaw.yaw;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            yaw_ps = ps;
        catch
            yaw_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_ps},'VariableNames',{'yaw_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(roll_des.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = roll_des.roll_des;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            roll_des_ps = ps;
        catch
            roll_des_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_des_ps},'VariableNames',{'roll_des_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(pitch_des.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = pitch_des.pitch_des;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            pitch_des_ps = ps;
        catch
            pitch_des_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_des_ps},'VariableNames',{'pitch_des_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(yaw_des.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = yaw_des.yaw_des;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            yaw_des_ps = ps;
        catch
            yaw_des_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_des_ps},'VariableNames',{'yaw_des_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibe_x.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibe_x.vibe_x;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibe_x_ps = ps;
        catch
            vibe_x_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_x_ps},'VariableNames',{'vibe_x_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibe_y.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibe_y.vibe_y;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibe_y_ps = ps;
        catch
            vibe_y_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_y_ps},'VariableNames',{'vibe_y_ps'})];

        %% PowerSpectrum
        try
            % Get units to use in computed spectrum.
            tuReal = "seconds";
            tuTime = tuReal;

            % Compute effective sampling rate.
            tNumeric = time2num(vibe_z.Time,tuReal);
            [Fs,irregular] = effectivefs(tNumeric);
            Ts = 1/Fs;

            % Resample non-uniform signals.
            x_raw = vibe_z.vibe_z;
            if irregular
                x = resample(x_raw,tNumeric,Fs,'linear');
            else
                x = x_raw;
            end

            % Compute the autoregressive model.
            data = iddata(x,[],Ts,'TimeUnit',tuTime,'OutputName','SpectrumData');
            arOpt = arOptions('Approach','fb','Window','now','EstimateCovariance',false);
            model = ar(data,4,arOpt);

            % Compute the power spectrum.
            [ps,w] = spectrum(model);
            ps = reshape(ps, numel(ps), 1);

            % Convert frequency unit.
            factor = funitconv('rad/TimeUnit', 'Hz', 'seconds');
            w = factor*w;
            Fs = 2*pi*factor*Fs;

            % Remove frequencies above Nyquist frequency.
            I = w<=(Fs/2+1e4*eps);
            w = w(I);
            ps = ps(I);

            % Configure the computed spectrum.
            ps = table(w, ps, 'VariableNames', {'Frequency', 'SpectrumData'});
            ps.Properties.VariableUnits = {'Hz', ''};
            ps = addprop(ps, {'SampleFrequency'}, {'table'});
            ps.Properties.CustomProperties.SampleFrequency = Fs;
            vibe_z_ps = ps;
        catch
            vibe_z_ps = table(NaN, NaN, 'VariableNames', {'Frequency', 'SpectrumData'});
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_z_ps},'VariableNames',{'vibe_z_ps'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = acc_x_ps.SpectrumData;
            w = acc_x_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_x_ps_spec},'VariableNames',{'acc_x_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = acc_y_ps.SpectrumData;
            w = acc_y_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_y_ps_spec},'VariableNames',{'acc_y_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = acc_z_ps.SpectrumData;
            w = acc_z_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            acc_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({acc_z_ps_spec},'VariableNames',{'acc_z_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyr_x_ps.SpectrumData;
            w = gyr_x_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_x_ps_spec},'VariableNames',{'gyr_x_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyr_y_ps.SpectrumData;
            w = gyr_y_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_y_ps_spec},'VariableNames',{'gyr_y_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = gyr_z_ps.SpectrumData;
            w = gyr_z_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            gyr_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({gyr_z_ps_spec},'VariableNames',{'gyr_z_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_1_ps.SpectrumData;
            w = pwm_1_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_1_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_1_ps_spec},'VariableNames',{'pwm_1_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_2_ps.SpectrumData;
            w = pwm_2_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_2_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_2_ps_spec},'VariableNames',{'pwm_2_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_3_ps.SpectrumData;
            w = pwm_3_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_3_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_3_ps_spec},'VariableNames',{'pwm_3_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_4_ps.SpectrumData;
            w = pwm_4_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_4_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_4_ps_spec},'VariableNames',{'pwm_4_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_5_ps.SpectrumData;
            w = pwm_5_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_5_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_5_ps_spec},'VariableNames',{'pwm_5_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pwm_6_ps.SpectrumData;
            w = pwm_6_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pwm_6_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pwm_6_ps_spec},'VariableNames',{'pwm_6_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = roll_ps.SpectrumData;
            w = roll_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            roll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            roll_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_ps_spec},'VariableNames',{'roll_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pitch_ps.SpectrumData;
            w = pitch_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pitch_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_ps_spec},'VariableNames',{'pitch_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = yaw_ps.SpectrumData;
            w = yaw_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            yaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            yaw_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_ps_spec},'VariableNames',{'yaw_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = roll_des_ps.SpectrumData;
            w = roll_des_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            roll_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            roll_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({roll_des_ps_spec},'VariableNames',{'roll_des_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = pitch_des_ps.SpectrumData;
            w = pitch_des_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pitch_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            pitch_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({pitch_des_ps_spec},'VariableNames',{'pitch_des_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = yaw_des_ps.SpectrumData;
            w = yaw_des_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            yaw_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            yaw_des_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({yaw_des_ps_spec},'VariableNames',{'yaw_des_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibe_x_ps.SpectrumData;
            w = vibe_x_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_x_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_x_ps_spec},'VariableNames',{'vibe_x_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibe_y_ps.SpectrumData;
            w = vibe_y_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_y_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_y_ps_spec},'VariableNames',{'vibe_y_ps_spec'})];

        %% SpectrumFeatures
        try
            % Compute spectral features.
            % Get frequency unit conversion factor.
            factor = funitconv('Hz', 'rad/TimeUnit', 'seconds');
            ps = vibe_z_ps.SpectrumData;
            w = vibe_z_ps.Frequency;
            w = factor*w;
            mask_1 = (w>=factor*0.00159154943091895) & (w<=factor*175.000000000035);
            ps = ps(mask_1);
            w = w(mask_1);

            % Compute spectral peaks.
            [peakAmp,peakFreq] = findpeaks(ps,w/factor,'MinPeakHeight',-Inf, ...
                'MinPeakProminence',0,'MinPeakDistance',0.001,'SortStr','descend','NPeaks',1);
            peakAmp = [peakAmp(:); NaN(1-numel(peakAmp),1)];
            peakFreq = [peakFreq(:); NaN(1-numel(peakFreq),1)];

            % Extract individual feature values.
            PeakAmp1 = peakAmp(1);
            PeakFreq1 = peakFreq(1);
            BandPower = trapz(w/factor,ps);

            % Concatenate signal features.
            featureValues = [PeakAmp1,PeakFreq1,BandPower];

            % Store computed features in a table.
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        catch
            % Store computed features in a table.
            featureValues = NaN(1,3);
            featureNames = {'PeakAmp1','PeakFreq1','BandPower'};
            vibe_z_ps_spec = array2table(featureValues,'VariableNames',featureNames);
        end

        % Append computed results to the frame table.
        frame = [frame, ...
            table({vibe_z_ps_spec},'VariableNames',{'vibe_z_ps_spec'})];

        %% Concatenate frames.
        frames = [frames;frame]; %#ok<*AGROW>
    end
    % Append all member results to the cell array.
    memberResult = table({frames},'VariableNames',"FRM_1");
    allMembersResult = [allMembersResult; {memberResult}]; %#ok<AGROW>
end

% Write the results for all members to the ensemble.
writeToMembers(outputEnsemble,allMembersResult)

% Gather all features into a table.
selectedFeatureNames = ["FRM_1/acc_x_sigstats/ClearanceFactor","FRM_1/acc_x_sigstats/CrestFactor","FRM_1/acc_x_sigstats/ImpulseFactor","FRM_1/acc_x_sigstats/Kurtosis","FRM_1/acc_x_sigstats/Mean","FRM_1/acc_x_sigstats/PeakValue","FRM_1/acc_x_sigstats/RMS","FRM_1/acc_x_sigstats/ShapeFactor","FRM_1/acc_x_sigstats/Skewness","FRM_1/acc_x_sigstats/Std","FRM_1/acc_y_sigstats/ClearanceFactor","FRM_1/acc_y_sigstats/CrestFactor","FRM_1/acc_y_sigstats/ImpulseFactor","FRM_1/acc_y_sigstats/Kurtosis","FRM_1/acc_y_sigstats/Mean","FRM_1/acc_y_sigstats/PeakValue","FRM_1/acc_y_sigstats/RMS","FRM_1/acc_y_sigstats/ShapeFactor","FRM_1/acc_y_sigstats/Skewness","FRM_1/acc_y_sigstats/Std","FRM_1/acc_z_sigstats/ClearanceFactor","FRM_1/acc_z_sigstats/CrestFactor","FRM_1/acc_z_sigstats/ImpulseFactor","FRM_1/acc_z_sigstats/Kurtosis","FRM_1/acc_z_sigstats/Mean","FRM_1/acc_z_sigstats/PeakValue","FRM_1/acc_z_sigstats/RMS","FRM_1/acc_z_sigstats/ShapeFactor","FRM_1/acc_z_sigstats/Skewness","FRM_1/acc_z_sigstats/Std","FRM_1/gyr_x_sigstats/ClearanceFactor","FRM_1/gyr_x_sigstats/CrestFactor","FRM_1/gyr_x_sigstats/ImpulseFactor","FRM_1/gyr_x_sigstats/Kurtosis","FRM_1/gyr_x_sigstats/Mean","FRM_1/gyr_x_sigstats/PeakValue","FRM_1/gyr_x_sigstats/RMS","FRM_1/gyr_x_sigstats/ShapeFactor","FRM_1/gyr_x_sigstats/Skewness","FRM_1/gyr_x_sigstats/Std","FRM_1/gyr_y_sigstats/ClearanceFactor","FRM_1/gyr_y_sigstats/CrestFactor","FRM_1/gyr_y_sigstats/ImpulseFactor","FRM_1/gyr_y_sigstats/Kurtosis","FRM_1/gyr_y_sigstats/Mean","FRM_1/gyr_y_sigstats/PeakValue","FRM_1/gyr_y_sigstats/RMS","FRM_1/gyr_y_sigstats/ShapeFactor","FRM_1/gyr_y_sigstats/Skewness","FRM_1/gyr_y_sigstats/Std","FRM_1/gyr_z_sigstats/ClearanceFactor","FRM_1/gyr_z_sigstats/CrestFactor","FRM_1/gyr_z_sigstats/ImpulseFactor","FRM_1/gyr_z_sigstats/Kurtosis","FRM_1/gyr_z_sigstats/Mean","FRM_1/gyr_z_sigstats/PeakValue","FRM_1/gyr_z_sigstats/RMS","FRM_1/gyr_z_sigstats/ShapeFactor","FRM_1/gyr_z_sigstats/Skewness","FRM_1/gyr_z_sigstats/Std","FRM_1/pwm_1_sigstats/ClearanceFactor","FRM_1/pwm_1_sigstats/CrestFactor","FRM_1/pwm_1_sigstats/ImpulseFactor","FRM_1/pwm_1_sigstats/Kurtosis","FRM_1/pwm_1_sigstats/Mean","FRM_1/pwm_1_sigstats/PeakValue","FRM_1/pwm_1_sigstats/RMS","FRM_1/pwm_1_sigstats/ShapeFactor","FRM_1/pwm_1_sigstats/Skewness","FRM_1/pwm_1_sigstats/Std","FRM_1/pwm_2_sigstats/ClearanceFactor","FRM_1/pwm_2_sigstats/CrestFactor","FRM_1/pwm_2_sigstats/ImpulseFactor","FRM_1/pwm_2_sigstats/Kurtosis","FRM_1/pwm_2_sigstats/Mean","FRM_1/pwm_2_sigstats/PeakValue","FRM_1/pwm_2_sigstats/RMS","FRM_1/pwm_2_sigstats/ShapeFactor","FRM_1/pwm_2_sigstats/Skewness","FRM_1/pwm_2_sigstats/Std","FRM_1/pwm_3_sigstats/ClearanceFactor","FRM_1/pwm_3_sigstats/CrestFactor","FRM_1/pwm_3_sigstats/ImpulseFactor","FRM_1/pwm_3_sigstats/Kurtosis","FRM_1/pwm_3_sigstats/Mean","FRM_1/pwm_3_sigstats/PeakValue","FRM_1/pwm_3_sigstats/RMS","FRM_1/pwm_3_sigstats/ShapeFactor","FRM_1/pwm_3_sigstats/Skewness","FRM_1/pwm_3_sigstats/Std","FRM_1/pwm_4_sigstats/ClearanceFactor","FRM_1/pwm_4_sigstats/CrestFactor","FRM_1/pwm_4_sigstats/ImpulseFactor","FRM_1/pwm_4_sigstats/Kurtosis","FRM_1/pwm_4_sigstats/Mean","FRM_1/pwm_4_sigstats/PeakValue","FRM_1/pwm_4_sigstats/RMS","FRM_1/pwm_4_sigstats/ShapeFactor","FRM_1/pwm_4_sigstats/Skewness","FRM_1/pwm_4_sigstats/Std","FRM_1/pwm_5_sigstats/ClearanceFactor","FRM_1/pwm_5_sigstats/CrestFactor","FRM_1/pwm_5_sigstats/ImpulseFactor","FRM_1/pwm_5_sigstats/Kurtosis","FRM_1/pwm_5_sigstats/Mean","FRM_1/pwm_5_sigstats/PeakValue","FRM_1/pwm_5_sigstats/RMS","FRM_1/pwm_5_sigstats/ShapeFactor","FRM_1/pwm_5_sigstats/Skewness","FRM_1/pwm_5_sigstats/Std","FRM_1/pwm_6_sigstats/ClearanceFactor","FRM_1/pwm_6_sigstats/CrestFactor","FRM_1/pwm_6_sigstats/ImpulseFactor","FRM_1/pwm_6_sigstats/Kurtosis","FRM_1/pwm_6_sigstats/Mean","FRM_1/pwm_6_sigstats/PeakValue","FRM_1/pwm_6_sigstats/RMS","FRM_1/pwm_6_sigstats/ShapeFactor","FRM_1/pwm_6_sigstats/Skewness","FRM_1/pwm_6_sigstats/Std","FRM_1/roll_sigstats/ClearanceFactor","FRM_1/roll_sigstats/CrestFactor","FRM_1/roll_sigstats/ImpulseFactor","FRM_1/roll_sigstats/Kurtosis","FRM_1/roll_sigstats/Mean","FRM_1/roll_sigstats/PeakValue","FRM_1/roll_sigstats/RMS","FRM_1/roll_sigstats/ShapeFactor","FRM_1/roll_sigstats/Skewness","FRM_1/roll_sigstats/Std","FRM_1/pitch_sigstats/ClearanceFactor","FRM_1/pitch_sigstats/CrestFactor","FRM_1/pitch_sigstats/ImpulseFactor","FRM_1/pitch_sigstats/Kurtosis","FRM_1/pitch_sigstats/Mean","FRM_1/pitch_sigstats/PeakValue","FRM_1/pitch_sigstats/RMS","FRM_1/pitch_sigstats/ShapeFactor","FRM_1/pitch_sigstats/Skewness","FRM_1/pitch_sigstats/Std","FRM_1/yaw_sigstats/ClearanceFactor","FRM_1/yaw_sigstats/CrestFactor","FRM_1/yaw_sigstats/ImpulseFactor","FRM_1/yaw_sigstats/Kurtosis","FRM_1/yaw_sigstats/Mean","FRM_1/yaw_sigstats/PeakValue","FRM_1/yaw_sigstats/RMS","FRM_1/yaw_sigstats/ShapeFactor","FRM_1/yaw_sigstats/Skewness","FRM_1/yaw_sigstats/Std","FRM_1/roll_des_sigstats/ClearanceFactor","FRM_1/roll_des_sigstats/CrestFactor","FRM_1/roll_des_sigstats/ImpulseFactor","FRM_1/roll_des_sigstats/Kurtosis","FRM_1/roll_des_sigstats/Mean","FRM_1/roll_des_sigstats/PeakValue","FRM_1/roll_des_sigstats/RMS","FRM_1/roll_des_sigstats/ShapeFactor","FRM_1/roll_des_sigstats/Skewness","FRM_1/roll_des_sigstats/Std","FRM_1/pitch_des_sigstats/ClearanceFactor","FRM_1/pitch_des_sigstats/CrestFactor","FRM_1/pitch_des_sigstats/ImpulseFactor","FRM_1/pitch_des_sigstats/Kurtosis","FRM_1/pitch_des_sigstats/Mean","FRM_1/pitch_des_sigstats/PeakValue","FRM_1/pitch_des_sigstats/RMS","FRM_1/pitch_des_sigstats/ShapeFactor","FRM_1/pitch_des_sigstats/Skewness","FRM_1/pitch_des_sigstats/Std","FRM_1/yaw_des_sigstats/ClearanceFactor","FRM_1/yaw_des_sigstats/CrestFactor","FRM_1/yaw_des_sigstats/ImpulseFactor","FRM_1/yaw_des_sigstats/Kurtosis","FRM_1/yaw_des_sigstats/Mean","FRM_1/yaw_des_sigstats/PeakValue","FRM_1/yaw_des_sigstats/RMS","FRM_1/yaw_des_sigstats/ShapeFactor","FRM_1/yaw_des_sigstats/Skewness","FRM_1/yaw_des_sigstats/Std","FRM_1/vibe_x_sigstats/ClearanceFactor","FRM_1/vibe_x_sigstats/CrestFactor","FRM_1/vibe_x_sigstats/ImpulseFactor","FRM_1/vibe_x_sigstats/Kurtosis","FRM_1/vibe_x_sigstats/Mean","FRM_1/vibe_x_sigstats/PeakValue","FRM_1/vibe_x_sigstats/RMS","FRM_1/vibe_x_sigstats/ShapeFactor","FRM_1/vibe_x_sigstats/Skewness","FRM_1/vibe_x_sigstats/Std","FRM_1/vibe_y_sigstats/ClearanceFactor","FRM_1/vibe_y_sigstats/CrestFactor","FRM_1/vibe_y_sigstats/ImpulseFactor","FRM_1/vibe_y_sigstats/Kurtosis","FRM_1/vibe_y_sigstats/Mean","FRM_1/vibe_y_sigstats/PeakValue","FRM_1/vibe_y_sigstats/RMS","FRM_1/vibe_y_sigstats/ShapeFactor","FRM_1/vibe_y_sigstats/Skewness","FRM_1/vibe_y_sigstats/Std","FRM_1/vibe_z_sigstats/ClearanceFactor","FRM_1/vibe_z_sigstats/CrestFactor","FRM_1/vibe_z_sigstats/ImpulseFactor","FRM_1/vibe_z_sigstats/Kurtosis","FRM_1/vibe_z_sigstats/Mean","FRM_1/vibe_z_sigstats/PeakValue","FRM_1/vibe_z_sigstats/RMS","FRM_1/vibe_z_sigstats/ShapeFactor","FRM_1/vibe_z_sigstats/Skewness","FRM_1/vibe_z_sigstats/Std","FRM_1/acc_x_ps_spec/PeakAmp1","FRM_1/acc_x_ps_spec/PeakFreq1","FRM_1/acc_x_ps_spec/BandPower","FRM_1/acc_y_ps_spec/PeakAmp1","FRM_1/acc_y_ps_spec/PeakFreq1","FRM_1/acc_y_ps_spec/BandPower","FRM_1/acc_z_ps_spec/PeakAmp1","FRM_1/acc_z_ps_spec/PeakFreq1","FRM_1/acc_z_ps_spec/BandPower","FRM_1/gyr_x_ps_spec/PeakAmp1","FRM_1/gyr_x_ps_spec/PeakFreq1","FRM_1/gyr_x_ps_spec/BandPower","FRM_1/gyr_y_ps_spec/PeakAmp1","FRM_1/gyr_y_ps_spec/PeakFreq1","FRM_1/gyr_y_ps_spec/BandPower","FRM_1/gyr_z_ps_spec/PeakAmp1","FRM_1/gyr_z_ps_spec/PeakFreq1","FRM_1/gyr_z_ps_spec/BandPower","FRM_1/pwm_1_ps_spec/PeakAmp1","FRM_1/pwm_1_ps_spec/PeakFreq1","FRM_1/pwm_1_ps_spec/BandPower","FRM_1/pwm_2_ps_spec/PeakAmp1","FRM_1/pwm_2_ps_spec/PeakFreq1","FRM_1/pwm_2_ps_spec/BandPower","FRM_1/pwm_3_ps_spec/PeakAmp1","FRM_1/pwm_3_ps_spec/PeakFreq1","FRM_1/pwm_3_ps_spec/BandPower","FRM_1/pwm_4_ps_spec/PeakAmp1","FRM_1/pwm_4_ps_spec/PeakFreq1","FRM_1/pwm_4_ps_spec/BandPower","FRM_1/pwm_5_ps_spec/PeakAmp1","FRM_1/pwm_5_ps_spec/PeakFreq1","FRM_1/pwm_5_ps_spec/BandPower","FRM_1/pwm_6_ps_spec/PeakAmp1","FRM_1/pwm_6_ps_spec/PeakFreq1","FRM_1/pwm_6_ps_spec/BandPower","FRM_1/roll_ps_spec/PeakAmp1","FRM_1/roll_ps_spec/PeakFreq1","FRM_1/roll_ps_spec/BandPower","FRM_1/pitch_ps_spec/PeakAmp1","FRM_1/pitch_ps_spec/PeakFreq1","FRM_1/pitch_ps_spec/BandPower","FRM_1/yaw_ps_spec/PeakAmp1","FRM_1/yaw_ps_spec/PeakFreq1","FRM_1/yaw_ps_spec/BandPower","FRM_1/roll_des_ps_spec/PeakAmp1","FRM_1/roll_des_ps_spec/PeakFreq1","FRM_1/roll_des_ps_spec/BandPower","FRM_1/pitch_des_ps_spec/PeakAmp1","FRM_1/pitch_des_ps_spec/PeakFreq1","FRM_1/pitch_des_ps_spec/BandPower","FRM_1/yaw_des_ps_spec/PeakAmp1","FRM_1/yaw_des_ps_spec/PeakFreq1","FRM_1/yaw_des_ps_spec/BandPower","FRM_1/vibe_x_ps_spec/PeakAmp1","FRM_1/vibe_x_ps_spec/PeakFreq1","FRM_1/vibe_x_ps_spec/BandPower","FRM_1/vibe_y_ps_spec/PeakAmp1","FRM_1/vibe_y_ps_spec/PeakFreq1","FRM_1/vibe_y_ps_spec/BandPower","FRM_1/vibe_z_ps_spec/PeakAmp1","FRM_1/vibe_z_ps_spec/PeakFreq1","FRM_1/vibe_z_ps_spec/BandPower"];
featureTable = readFeatureTable(outputEnsemble,"FRM_1",'Features',selectedFeatureNames,'ConditionVariables',outputEnsemble.ConditionVariables,'IncludeMemberID',true);

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = unique([outputEnsemble.DataVariables;outputEnsemble.ConditionVariables;outputEnsemble.IndependentVariables],'stable');

% Gather results into a table.
if nargout > 1
    outputTable = readall(outputEnsemble);
end
end
