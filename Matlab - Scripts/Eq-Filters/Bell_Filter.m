function [Output_Signal,Filter] = Bell_Filter(Input_Signal,Sample_Rate,Center_Frequency,Gain,Quality,Order)

%Calculamos los parametros necesarios para la funcion del filtro
Wo=Center_Frequency/(Sample_Rate/2);
BW=Wo/Quality;

[B,A] = designParamEQ(Order,Gain,Wo,BW,"Orientation","row");
Filter = dsp.BiquadFilter([B,A]);

Output_Signal=Filter(Input_Signal);

end

