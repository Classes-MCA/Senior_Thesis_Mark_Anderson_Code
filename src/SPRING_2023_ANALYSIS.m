clear; close all;

plotStyle('StandardStyle','Cobra')

path = 'C:\Users\mander14\Box\Sonic Boom\Mark Anderson Senior Thesis Data';
angles = [5,20,45,70,90];
FileTypes = ["png","svg","pdf"];

%% Comparing COUGAR to the baseline
session_baseline = 'Spring 2023';
configuration_baseline = 'Baseline';
session_dut = 'Spring 2023';
configuration_dut = 'COUGAR Mic One Inch Off Plate';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createThesisPlot(comparison)
ylim([-3,3])

savePlots('Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)