function [Output_Signal,Frequency_Spectrum] = EQ_6Band(Input_Signal,Sample_Rate,HiPass_Parameters,LoShelf_Parameters,HiShelf_Parameters,LoPass_Parameters,Bell1_Parameters,Bell2_Parameters)
%Input_Signal,Sample
%Rate(Hz),HiPass_Parameters[Cutoff_Frequency,Slope],LoShelf_Parameters[Center_Frequency,Gain,Slope],LoShelf_Parameters[Center_Frequency,Gain,Slope],LoPass_Parameters[Cutoff_Frequency,Slope],Bell#_Parameters[Center_Frequency,Gain,Quality,Order]

%HiPass Filter
Out1 = HiPass_Filter(Input_Signal,Sample_Rate,HiPass_Parameters(1),HiPass_Parameters(2));
Out2 = LoShelf_Filter(Out1,Sample_Rate,LoShelf_Parameters(1),LoShelf_Parameters(2),LoShelf_Parameters(3));
Out3 = HiShelf_Filter(Out2,Sample_Rate,HiShelf_Parameters(1),HiShelf_Parameters(2),HiShelf_Parameters(3));
Out4 = LoPass_Filter(Out3,Sample_Rate,LoPass_Parameters(1),LoPass_Parameters(2));
Out5 = Bell_Filter(Out4,Sample_Rate,Bell1_Parameters(1),Bell1_Parameters(2),Bell1_Parameters(3),Bell1_Parameters(4));
Out6 = Bell_Filter(Out5,Sample_Rate,Bell2_Parameters(1),Bell2_Parameters(2),Bell2_Parameters(3),Bell2_Parameters(4));

Output_Signal=Out6;
Frequency_Spectrum = pspectrum(Output_Signal,Sample_Rate,'FrequencyResolution',150);

end