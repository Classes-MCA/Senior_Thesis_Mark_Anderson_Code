function comparison = tryDifferentLengths(path,session_baseline,configuration_baseline,session_dut,configuration_dut,angle,times)

    for i = 1:length(times)

        [~,baseline_spectra(i)] = loadArcData(path,...
                                           session_baseline,...
                                           configuration_baseline,...
                                           angle,...
                                           'CalculateSpectra',true, ...
                                           'TrimmedTime',times(i));
                           
        [~,dut_spectra(i)] = loadArcData(path,...
                                      session_dut,...
                                      configuration_dut,...
                                      angle,...
                                      'CalculateSpectra',true, ...
                                      'TrimmedTime',times(i));

    end

    for i = 1:length(times)

        freqs = baseline_spectra.Frequencies;
        difference = dut_spectra(i).Values - baseline_spectra(i).Values;
        
        comparison(i) = Spectrum(freqs, difference);
        comparison(i).Name = strcat(num2str(times(i))," seconds");
        comparison(i).Units = "Difference (dB)";
        
    end

    comparison = flip(comparison);

end