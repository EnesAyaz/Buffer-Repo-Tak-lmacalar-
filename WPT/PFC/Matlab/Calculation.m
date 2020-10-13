fs=150e3; %Hz
wo=2*pi*fs;
stopTime=0.1;
sampleTime=1e-8;
deadtime= round(((1/fs)/20)/sampleTime);
Vdc=100;
Lp=82e-6; 
Ls=66e-6;
Cs=1/ (Ls*4*pi*pi*150e3*150e3);
Cp=1/ (Lp*4*pi*pi*150e3*150e3);
Cp=Cp*5;
Rp=0.3;
Rs=0.2;
RLOAD=40
k=0.2;
M=sqrt(Lp*Ls)*k;
Cout=1e-6; %F
C2=(Lp-(1/(wo^2*Cp)))/((wo^4*M^4/RLOAD)+(wo^2*(Lp-(1/(wo^2*Cs)))^2))