pathToData = '/Volumes/Mark Drive/Acoustics Research/Acoustics/Arc Measurements/Static Fire Tests/CASTOR 300 February 2020/77.5/77.5';

plotStyle('StandardStyle','SonicBoom')

ch_COUGAR   = 2;
ch_COUGARxt = 3;

IDnum = 2;

startTime = 75; % seconds
runTime   = 20; % seconds

% Plot options
plotTitle = 'COUGARxt - COUGAR';
xlimits   = [2,10000];
ylimits   = [-3,3];
saveFile  = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting Other Values
fs = 102400;
ns = fs/2;
pref = 20e-6;
octaveFraction = 3;
frequencyRange = xlimits;
dt = 1/fs;
startingIndex = startTime*fs;
endingIndex = (startTime + runTime)*fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extracting the data
data_COUGAR   = binfileload(pathToData,'ID',IDnum,ch_COUGAR);
data_COUGARxt = binfileload(pathToData,'ID',IDnum,ch_COUGARxt);
disp("Extracted the data!")

% Doing an FFT on the data
[Gxx_COUGAR,  f_COUGAR,  OASPL_COUGAR]   = autospec(data_COUGAR(startingIndex:endingIndex),  fs,ns);
[Gxx_COUGARxt,f_COUGARxt,OASPL_COUGARxt] = autospec(data_COUGARxt(startingIndex:endingIndex),fs,ns);
disp("Done with autospec!")

% Converting the spectrum to one-third ocatves
[spec_COUGAR,  fc_COUGAR]   = FractionalOctave(f_COUGAR,  Gxx_COUGAR,  xlimits,3);
[spec_COUGARxt,fc_COUGARxt] = FractionalOctave(f_COUGARxt,Gxx_COUGARxt,xlimits,3);
disp("Done making third-octave values!")

% Converting the spectrum to decibels
spec_COUGAR   = 10.*log10(spec_COUGAR  ./pref^2);
spec_COUGARxt = 10.*log10(spec_COUGARxt./pref^2);
disp("Done converting to decibels!")

difference = spec_COUGARxt - spec_COUGAR;

% Plotting the waveform
t = dt:dt:length(data_COUGAR)/fs;
figure();
plot(t,data_COUGAR)
hold on
xline(startingIndex/fs,'r-','Linewidth',3)
xline(endingIndex/fs,'r-','Linewidth',3)
hold off

% Plotting Narrowband
figure()
semilogx(f_COUGAR,  10.*log10(Gxx_COUGAR   ./pref^2),'Linewidth',4)
hold on
semilogx(f_COUGARxt,10.*log10(Gxx_COUGARxt./pref^2),'Linewidth',4)
xlabel('Frequency (Hz)')
ylabel('SPL (dB)')
legend('COUGAR','COUGARxt')
grid on
title('CASTOR 300 Microphone Comparison February 2020')
xlim(xlimits)
hold off

% Plotting Third Octaves
figure()
semilogx(fc_COUGAR,spec_COUGAR,'Linewidth',4)
hold on
semilogx(fc_COUGARxt,spec_COUGARxt,'Linewidth',4)
xlabel('Frequency (Hz)')
ylabel('SPL (dB)')
legend('COUGAR','COUGARxt')
xlim(xlimits)
grid on
title('CASTOR 300 Microphone Comparison February 2020')
hold off

fig = figure();
% Plotting and saving the results
semilogx(fc_COUGAR,difference,'Linewidth',3)
title(plotTitle)
xlabel('Frequency (Hz)')
ylabel('Difference (dB)')
xlim(xlimits)
ylim(ylimits)
legend('COUGARxt - COUGAR','Location','NorthEast')
grid('on')
xlim(xlimits)

% Adding a reference line at y = 0
legend('Autoupdate','off')  % Making the legend ignore the reference line
l = line(xlimits,[0,0],'Color','black','Linestyle','--','Linewidth',4);
uistack(l,'bottom') % Putting the reference line underneath the data

h = gcf;
h.Position(3) = 5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saving the plots

if saveFile == true
    % Completing the path
    filename = strcat(path_saveFile,plotTitle);

    % Saving the figure
    saveas(fig,strcat(filename,'.fig'))
    
    % Saving as png
    saveas(fig,filename,'png')

    % Saving the figure as a vector image
    title('') % Removing the title from the plot for publication
    saveas(fig,filename,'epsc')
end
