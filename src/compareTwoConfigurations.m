function comparison = compareTwoConfigurations(path,session_baseline,configuration_baseline,session_dut,configuration_dut,angles)

    baseline = loadArcData(path,...
                           session_baseline,...
                           configuration_baseline,...
                           angles,...
                           'CalculateSpectra',true);
                       
    dut = loadArcData(path,...
                      session_dut,...
                      configuration_dut,...
                      angles,...
                      'CalculateSpectra',true);
         
    comparison = MicArray;              
    for i = 1:length(angles)
        
        comparison.Microphones(i).Name = dut.Microphones(i).Name;
        comparison.Microphones(i).SamplingFrequency = dut.Microphones(i).SamplingFrequency;
        comparison.Microphones(i).OTOFrequencies = dut.Microphones(i).OTOFrequencies;
        
        % Doing the OTO subtraction
        subtraction = dut.Microphones(i).OTOSpectrum - baseline.Microphones(i).OTOSpectrum;
        
        comparison.Microphones(i).OTOSpectrum = subtraction;
        
    end

end