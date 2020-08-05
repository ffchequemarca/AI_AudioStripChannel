function [Output_Signal,Frequency_Spectrum] = EQ_1Band(Input_Signal,Sample_Rate,HiPass_Parameters)
%Input_Signal,Sample Rate(Hz),HiPass_Parameters[Cutoff_Frequency,Slope]

%HiPass Filter
Out1 = HiPass_Filter(Input_Signal,Sample_Rate,HiPass_Parameters(1),HiPass_Parameters(2));
 
Output_Signal=Out1;
Frequency_Spectrum = pspectrum(Output_Signal,Sample_Rate,'FrequencyResolution',150);

end

