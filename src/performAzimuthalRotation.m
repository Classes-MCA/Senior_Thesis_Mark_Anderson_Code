function comparison = performAzimuthalRotation(path,session,configuration,elevationAngle,azimuthalAngles)

    data = loadAzimuthalData(path,session,configuration,elevationAngle,azimuthalAngles);
    
%     comparison = MicArray;
    
    for i = 1:length(azimuthalAngles)
        
%         comparison.Microphones(i).Name = data.Microphones(i).Name;
%         comparison.Microphones(i).OTOFrequencies = data.Microphones(i).OTOFrequencies;
%         
%         subtraction = data.Microphones(i).OTOSpectrum - data.Microphones(1).OTOSpectrum; % re azimuth = 0
%         
%         comparison.Microphones(i).OTOSpectrum = subtraction;

        freqs = data(i).Frequencies;
        difference = data(i).Values - data(1).Values;
        comparison(i) = Spectrum(freqs,difference);
        comparison(i).Name = data(i).Name;
        
    end
    
    % Putting the angles in reverse order so they plot properly
    comparison = flip(comparison);

end