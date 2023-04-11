% Purpose: To load the arc data from four different measurement campaigns
%
% Inputs:
%   - session: Which measurement campaign were the data recorded in?
%              Acceptable inputs are:
%                   - 'January 2019'
%                   - 'Spring 2019'
%                   - 'Fall 2019'
%                   - 'Summer 2020'
%   - configuration: Which microphone configuration you would like to get.
%                    Acceptable inputs are given in the docs/ folder
%   - angles: Which elevation angles you would like to analyze. Given in
%             degrees with 90 degrees being immediately above the
%             microphone and 5 degrees being near the ground

function [arc_waveforms, arc_spectra] = loadArcData(path,session,configuration,angles,varargin)

    p = inputParser;
    p.addRequired('path');
    p.addRequired('session');
    p.addRequired('configuration');
    p.addRequired('angles');
    p.addParameter('Baseline',false);
    p.addParameter('CalculateSpectra',false)
    
    p.parse(path,session,configuration,angles,varargin{:});
    
    useBaseline = p.Results.Baseline;
    CalculateSpectra = p.Results.CalculateSpectra;

    % There are different nuances in the data, so we will take care of that
    % here
    
    [path,IDnums,channel] = getInfo(path,session,configuration,angles,useBaseline);
    
    arc_waveforms = MicArray;
    %arc_waveforms.initializeArray(length(IDnums));
    fs = 51.2e3;
    
    for i = 1:length(IDnums)

        waveform = binfileload(path,'ID',IDnums(i),channel);

        arc_waveforms.Microphones(i).Signal = Signal(waveform,fs);
        arc_waveforms.Microphones(i).Signal.Name = strcat(num2str(angles(i))," Degrees");
        arc_waveforms.Microphones(i).Name = arc_waveforms.Microphones(i).Signal.Name;
        
    end
    
    if CalculateSpectra
           
        %arc_waveforms.generateSpectra('BlockSize',fs/2,'FrequencyRange',[50,20e3]);

        for i = 1:length(arc_waveforms.Microphones)

            [Pxx,f] = getPxx(arc_waveforms.Microphones(i).Signal.Waveform,arc_waveforms.Microphones(i).Signal.SampleRate, ...
                            'BlockSize',arc_waveforms.Microphones(i).Signal.SampleRate/2);

            [spec,fc] = fractionalOctave(f,Pxx,[50,20e3],3);

            spec = pressure2dB(spec,'IsSquared',true);

            spec = Spectrum(fc,spec);
            spec.Name = arc_waveforms.Microphones(i).Name;

            arc_spectra(i) = spec;

        end
            
    end

end

function [path,IDnums,channel] = getInfo(path,session,configuration,IDnums,useBaseline)

    if strcmp(session, 'January 2019')
        
        path = strcat(path,'\Arc Measurements January 2019\Data\',configuration);

        IDnums = IDnums./5 + 1;
        
        channel = -1; % FIXME: Find this
        
    elseif strcmp(session, 'Spring 2019')
        
        path = strcat(path,'\Arc Measurements Spring 2019\Data\',configuration,'\Raw Data');
        
        IDnums = IDnums./5;
        
        if useBaseline
            channel = 1;
        else
            channel = 0;
        end
        
    elseif strcmp(session, 'Fall 2019')
        
        path = strcat(path,'\Arc Measurements Fall 2019\Data\',configuration);
        
        IDnums = IDnums./5 + 1;
        
        if useBaseline
            channel = 0;
        else
            channel = 1;
        end

    elseif strcmp(session, 'Summer 2020')
        
        path = strcat(path,'\Arc Measurements Summer 2020\Data\',configuration);
        
        IDnums = IDnums./5 + 1;
        
        if useBaseline
            channel = 0;
        else
            channel = 1;
        end
        
    else
        
        disp('The session input is invalid. It must be "January 2019", "Spring 2019", "Fall 2019", or "Summer 2020"')
        
    end

end