function [Output_Signal,Filter] = LoPass_Filter(Input_Signal,Sample_Rate,Cutoff_Frequency,Slope)

Wo=Cutoff_Frequency/(Sample_Rate/2);
[B,A] = designVarSlopeFilter(Slope,Wo,"lo","Orientation","row");
Filter = dsp.BiquadFilter([B,A]);

Output_Signal=Filter(Input_Signal);


end