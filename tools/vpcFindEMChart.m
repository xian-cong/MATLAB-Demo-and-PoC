function chart = vpcFindEMChart(blkPath)
%VPCFINDEMCHART Stateflow object behind a MATLAB Function block.
%
%   chart = VPCFINDEMCHART(blkPath) returns the Stateflow.EMChart whose Script
%   property holds the source of the MATLAB Function block at blkPath.
%
%   The chart's Path property is the block's full path, so it is compared
%   directly. Charts belonging to the eml_lib library are skipped implicitly by
%   the exact match.

charts = sfroot().find('-isa','Stateflow.EMChart');
for k = 1:numel(charts)
    try
        if strcmp(charts(k).Path, blkPath)
            chart = charts(k);
            return
        end
    catch
        % Charts owned by closed or unloaded models can throw here; skip them.
    end
end

error('vpc:chartNotFound','No MATLAB Function block found at "%s".', blkPath);
end
