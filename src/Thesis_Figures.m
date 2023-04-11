% Purpose: To create the figures for the COUGARxt POMA
clear; close all;

plotStyle('StandardStyle','SonicBoom')
set(0, 'DefaultFigureRenderer', 'painters');

path = 'C:\Users\mander14\Box\Mark Anderson Senior Thesis Data';
angles = [5,20,45,70,90];
savePath = '/Users/markanderson/Desktop/savePlots Output';
FileTypes = ["png"];

%% Comparing COUGAR without a windscreen to the baseline
session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR No Wind Screen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Comparing COUGAR with a thin plate (no screen) to the baseline
session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'Thin COUGAR No Wind Screen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Comparing COUGAR with a centered apex (no screen) to the baseline
session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'Bulge In Center No Wind Screen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% COUGAR windscreen insertion loss (negative)
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR No Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen No Rain Cap';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Testing the Rain Cap
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Wind Screen No Rain Cap';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Testing with water saturation
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR Water Saturated';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Testing with dirt saturation
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Pre Dirt Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen Dirt Saturated Round 3';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% Final COUGAR design
session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen No Rain Cap';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 5 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 1.0';
elevationAngle = 5;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGAR Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 45 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 1.0';
elevationAngle = 45;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGAR Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 90 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 1.0';
elevationAngle = 90;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGAR Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)

%% COUGARxt in Standard Configuration
session_baseline = 'Fall 2019';
configuration_baseline = 'BASELINE 2';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 2.0 (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt (0 Degrees Azimuth) - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% COUGARxt Rain Cap Test
session_baseline = 'Fall 2019';
configuration_baseline = 'COUGAR 2.0 (0 Degrees Azimuth)';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 2.0 With Rain Cap (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-8,5])
ax = gca;
ax.YTick = -8:2:4;

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt With Rain Cap (0 Degrees Azimuth) - COUGARxt (0 Degrees Azimuth)"),...
          'FileTypes',FileTypes)
      
%% COUGARxt Azimuthal Rotation at 5 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 2.0';
elevationAngle = 5;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGARxt Azimuthal Rotation at 45 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 2.0';
elevationAngle = 45;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGARxt Azimuthal Rotation at 90 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 2.0';
elevationAngle = 90;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

ax = gca;
delete(ax.Children(2)) % Removing the 0 degrees line.
hleg = legend(ax.Children(2:end)); % Omitting the dashed zero line
hleg.Title.String = 'Azimuthal Angle';

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR vs COUGARxt Lab Test
session_baseline = 'Fall 2019';
configuration_baseline = 'COUGAR 1.0 (0 Degrees Azimuth)';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 2.0 (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% SBUDAS vs. Baseline

session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'SBUDAS';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-17,10])
ax = gca;
ax.YTick = -15:5:15;

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
%% Wind Noise Comparison

% disp('Starting Wind Noise Comparison, this will take a few minutes...')
% Wind_Noise_Comparison
% 
% h = gcf;
% h.Position(3:4) = [5,3];
% 
% savePlots('SavePath',savePath,...
%           'Titles',"Wind Noise Comparison",...
%           'FileTypes',FileTypes)
      
%% GEM63

close all

Rocket_Motor_COUGAR_COUGARxt_Comparison_GEM_63

close(1:3)

title('GEM-63 Comparison')

h = gcf;
h.Position(3:4) = [5,3];

savePlots('SavePath',savePath,...
          'Titles',"GEM63",...
          'FileTypes',FileTypes)

%% CASTOR 300
      
close all

Rocket_Motor_COUGAR_COUGARxt_Comparison_CASTOR

close(1:3)

title('CASTOR 300 Comparison')

h = gcf;
h.Position(3:4) = [5,3];

savePlots('SavePath',savePath,...
          'Titles',"CASTOR300",...
          'FileTypes',FileTypes)
      
%% COUGAR Repeatability

close all

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'Quarter Inch Baseline';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR No Wind Screen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])
title('Spring 2019')

figure()
session_baseline = 'Fall 2019';
configuration_baseline = 'BASELINE 2';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 1.0 (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])
title('Fall 2019')

figure()
session_baseline = 'Summer 2020';
configuration_baseline = 'BASELINE 2';
session_dut = 'Summer 2020';
configuration_dut = 'COUGAR With Windscreen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])
title('Summer 2020')

savePlots('SavePath',savePath,...
          'Titles',["COUGAR Spring 2019","COUGAR Fall 2019","COUGAR Summer 2020"],...
          'FileTypes',FileTypes)

%% COUGARxt Repeatability

close all

figure();
session_baseline = 'Fall 2019';
configuration_baseline = 'BASELINE 2';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 2.0 (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])
title('Fall 2019')

figure();
session_baseline = 'Summer 2020';
configuration_baseline = 'BASELINE 2';
session_dut = 'Summer 2020';
configuration_dut = 'COUGARxt With Windscreen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-3,3])
title('Summer 2020')

savePlots('SavePath',savePath,...
          'Titles',["COUGARxt Fall 2019","COUGARxt Summer 2020"],...
          'FileTypes',FileTypes)
      
%% Rain Cap Repeatability

close all

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'Rain Cap Test No Rain Cap Round 1';
session_dut = 'Spring 2019';
configuration_dut = 'Rain Cap Test With Rain Cap Round 1';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 1')

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'Rain Cap Test No Rain Cap Round 2';
session_dut = 'Spring 2019';
configuration_dut = 'Rain Cap Test With Rain Cap Round 2';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 2')

figure();
session_baseline = 'Fall 2019';
configuration_baseline = 'BASELINE 2';
session_dut = 'Fall 2019';
configuration_dut = 'COUGAR 1.0 With Rain Cap (0 Degrees Azimuth)';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 3')

savePlots('SavePath',savePath,...
          'Titles',["Rain Cap Round 1","Rain Cap Round 2","Rain Cap Fall 2019"],...
          'FileTypes',FileTypes)
      
%% Sand Saturation

close all

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Pre Dirt Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen Dirt Saturated';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 1')

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Pre Dirt Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen Dirt Saturated Round 2';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 2')

figure();
session_baseline = 'Spring 2019';
configuration_baseline = 'COUGAR With Pre Dirt Wind Screen';
session_dut = 'Spring 2019';
configuration_dut = 'COUGAR With Wind Screen Dirt Saturated Round 3';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
ylim([-5,5])
title('Spring 2019 Round 3')

savePlots('SavePath',savePath,...
          'Titles',["Sand Round 1","Sand Round 2","Sand Fall 2019"],...
          'FileTypes',FileTypes)
      
%% COUGARxt Negative Insertion Loss
      
close all

figure();
session_baseline = 'Summer 2020';
configuration_baseline = 'COUGARxt No Windscreen';
session_dut = 'Summer 2020';
configuration_dut = 'COUGARxt With Windscreen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
                                  
createPlot(comparison)
ylim([-5,5])

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)

function createPlot(comparison)

    % Formatting the plot
    comparison.compareSpectra('SpectrumType','OTO',...
                              'LineWidth',2);
    xlim([50,20e3])
    ylim([-5,5])
    xlabel('Frequency (Hz)')
    ylabel('Difference (dB)')
    
    % Formatting the legend
    ax = gca;
    hleg = legend(ax.Children(1:end));
    hleg.Title.String = 'Elevation Angle';
    hleg.Title.FontWeight = 'Bold';
    hleg.Location = 'EastOutside';
    
    if ax.YLim == [-5,5]
        ax.YTick = -5:1:5;
    end
    
    ax.XColor = [0 0 0];
    ax.YColor = [0 0 0];
    
    title('')
    
    legend('Autoupdate','off')
    l = yline(0,'k--','LineWidth',4);
    
    
    % Set ConstantLine to 'back'
    % Temporarily disable the warning that appears when accessing 
    % the undocumented properties.
    warnState = warning('off','MATLAB:structOnObject');
    cleanupObj = onCleanup(@()warning(warnState)); 
    Sl = struct(l);        % Get undocumented properties (you'll get a warning)
    clear('cleanupObj')      % Trigger warning reset
    Sl.Edge.Layer = 'back'; % Set ConstantLine uistack
    
    h = gcf;
    h.Position(3:4) = [6.5,3];

end