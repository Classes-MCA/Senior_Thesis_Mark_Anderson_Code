% Purpose: To create the figures for the COUGARxt POMA
clear; close all;

plotStyle('StandardStyle','SonicBoom')

path = '/Volumes/Mark Drive/Acoustics Research/Acoustics/Arc Measurements';
angles = [5,20,45,70,90];

% Comparing COUGARxt with the baseline measurement
session_baseline = 'Summer 2020';
configuration_baseline = 'Baseline 2';
session_dut = 'Summer 2020';
configuration_dut = 'COUGARxt With Windscreen';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createPlot(comparison)
title('COUGARxt - Baseline')

% Comparing COUGARxt with and without the windscreen
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
title('COUGARxt Windscreen Insertion Loss')


savePlots('SavePath','/Users/markanderson/Desktop/POMA_COUGARxt_ASA_December_2020/Figures/Improved Figures',...
          'FileTypes',"png")

function createPlot(comparison)

    % Formatting the plot
    comparison.compareSpectra('SpectrumType','OTO',...
                              'LineWidth',2);
    xlim([50,10e3])
    ylim([-5,5])
    xlabel('Frequency (Hz)')
    ylabel('Difference (dB)')
    
    % Formatting the legend
    hleg = legend();
    hleg.Title.String = 'Elevation Angle';
    hleg.Title.FontWeight = 'Bold';
    hleg.Location = 'NorthWest';

end