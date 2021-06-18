% Purpose: To create the figures for the COUGARxt POMA
clear; close all;

plotStyle('StandardStyle','SonicBoom')

path = '/Volumes/Mark Drive/Acoustics Research/Acoustics/Arc Measurements';
angles = [5,20,45,70,90];
savePath = '/Users/markanderson/Desktop/POMA_COUGARXT_ASA_December_2020/Figures';
FileTypes = ["png"];

%% Comparing COUGAR without a windscreen to the baseline
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

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% COUGARxt Windscreen Insertion Loss
session_baseline = 'Summer 2020';
configuration_baseline = 'COUGARxt With Windscreen';
session_dut = 'Summer 2020';
configuration_dut = 'COUGARxt No Windscreen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)

savePlots('SavePath',savePath,...
          'Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 5 Degrees Elevation
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

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 30 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 2.0';
elevationAngle = 30;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 60 Degrees Elevation
session = 'Fall 2019';
configuration = 'COUGAR 2.0';
elevationAngle = 60;
azimuthalAngles = [0,45,90,135,180,270];
comparison = performAzimuthalRotation(path,...
                                      session,...
                                      configuration,...
                                      elevationAngle,...
                                      azimuthalAngles);
createPlot(comparison)
ylim([-3,3])

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% COUGAR Azimuthal Rotation at 90 Degrees Elevation
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

savePlots('SavePath',savePath,...
          'Titles',strcat("COUGARxt Azimuthal Rotation at ",num2str(elevationAngle)," Degrees"),...
          'FileTypes',FileTypes)
      
%% Wind Noise Comparison

Wind_Noise_Comparison

savePlots('SavePath',savePath,...
          'Titles',"Wind Noise Comparison",...
          'FileTypes',FileTypes)

function createPlot(comparison)

    % Formatting the plot
    comparison.compareSpectra('SpectrumType','OTO',...
                              'LineWidth',2);
    xlim([50,10e3])
    ylim([-5,5])
    xlabel('Frequency (Hz)')
    ylabel('Difference (dB)')
    
    % Formatting the legend
    ax = gca;
    hleg = legend(ax.Children(1:end));
    hleg.Title.String = 'Elevation Angle';
    hleg.Title.FontWeight = 'Bold';
    hleg.Location = 'NorthWest';
    
    title('')
    
    legend('Autoupdate','off')
    l = yline(0,'k--','LineWidth',4);
    uistack(l,'bottom') % Putting the reference line underneath the data

end