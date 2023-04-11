function comparison = performAzimuthalRotation(path,session,configuration,elevationAngle,azimuthalAngles)

    data = loadAzimuthalData(path,session,configuration,elevationAngle,azimuthalAngles);
    
    for i = 1:length(azimuthalAngles)

        freqs = data(i).Frequencies;
        difference = data(i).Values - data(1).Values;
        comparison(i) = Spectrum(freqs,difference);
        comparison(i).Name = data(i).Name;
        
    end
    
    % Putting the angles in reverse order so they plot properly
    comparison = flip(comparison);

end