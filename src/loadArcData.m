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

function loadArcData(path,session,configuration,angles,varargin)

    p = inputParser;
    p.addRequired('path');
    p.addRequired('session');
    p.addRequired('configuration');
    p.addRequired('angles');
    p.addParameter('Baseline',false);
    
    p.parse(path,session,configuration,angles,varargin{:});
    
    useBaseline = p.Results.Baseline;

    % There are different nuances in the data, so we will take care of that
    % here
    
    [path,angles,channel] = getInfo(session)

end

function [path,angles,channel] = getInfo(session)

    if strcmp(session, 'January 2019')
        
        path = strcat(path,'/Arc Measurements January 2019/Data/',configuration);

        angles = angles./5 + 1;
        
        channel = -1; % FIXME: Find this
        
    elseif strcmp(session, 'Spring 2019')
        
        path = strcat(path,'/Arc Measurements Spring 2019/Data/',configuration,'Raw Data/');
        
        angles = angles./5;
        
        if useBaseline
            channel = 1;
        else
            channel = 0;
        end
        
    elseif strcmp(session, 'Fall 2019')
        
        path = strcat(path,'/Arc Measurements Fall 2019/Data/',configuration);
        
        angles = angles./5 + 1;
        
        if useBaseline
            channel = 0;
        else
            channel = 1;
        end

    elseif strcmp(session, 'Summer 2020')
        
        path = strcat(path,'/Arc Measurements Fall 2019/Data/',configuration);
        
        angles = angles./5 + 1;
        
        if useBaseline
            channel = 0;
        else
            channel = 1;
        end
        
    else
        
        disp('The session input is invalid. It must be "January 2019", "Spring 2019", "Fall 2019", or "Summer 2020"')
        
    end

end