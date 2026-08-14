classdef VesselCertApp < matlab.apps.AppBase
%VESSELCERTAPP Vessel electrical power system verification tool.
%   Browser-facing front end for the Simulink model vesselPowerCert. A surveyor
%   enters the vessel particulars and operating profile, selects which variant of
%   each major component is fitted, runs the simulation, and reads a pass/fail
%   verification report.
%   See also vpcRunCertification, vpcBuildModel, vpcBuildReport.

    % DO NOT put a blank "%" line in the class help block above.
    %
    % App Designer's loader (HelpCommentsParser) strips 3 leading characters from
    % every help description line with extractAfter(line, 3). A bare "%" line
    % becomes a zero-length string, so that call throws
    %     "Numeric value exceeds the number of characters in element N."
    % and the app cannot be opened in App Designer at all - though it still runs,
    % because running never goes through that parser. The help block is therefore
    % kept free of blank comment lines, and everything else lives down here, below
    % the blank line that ends the help text.
    %
    % Deployment notes. Designed to be compiled with MATLAB Compiler
    % (compiler.build.webAppArchive) and hosted on MATLAB Web App Server, so:
    %   * no uigetfile/uiputfile/uiimport anywhere - file dialogs do not exist in
    %     a browser session, and the report is exported through the browser's own
    %     print-to-PDF instead;
    %   * no addpath or cd at run time - MATLAB Compiler forbids path changes;
    %   * no Simulink.VariantControl objects - that class is excluded from
    %     packaging, so variant selections are pushed as plain numbers.


    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                matlab.ui.Figure
        MainGrid                matlab.ui.container.GridLayout
        ConfigPanel             matlab.ui.container.Panel
        ConfigGrid              matlab.ui.container.GridLayout

        VesselHeader            matlab.ui.control.Label
        NameLabel               matlab.ui.control.Label
        NameField               matlab.ui.control.EditField
        ImoLabel                matlab.ui.control.Label
        ImoField                matlab.ui.control.EditField
        DispLabel               matlab.ui.control.Label
        DispField               matlab.ui.control.NumericEditField
        SpeedLabel              matlab.ui.control.Label
        SpeedField              matlab.ui.control.NumericEditField
        PropPowerLabel          matlab.ui.control.Label
        PropPowerField          matlab.ui.control.NumericEditField
        HotelLabel              matlab.ui.control.Label
        HotelField              matlab.ui.control.NumericEditField

        VariantHeader           matlab.ui.control.Label
        ArchLabel               matlab.ui.control.Label
        ArchDropDown            matlab.ui.control.DropDown
        EssLabel                matlab.ui.control.Label
        EssDropDown             matlab.ui.control.DropDown
        GenLabel                matlab.ui.control.Label
        GenDropDown             matlab.ui.control.DropDown
        ShoreLabel              matlab.ui.control.Label
        ShoreDropDown           matlab.ui.control.DropDown

        PlantHeader             matlab.ui.control.Label
        GenUnitLabel            matlab.ui.control.Label
        GenUnitField            matlab.ui.control.NumericEditField
        EssEnergyLabel          matlab.ui.control.Label
        EssEnergyField          matlab.ui.control.NumericEditField
        EssPowerLabel           matlab.ui.control.Label
        EssPowerField           matlab.ui.control.NumericEditField
        ShorePowerLabel         matlab.ui.control.Label
        ShorePowerField         matlab.ui.control.NumericEditField
        DpBaseLabel             matlab.ui.control.Label
        DpBaseField             matlab.ui.control.NumericEditField
        DpRippleLabel           matlab.ui.control.Label
        DpRippleField           matlab.ui.control.NumericEditField

        LimitsHeader            matlab.ui.control.Label
        FuelBudgetLabel         matlab.ui.control.Label
        FuelBudgetField         matlab.ui.control.NumericEditField
        CiiLimitLabel           matlab.ui.control.Label
        CiiLimitField           matlab.ui.control.NumericEditField
        ReserveLabel            matlab.ui.control.Label
        ReserveField            matlab.ui.control.NumericEditField

        ProfileHeader           matlab.ui.control.Label
        ProfileHint             matlab.ui.control.Label
        ProfileTable            matlab.ui.control.Table

        ButtonGrid              matlab.ui.container.GridLayout
        RunButton               matlab.ui.control.Button
        ResetButton             matlab.ui.control.Button

        ResultTabs              matlab.ui.container.TabGroup
        VerdictTab              matlab.ui.container.Tab
        VerdictGrid             matlab.ui.container.GridLayout
        VerdictLabel            matlab.ui.control.Label
        SummaryLabel            matlab.ui.control.Label
        FindingsTable           matlab.ui.control.Table

        PowerTab                matlab.ui.container.Tab
        PowerGrid               matlab.ui.container.GridLayout
        PowerAxes               matlab.ui.control.UIAxes
        SplitAxes               matlab.ui.control.UIAxes

        GenTab                  matlab.ui.container.Tab
        GenGrid                 matlab.ui.container.GridLayout
        GenLoadAxes             matlab.ui.control.UIAxes
        GenCountAxes            matlab.ui.control.UIAxes

        StorageTab              matlab.ui.container.Tab
        StorageGrid             matlab.ui.container.GridLayout
        SocAxes                 matlab.ui.control.UIAxes
        EssPowerAxes            matlab.ui.control.UIAxes

        ReportTab               matlab.ui.container.Tab
        ReportGrid              matlab.ui.container.GridLayout
        ReportHtml              matlab.ui.control.HTML
    end

    properties (Access = private)
        Results = []          % most recent vpcRunCertification output
    end

    properties (Constant, Access = private)
        ArchItems  = {'Direct mechanical drive','Diesel-electric','Hybrid PTI/PTO'}
        EssItems   = {'None','Li-ion battery','Supercapacitor'}
        GenItems   = {'2 x generator sets','3 x generator sets','4 x generator sets'}
        ShoreItems = {'None','Cold ironing'}
    end

    methods (Access = private)

        function loadDefaults(app)
            cfg = vpcDefaultConfig();

            app.NameField.Value      = cfg.vessel.name;
            app.ImoField.Value       = cfg.vessel.imo;
            app.DispField.Value      = cfg.vessel.displacement_t;
            app.SpeedField.Value     = cfg.vessel.designSpeed_kn;
            app.PropPowerField.Value = cfg.vessel.propPower_kW;
            app.HotelField.Value     = cfg.vessel.hotelBase_kW;

            app.ArchDropDown.Value  = app.ArchItems{cfg.variants.propulsionArch};
            app.EssDropDown.Value   = app.EssItems{cfg.variants.energyStorage};
            app.GenDropDown.Value   = app.GenItems{cfg.variants.genSetConfig};
            app.ShoreDropDown.Value = app.ShoreItems{cfg.variants.shorePower};

            app.GenUnitField.Value    = cfg.plant.genUnitPower_kW;
            app.EssEnergyField.Value  = cfg.plant.essEnergy_kWh;
            app.EssPowerField.Value   = cfg.plant.essPower_kW;
            app.ShorePowerField.Value = cfg.plant.shorePower_kW;
            app.DpBaseField.Value     = cfg.plant.dpBase_kW;
            app.DpRippleField.Value   = cfg.plant.dpRippleAmp_kW;

            app.FuelBudgetField.Value = cfg.limits.fuelBudget_t;
            app.CiiLimitField.Value   = cfg.limits.co2Intensity_max;
            app.ReserveField.Value    = 100*cfg.limits.spinReserveMin;

            app.ProfileTable.Data = [cfg.profile.mode(:), cfg.profile.hours(:), ...
                cfg.profile.speed_kn(:), cfg.profile.hotelFactor(:), ...
                cfg.profile.seaState(:)];
        end

        % -----------------------------------------------------------------
        function cfg = readConfig(app)
            cfg = vpcDefaultConfig();

            cfg.vessel.name           = app.NameField.Value;
            cfg.vessel.imo            = app.ImoField.Value;
            cfg.vessel.displacement_t = app.DispField.Value;
            cfg.vessel.designSpeed_kn = app.SpeedField.Value;
            cfg.vessel.propPower_kW   = app.PropPowerField.Value;
            cfg.vessel.hotelBase_kW   = app.HotelField.Value;

            cfg.variants.propulsionArch = idxOf(app, app.ArchItems,  app.ArchDropDown.Value);
            cfg.variants.energyStorage  = idxOf(app, app.EssItems,   app.EssDropDown.Value);
            cfg.variants.genSetConfig   = idxOf(app, app.GenItems,   app.GenDropDown.Value);
            cfg.variants.shorePower     = idxOf(app, app.ShoreItems, app.ShoreDropDown.Value);

            cfg.plant.genUnitPower_kW = app.GenUnitField.Value;
            cfg.plant.essEnergy_kWh   = app.EssEnergyField.Value;
            cfg.plant.essPower_kW     = app.EssPowerField.Value;
            cfg.plant.shorePower_kW   = app.ShorePowerField.Value;
            cfg.plant.dpBase_kW       = app.DpBaseField.Value;
            cfg.plant.dpRippleAmp_kW  = app.DpRippleField.Value;

            cfg.limits.fuelBudget_t     = app.FuelBudgetField.Value;
            cfg.limits.co2Intensity_max = app.CiiLimitField.Value;
            cfg.limits.spinReserveMin   = app.ReserveField.Value/100;

            d = app.ProfileTable.Data;
            cfg.profile.mode        = max(1,min(4,round(d(:,1)')));
            cfg.profile.hours       = max(0.1, d(:,2)');
            cfg.profile.speed_kn    = max(0,   d(:,3)');
            cfg.profile.hotelFactor = max(0,   d(:,4)');
            cfg.profile.seaState    = max(0,min(6, d(:,5)'));
        end

        % -----------------------------------------------------------------
        function showResults(app)
            res = app.Results;
            m   = res.metrics;

            switch res.verdict
                case 'PASS'
                    app.VerdictLabel.BackgroundColor = [0.89 0.96 0.90];
                    app.VerdictLabel.FontColor       = [0.10 0.42 0.16];
                case 'PASS WITH OBSERVATIONS'
                    app.VerdictLabel.BackgroundColor = [0.99 0.95 0.86];
                    app.VerdictLabel.FontColor       = [0.54 0.36 0.04];
                otherwise
                    app.VerdictLabel.BackgroundColor = [0.98 0.89 0.89];
                    app.VerdictLabel.FontColor       = [0.61 0.13 0.13];
            end
            app.VerdictLabel.Text = res.verdict;

            app.SummaryLabel.Text = sprintf(['%s  |  %.2f t fuel  |  %.1f t CO2  |  ' ...
                '%.2f g/t-nm  |  %.0f nm over %.0f h  |  peak plant load %.0f kW'], ...
                res.config.vessel.name, m.fuelTotal_t, m.co2_t, ...
                m.co2Intensity_gptnm, m.distance_nm, m.voyage_h, m.peakGenDemand_kW);

            % Findings table with per-row colouring.
            n = numel(res.findings);
            data = cell(n,6);
            for k = 1:n
                f = res.findings(k);
                data(k,:) = {f.id, f.title, f.measured, f.limit, f.status, f.detail};
            end
            app.FindingsTable.Data = data;

            removeStyle(app.FindingsTable);
            addRowStyle(app, app.FindingsTable, {res.findings.status}, 'PASS', ...
                        [0.91 0.97 0.92]);
            addRowStyle(app, app.FindingsTable, {res.findings.status}, 'WARN', ...
                        [0.99 0.96 0.88]);
            addRowStyle(app, app.FindingsTable, {res.findings.status}, 'FAIL', ...
                        [0.99 0.91 0.91]);

            updatePlots(app);

            app.ReportHtml.HTMLSource = vpcBuildReport(res);
        end

        % -----------------------------------------------------------------
        function updatePlots(app)
            res = app.Results;
            ts  = res.ts;
            cfg = res.config;
            t   = ts.t_h;

            % --- demand and generation ---
            ax = app.PowerAxes; cla(ax); hold(ax,'on');
            plot(ax, t, ts.P_load_kW,  'LineWidth',1.3, 'DisplayName','Total demand');
            plot(ax, t, ts.P_gen_kW,   'LineWidth',1.3, 'DisplayName','Generator output');
            plot(ax, t, ts.P_prop_kW,  'LineWidth',1.0, 'DisplayName','Propulsion (shaft)');
            plot(ax, t, ts.dpLoad_kW,  'LineWidth',1.0, 'DisplayName','DP thrusters');
            hold(ax,'off'); legend(ax,'Location','northwest'); grid(ax,'on');
            xlim(ax,[0 max(t)]);

            % --- source split ---
            ax = app.SplitAxes; cla(ax); hold(ax,'on');
            plot(ax, t, ts.P_gen_kW,   'LineWidth',1.3, 'DisplayName','Generators');
            plot(ax, t, ts.P_shore_kW, 'LineWidth',1.3, 'DisplayName','Shore supply');
            plot(ax, t, ts.P_ess_kW,   'LineWidth',1.3, 'DisplayName','Energy store');
            yline(ax, 0, 'Color',[0.6 0.6 0.6]);
            hold(ax,'off'); legend(ax,'Location','northwest'); grid(ax,'on');
            xlim(ax,[0 max(t)]);

            % --- generator loading with band ---
            ax = app.GenLoadAxes; cla(ax); hold(ax,'on');
            load = 100*ts.loadFrac;
            load(ts.nRun == 0) = NaN;      % no machine running: no load to plot
            plot(ax, t, load, 'LineWidth',1.3, 'DisplayName','Loading');
            yline(ax, 100*cfg.limits.genLoadMin, '--', 'Lower limit', ...
                  'Color',[0.75 0.3 0.1]);
            yline(ax, 100*cfg.limits.genLoadMax, '--', 'Upper limit', ...
                  'Color',[0.75 0.3 0.1]);
            hold(ax,'off'); grid(ax,'on'); ylim(ax,[0 110]); xlim(ax,[0 max(t)]);

            % --- sets online ---
            ax = app.GenCountAxes; cla(ax);
            stairs(ax, t, ts.nRun, 'LineWidth',1.3);
            grid(ax,'on'); xlim(ax,[0 max(t)]);
            ylim(ax,[-0.2 max(3, max(ts.nRun))+0.5]);

            % --- state of charge ---
            ax = app.SocAxes; cla(ax);
            if cfg.variants.energyStorage == 1
                text(ax, 0.5, 0.5, 'No energy storage fitted', ...
                     'Units','normalized','HorizontalAlignment','center', ...
                     'Color',[0.45 0.5 0.55]);
                ylim(ax,[0 100]);
            else
                hold(ax,'on');
                plot(ax, t, 100*ts.SOC, 'LineWidth',1.3);
                yline(ax, 100*cfg.limits.socMin, '--', 'Min', 'Color',[0.75 0.3 0.1]);
                yline(ax, 100*cfg.limits.socMax, '--', 'Max', 'Color',[0.75 0.3 0.1]);
                hold(ax,'off'); ylim(ax,[0 100]);
            end
            grid(ax,'on'); xlim(ax,[0 max(t)]);

            % --- store power ---
            ax = app.EssPowerAxes; cla(ax);
            plot(ax, t, ts.P_ess_kW, 'LineWidth',1.2);
            yline(ax, 0, 'Color',[0.6 0.6 0.6]);
            grid(ax,'on'); xlim(ax,[0 max(t)]);
        end
        function runVerification(app)
            % The whole Run action lives here rather than in the callback itself.
            % App Designer stores each callback's body in its code model, and a long
            % body did not survive being saved - the callback was silently dropped
            % from the model and the button came back unwired, while a one-line
            % callback survived. Keeping callbacks thin and the work in a helper is
            % App Designer's own convention anyway.
            %
            % The profile table drives lookup-table breakpoints inside the model.
            % Their length is structural, so it cannot change once the model has
            % been compiled into a deployed archive.
            nLegs = size(app.ProfileTable.Data,1);
            if nLegs ~= 7
                uialert(app.UIFigure, ...
                    sprintf(['The operating profile must have exactly 7 legs; ' ...
                             'it currently has %d.\n\nLeg count sets the size of ' ...
                             'the profile lookup tables in the model, which is ' ...
                             'fixed when the application is compiled. Edit the ' ...
                             'values rather than adding or removing rows (set ' ...
                             'hours to a small number to skip a leg).'], nLegs), ...
                    'Operating profile');
                return
            end

            dlg = uiprogressdlg(app.UIFigure, ...
                'Title','Verification in progress', ...
                'Message','Preparing simulation...','Indeterminate','off');
            cleanup = onCleanup(@() closeIfValid(app, dlg)); %#ok<NASGU>

            try
                cfg = readConfig(app);
                res = vpcRunCertification(cfg, struct('progressFcn', ...
                        @(f) updateProgress(app, dlg, f)));
                app.Results = res;
                showResults(app);
            catch ME
                app.Results = [];
                % A packaged app has no command window, and a deployed Simulink
                % failure often carries no diagnostic at all, so write the
                % surrounding facts to a file the user can send back.
                logFile = vpcWriteDiagnostics(ME, cfg);
                msg = sprintf('The verification run failed.\n\n%s', ME.message);
                if ~isempty(logFile)
                    msg = sprintf('%s\n\nDiagnostics written to:\n%s', msg, logFile);
                end
                uialert(app.UIFigure, msg, 'Simulation error');
            end
        end

        function ok = ensureDependencies(app)
            % Make the app usable on its own, so double-clicking the .mlapp or
            % opening it in App Designer works without having run vpcSetup first.
            % Without this the constructor dies in loadDefaults on a missing
            % vpcDefaultConfig, and the app comes up with an empty profile table
            % and a Run button that cannot do anything.
            %
            % Deployed archives already contain everything and MATLAB Compiler
            % forbids path changes, so this is desktop-only.
            ok = true;
            if isdeployed || ~isempty(which('vpcRunCertification'))
                return
            end

            here = fileparts(mfilename('fullpath'));   % ...\app  (or the .mlapp)
            root = fileparts(here);
            for sub = {'src','models','tools'}
                d = fullfile(root, sub{1});
                if isfolder(d); addpath(d); end
            end

            ok = ~isempty(which('vpcRunCertification'));
            if ~ok
                uialert(app.UIFigure, sprintf([ ...
                    'Could not find the project code next to this app.\n\n' ...
                    'Expected src\\ and models\\ under:\n%s\n\n' ...
                    'Open MATLAB in the project folder and run vpcSetup.'], root), ...
                    'Setup incomplete');
            end
        end

        function h = sectionHeader(~, g, row, txt)
            h = uilabel(g);
            h.Text = upper(txt);
            h.FontWeight = 'bold';
            h.FontSize = 10.5;
            h.FontColor = [0.13 0.38 0.65];
            h.Layout.Row = row;
            h.Layout.Column = [1 2];
        end

        function [lbl, fld] = textRow(~, g, row, txt)
            lbl = uilabel(g); lbl.Text = txt;
            lbl.Layout.Row = row; lbl.Layout.Column = 1;
            fld = uieditfield(g,'text');
            fld.Layout.Row = row; fld.Layout.Column = 2;
        end

        function [lbl, fld] = numRow(~, g, row, txt, lims)
            lbl = uilabel(g); lbl.Text = txt;
            lbl.Layout.Row = row; lbl.Layout.Column = 1;
            fld = uieditfield(g,'numeric');
            fld.Limits = lims;
            fld.Layout.Row = row; fld.Layout.Column = 2;
        end

        function [lbl, dd] = dropRow(~, g, row, txt, items)
            lbl = uilabel(g); lbl.Text = txt;
            lbl.Layout.Row = row; lbl.Layout.Column = 1;
            dd = uidropdown(g);
            dd.Items = items;
            dd.Layout.Row = row; dd.Layout.Column = 2;
        end

        function i = idxOf(~, items, value)
            i = find(strcmp(items, value), 1);
            if isempty(i); i = 1; end
        end

        function addRowStyle(~, tbl, statuses, want, colour)
            rows = find(strcmp(statuses, want));
            if ~isempty(rows)
                addStyle(tbl, uistyle('BackgroundColor',colour), 'row', rows);
            end
        end

        function updateProgress(~, dlg, frac)
            if isvalid(dlg)
                dlg.Value = max(0, min(1, frac));
                if frac < 0.2
                    dlg.Message = 'Preparing simulation...';
                elseif frac < 0.8
                    dlg.Message = 'Simulating the operating profile...';
                else
                    dlg.Message = 'Scoring the acceptance criteria...';
                end
            end
        end

        function closeIfValid(~, dlg)
            if isvalid(dlg); close(dlg); end
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % Defaults can only be loaded once the project code is reachable, and
            % the warning needs a figure to appear in, so this order matters.
            if ensureDependencies(app)
                loadDefaults(app);
            end
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
            loadDefaults(app);
        end

        % Button pushed function: RunButton
        function RunButtonPushed(app, event)
            runVerification(app);
        end
    end

    % Component initialization
    methods (Access = private)

        function createComponents(app)
            app.UIFigure = uifigure('Name','Vessel Electrical Power System Verification');
            app.UIFigure.Position = [80 60 1420 880];

            app.MainGrid = uigridlayout(app.UIFigure,[1 2]);
            app.MainGrid.ColumnWidth = {400,'1x'};
            app.MainGrid.RowHeight    = {'1x'};
            app.MainGrid.Padding      = [8 8 8 8];

            % ------------------------------------------------ configuration --
            app.ConfigPanel = uipanel(app.MainGrid);
            app.ConfigPanel.Title = 'Configuration';
            app.ConfigPanel.Scrollable = 'on';

            app.ConfigGrid = uigridlayout(app.ConfigPanel,[31 2]);
            app.ConfigGrid.ColumnWidth = {186,'1x'};
            app.ConfigGrid.RowHeight   = repmat({22},1,31);
            app.ConfigGrid.RowHeight{26} = 150;   % profile table
            app.ConfigGrid.RowHeight{28} = 34;    % buttons
            app.ConfigGrid.RowSpacing  = 5;
            app.ConfigGrid.Scrollable  = 'on';

            r = 1;
            app.VesselHeader = sectionHeader(app, app.ConfigGrid, r, 'Vessel particulars'); r = r+1;

            [app.NameLabel, app.NameField] = ...
                textRow(app, app.ConfigGrid, r, 'Vessel name'); r = r+1;
            [app.ImoLabel, app.ImoField] = ...
                textRow(app, app.ConfigGrid, r, 'IMO number'); r = r+1;
            [app.DispLabel, app.DispField] = ...
                numRow(app, app.ConfigGrid, r, 'Displacement (t)', [500 500000]); r = r+1;
            [app.SpeedLabel, app.SpeedField] = ...
                numRow(app, app.ConfigGrid, r, 'Design speed (kn)', [4 40]); r = r+1;
            [app.PropPowerLabel, app.PropPowerField] = ...
                numRow(app, app.ConfigGrid, r, 'Propulsion power (kW)', [200 60000]); r = r+1;
            [app.HotelLabel, app.HotelField] = ...
                numRow(app, app.ConfigGrid, r, 'Hotel base load (kW)', [10 20000]); r = r+1;

            app.VariantHeader = sectionHeader(app, app.ConfigGrid, r, ...
                'Component variants'); r = r+1;

            [app.ArchLabel, app.ArchDropDown] = ...
                dropRow(app, app.ConfigGrid, r, 'Propulsion architecture', app.ArchItems); r = r+1;
            [app.EssLabel, app.EssDropDown] = ...
                dropRow(app, app.ConfigGrid, r, 'Energy storage', app.EssItems); r = r+1;
            [app.GenLabel, app.GenDropDown] = ...
                dropRow(app, app.ConfigGrid, r, 'Generator configuration', app.GenItems); r = r+1;
            [app.ShoreLabel, app.ShoreDropDown] = ...
                dropRow(app, app.ConfigGrid, r, 'Shore connection', app.ShoreItems); r = r+1;

            app.PlantHeader = sectionHeader(app, app.ConfigGrid, r, ...
                'Component ratings'); r = r+1;

            [app.GenUnitLabel, app.GenUnitField] = ...
                numRow(app, app.ConfigGrid, r, 'Generator unit (kW)', [100 20000]); r = r+1;
            [app.EssEnergyLabel, app.EssEnergyField] = ...
                numRow(app, app.ConfigGrid, r, 'Store energy (kWh)', [0 20000]); r = r+1;
            [app.EssPowerLabel, app.EssPowerField] = ...
                numRow(app, app.ConfigGrid, r, 'Store power (kW)', [0 20000]); r = r+1;
            [app.ShorePowerLabel, app.ShorePowerField] = ...
                numRow(app, app.ConfigGrid, r, 'Shore connection (kW)', [0 20000]); r = r+1;
            [app.DpBaseLabel, app.DpBaseField] = ...
                numRow(app, app.ConfigGrid, r, 'DP thruster mean (kW)', [0 20000]); r = r+1;
            [app.DpRippleLabel, app.DpRippleField] = ...
                numRow(app, app.ConfigGrid, r, 'DP thruster swing (kW)', [0 10000]); r = r+1;

            app.LimitsHeader = sectionHeader(app, app.ConfigGrid, r, ...
                'Acceptance limits'); r = r+1;

            [app.FuelBudgetLabel, app.FuelBudgetField] = ...
                numRow(app, app.ConfigGrid, r, 'Fuel budget (t)', [0 5000]); r = r+1;
            [app.CiiLimitLabel, app.CiiLimitField] = ...
                numRow(app, app.ConfigGrid, r, 'Max CO2 (g/t-nm)', [0 500]); r = r+1;
            [app.ReserveLabel, app.ReserveField] = ...
                numRow(app, app.ConfigGrid, r, 'Min spinning reserve (%)', [0 100]); r = r+1;

            app.ProfileHeader = sectionHeader(app, app.ConfigGrid, r, ...
                'Operating profile'); r = r+1;

            app.ProfileHint = uilabel(app.ConfigGrid);
            app.ProfileHint.Text = 'Mode: 1 harbour, 2 manoeuvring, 3 transit, 4 DP';
            app.ProfileHint.FontSize = 10.5;
            app.ProfileHint.FontColor = [0.36 0.40 0.45];
            app.ProfileHint.Layout.Row = r;
            app.ProfileHint.Layout.Column = [1 2];
            r = r+1;

            app.ProfileTable = uitable(app.ConfigGrid);
            app.ProfileTable.ColumnName = {'Mode','Hours','Speed','Hotel x','Sea'};
            app.ProfileTable.ColumnWidth = {48,52,52,58,44};
            app.ProfileTable.ColumnEditable = true(1,5);
            app.ProfileTable.RowName = {};
            app.ProfileTable.Layout.Row = r;
            app.ProfileTable.Layout.Column = [1 2];
            r = r+2;

            app.ButtonGrid = uigridlayout(app.ConfigGrid,[1 2]);
            app.ButtonGrid.Padding = [0 0 0 0];
            app.ButtonGrid.ColumnSpacing = 8;
            app.ButtonGrid.Layout.Row = r;
            app.ButtonGrid.Layout.Column = [1 2];

            app.RunButton = uibutton(app.ButtonGrid,'push');
            app.RunButton.Text = 'Run verification';
            app.RunButton.FontWeight = 'bold';
            app.RunButton.BackgroundColor = [0.13 0.38 0.65];
            app.RunButton.FontColor = [1 1 1];
            app.RunButton.ButtonPushedFcn = createCallbackFcn(app, @RunButtonPushed, true);

            app.ResetButton = uibutton(app.ButtonGrid,'push');
            app.ResetButton.Text = 'Reset defaults';
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);

            % ------------------------------------------------------ results --
            app.ResultTabs = uitabgroup(app.MainGrid);

            % Verdict tab
            app.VerdictTab  = uitab(app.ResultTabs,'Title','Verification');
            app.VerdictGrid = uigridlayout(app.VerdictTab,[3 1]);
            app.VerdictGrid.RowHeight = {52,22,'1x'};

            app.VerdictLabel = uilabel(app.VerdictGrid);
            app.VerdictLabel.Text = 'No verification run yet';
            app.VerdictLabel.FontSize = 22;
            app.VerdictLabel.FontWeight = 'bold';
            app.VerdictLabel.HorizontalAlignment = 'center';
            app.VerdictLabel.BackgroundColor = [0.94 0.95 0.96];

            app.SummaryLabel = uilabel(app.VerdictGrid);
            app.SummaryLabel.Text = ...
                'Set the configuration on the left, then choose Run verification.';
            app.SummaryLabel.HorizontalAlignment = 'center';
            app.SummaryLabel.FontColor = [0.36 0.40 0.45];

            app.FindingsTable = uitable(app.VerdictGrid);
            app.FindingsTable.ColumnName = ...
                {'Rule','Criterion','Measured','Requirement','Result','Notes'};
            app.FindingsTable.ColumnWidth = {58,300,140,150,64,'auto'};
            app.FindingsTable.RowName = {};

            % Power tab
            app.PowerTab  = uitab(app.ResultTabs,'Title','Power and load');
            app.PowerGrid = uigridlayout(app.PowerTab,[2 1]);
            app.PowerAxes = uiaxes(app.PowerGrid);
            title(app.PowerAxes,'Electrical demand and generation');
            xlabel(app.PowerAxes,'Time (h)'); ylabel(app.PowerAxes,'Power (kW)');
            app.SplitAxes = uiaxes(app.PowerGrid);
            title(app.SplitAxes,'Where the power comes from');
            xlabel(app.SplitAxes,'Time (h)'); ylabel(app.SplitAxes,'Power (kW)');

            % Generators tab
            app.GenTab  = uitab(app.ResultTabs,'Title','Generators');
            app.GenGrid = uigridlayout(app.GenTab,[2 1]);
            app.GenLoadAxes = uiaxes(app.GenGrid);
            title(app.GenLoadAxes,'Generator loading against permitted band');
            xlabel(app.GenLoadAxes,'Time (h)'); ylabel(app.GenLoadAxes,'Load (%)');
            app.GenCountAxes = uiaxes(app.GenGrid);
            title(app.GenCountAxes,'Sets online');
            xlabel(app.GenCountAxes,'Time (h)'); ylabel(app.GenCountAxes,'Units');

            % Storage tab
            app.StorageTab  = uitab(app.ResultTabs,'Title','Energy storage');
            app.StorageGrid = uigridlayout(app.StorageTab,[2 1]);
            app.SocAxes = uiaxes(app.StorageGrid);
            title(app.SocAxes,'State of charge against limits');
            xlabel(app.SocAxes,'Time (h)'); ylabel(app.SocAxes,'SOC (%)');
            app.EssPowerAxes = uiaxes(app.StorageGrid);
            title(app.EssPowerAxes,'Store power (positive = discharging)');
            xlabel(app.EssPowerAxes,'Time (h)'); ylabel(app.EssPowerAxes,'Power (kW)');

            % Report tab
            app.ReportTab  = uitab(app.ResultTabs,'Title','Report');
            app.ReportGrid = uigridlayout(app.ReportTab,[1 1]);
            app.ReportGrid.Padding = [0 0 0 0];
            app.ReportHtml = uihtml(app.ReportGrid);
            app.ReportHtml.HTMLSource = ['<html><body style="font-family:Segoe UI,' ...
                'Arial;color:#5a6672;padding:24px">Run a verification to generate ' ...
                'the report.</body></html>'];
        end

        % -----------------------------------------------------------------
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = VesselCertApp

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end
