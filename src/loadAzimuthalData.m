function azimuthalData = loadAzimuthalData(path,session,configuration,elevationAngle,azimuthalAngles)

    for i = 1:length(azimuthalAngles)
        
        tempConfig = strcat(configuration," (",num2str(azimuthalAngles(i))," Degrees Azimuth)");
        
        tempConfig = convertStringsToChars(tempConfig);
        
        [~,data] = loadArcData(path,...
                               session,...
                               tempConfig,...
                               elevationAngle,...
                               'CalculateSpectra',true);

        freqs = data.Frequencies;
        vals = data.Values;
        azimuthalData(i) = Spectrum(freqs,vals);
        azimuthalData(i).Name = strcat(num2str(azimuthalAngles(i))," Degrees");
        
    end

end