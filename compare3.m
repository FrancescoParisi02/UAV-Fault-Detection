function [in1, in2, in3] = compare3(in1, in2, in3)

    % Get common timestamps (columns 2 is TimeUS)
    common_timestamps = intersect(intersect(in1(:,2), in2(:,2)), in3(:,2));

    % Filter by common timestamps
    function data = filter_by_timestamp(data, timestamps)
        data = data(ismember(data(:,2), timestamps), :);
    end

    in1 = filter_by_timestamp(in1, common_timestamps);
    in2 = filter_by_timestamp(in2, common_timestamps);
    in3 = filter_by_timestamp(in3, common_timestamps);

    % Verify synchronization
    if ~(isequal(in1(:,2), in2(:,2)) && isequal(in1(:,2), in3(:,2)))
        error("Inputs to be averaged do not share the same timestamps.");
    end
end