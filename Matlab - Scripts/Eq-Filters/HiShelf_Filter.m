function [Output_Signal,B,A] = HiShelf_Filter(Input_Signal,Sampling_Frequency,Center_Frequency,Gain,Slope)

%Calculamos los parametros necesarios para la funcion del filtro
Wo=Center_Frequency/(Sampling_Frequency/2);


[B,A] = designShelvingEQ(Gain,Slope,Wo,"hi","Orientation","row");
Filter = dsp.BiquadFilter([B,A]);

Output_Signal=Filter(Input_Signal);

end