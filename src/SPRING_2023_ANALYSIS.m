clear; close all;

plotStyle('StandardStyle','Cobra')

path = 'C:\Users\mander14\Box\Sonic Boom\Mark Anderson Senior Thesis Data';
angles = [5,20,45,70,90];
FileTypes = ["png","svg","pdf"];

%% Comparing COUGAR to the baseline (where the COUGAR mic was too high)
close all
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

%% Comparing COUGAR to the baseline (where the mic was properly spaced)
close all
session_baseline = 'Spring 2023';
configuration_baseline = 'Baseline';
session_dut = 'Spring 2023';
configuration_dut = 'COUGAR';
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

%% Comparing COUGAR to the old COUGAR
close all
session_baseline = 'Summer 2020';
configuration_baseline = 'Cougar With Windscreen';
session_dut = 'Spring 2023';
configuration_dut = 'COUGAR';
comparison = compareTwoConfigurations(path,...
                                      session_baseline,...
                                      configuration_baseline,...
                                      session_dut,...
                                      configuration_dut,...
                                      angles);
createThesisPlot(comparison)
ylim([-3,3])

ax = gca;
for i = 2:length(ax.Children)

    ax.Children(i).YData = ax.Children(i).YData - 9.5;

end

savePlots('Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)

%% Comparing 30 vs 60 seconds for recording time
close all
session_baseline = 'Spring 2023';
configuration_baseline = 'Baseline';
session_dut = 'Spring 2023';
configuration_dut = 'COUGAR 60 sec';
comparison = tryDifferentLengths(path,...
                                  session_baseline,...
                                  configuration_baseline,...
                                  session_dut,...
                                  configuration_dut,...
                                  10, ...
                                  flip([10,20,30,40,50,60]));
createThesisPlot(comparison)
ylim([-1,1])
yticks(-1:0.5:1)
hleg = legend();
hleg.Title.String = "Recording Time";

ax = gca;
sym = ["o","x","s","v","d","^",">"];
for i = 2:length(ax.Children)

    ax.Children(i).Marker = sym(i);

end

title("Impact of Recording Time")

savePlots('Titles',strcat(configuration_dut," - ",configuration_baseline),...
          'FileTypes',FileTypes)