function comparison = compareTwoConfigurations(path,session_baseline,configuration_baseline,session_dut,configuration_dut,angles)

    [~,baseline_spectra] = loadArcData(path,...
                                       session_baseline,...
                                       configuration_baseline,...
                                       angles,...
                                       'CalculateSpectra',true);
                       
    [~,dut_spectra] = loadArcData(path,...
                                  session_dut,...
                                  configuration_dut,...
                                  angles,...
                                  'CalculateSpectra',true);
         
    %comparison = MicArray;              
    for i = 1:length(angles)

        freqs = baseline_spectra.Frequencies;
        difference = dut_spectra(i).Values - baseline_spectra(i).Values;
        
        comparison(i) = Spectrum(freqs, difference);
        comparison(i).Name = dut_spectra(i).Name;
        comparison(i).Units = "Difference (dB)";
        
    end
    
    % Putting the angles in reverse order so they plot properly
    comparison = flip(comparison);

end