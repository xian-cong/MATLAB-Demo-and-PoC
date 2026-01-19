function csv_reader()
    % Runs in MATLAB, NOT in generated code

    % Create persistent timer
    persistent t
    if isempty(t)
        t = timer( ...
            'ExecutionMode', 'fixedSpacing', ...
            'Period', 5, ...            % 5 seconds (change to 900 later)
            'TimerFcn', @updateData);
        start(t);
    end
end

function updateData(~, ~)
    try
        fid = fopen('input_data.csv','r');
        if fid == -1
            return;
        end

        line = fgetl(fid);
        fclose(fid);

        if ~ischar(line)
            return;
        end

        values = sscanf(line, '%f,%f,%f');

        if numel(values) == 3
            assignin('base','csvData',values(:));
        end
    catch
        % Fail silently or log if you want
    end
end
