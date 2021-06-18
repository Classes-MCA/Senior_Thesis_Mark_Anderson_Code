pathToData = '/Volumes/Mark Drive/Acoustics Research/Acoustics/Arc Measurements/Wind Noise/January 2019 Wind Test';

ch_COUGAR   = 0;
ch_COUGARxt = 1;

timeToSkip = 20 * 60; % seconds to skip at the beginning

IDnum = 2;

% Plot options
%plotTitle = 'Reference Microphone Validation - COUGAR vs COUGARxt at 0 Azimuth';
xlimits   = [0.01,20000];
ylimits   = [-5,1.5];
saveFile  = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting Other Values
fs = 25600;
ns = 12800;
pref = 20e-6;
octaveFraction = 3;
frequencyRange = xlimits;
dt = 1/fs;
t = dt:dt:3600;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extracting the data
data_COUGAR   = binfileload(pathToData,'ID',IDnum,ch_COUGAR);
data_COUGARxt = binfileload(pathToData,'ID',IDnum,ch_COUGARxt);
disp("Extracted the data!")

%plot(t(1:fs*timeToSkip),data_COUGAR(1:fs*timeToSkip))
%plot(fs,t) % To kill the script

% Taking out the spike
data_COUGAR   = data_COUGAR(timeToSkip*fs:end);
data_COUGARxt = data_COUGARxt(timeToSkip*fs:end);

% Doing an FFT on the data
[Gxx_COUGAR,  f_COUGAR,  OASPL_COUGAR]   = autospec(data_COUGAR,  fs,ns);
[Gxx_COUGARxt,f_COUGARxt,OASPL_COUGARxt] = autospec(data_COUGARxt,fs,ns);
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

%%

% Plotting and saving the results
semilogx(fc_COUGAR,difference,'Linewidth',4)
xlabel('Frequency (Hz)')
ylabel('Difference (dB)')
xlim([2,110])
title('')
ylim(ylimits)
legend('COUGARxt - COUGAR','Location','NorthWest')
grid('on')

% Adding a reference line at y = 0
legend('Autoupdate','off')  % Making the legend ignore the reference line
l = line(xlimits,[0,0],'Color','black','Linestyle','--','Linewidth',4);
uistack(l,'bottom') % Putting the reference line underneath the data

ax = gca;
ax.Children(1).Color = [114 207 225]./256;
