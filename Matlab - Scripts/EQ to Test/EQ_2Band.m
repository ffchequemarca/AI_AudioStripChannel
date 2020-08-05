function [Output_Signal,Frequency_Spectrum] = EQ_2Band(Input_Signal,Sample_Rate,HiPass_Parameters,LoShelf_Parameters)
%Input_Signal,Sample
%Rate(Hz),HiPass_Parameters[Cutoff_Frequency,Slope],LoShelf_Parameters[Center_Frequency,Gain,Slope]

%HiPass Filter
Out1 = HiPass_Filter(Input_Signal,Sample_Rate,HiPass_Parameters(1),HiPass_Parameters(2));
Out2 = LoShelf_Filter(Out1,Sample_Rate,LoShelf_Parameters(1),LoShelf_Parameters(2),LoShelf_Parameters(3));

Output_Signal=Out2;
Frequency_Spectrum = pspectrum(Output_Signal,Sample_Rate,'FrequencyResolution',150);

end


