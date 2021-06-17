function azimuthalData = loadAzimuthalData(path,session,configuration,elevationAngle,azimuthalAngles)

    azimuthalData = MicArray;

    for i = 1:length(azimuthalAngles)
        
        tempConfig = strcat(configuration," (",num2str(azimuthalAngles(i))," Degrees Azimuth)");
        
        tempConfig = convertStringsToChars(tempConfig);
        
        data = loadArcData(path,...
                           session,...
                           tempConfig,...
                           elevationAngle,...
                           'CalculateSpectra',true);
                       
        azimuthalData.Microphones(i).Name = strcat(num2str(azimuthalAngles(i))," Degrees");
        azimuthalData.Microphones(i).OTOFrequencies = data.Microphones(1).OTOFrequencies;
        azimuthalData.Microphones(i).OTOSpectrum = data.Microphones(1).OTOSpectrum;
        
    end

end