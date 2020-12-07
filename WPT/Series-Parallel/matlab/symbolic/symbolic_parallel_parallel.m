syms k
syms Zs;
syms RL;
syms RL1;

a= (k^2-1)*RL^2-Zs^2;

b=2*RL*Zs^2;

c=(k^2-1)*RL^2*Zs^2;

ans=solve(a*RL1^2+ b*RL1+ c,RL1)
kx=[];
%%
fo=150e3;
wo=2*pi*150e3;
Ls=22e-6; %% adityadan farkl? olarak asl?nda Quality 4 den 1e indirdim
Cs= 1/(wo^2*Ls);
RL= 16;
M=9.7e-6; %% bu y�zden mutual? indirdim primer ak?m gereksinimi artt? 

k=0;
% 0.95 0.90 0.80 0.4 0
% kx=[kx ((1-k)/(2))]
% M1=M*(1+a1);
% M2=M*(1-a1);
RL1=[];
wRL=[];
for  f=1e5:1e3:2e5
    w=2*pi*f;
   wRL=[wRL w];
    Zs=abs((1i*w*Ls)/(1-w^2*Cs*Ls));
     Rx=  (RL*Zs^2 + RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
%  Rx= (RL*Zs^2 - RL*Zs*((- RL*k^2 + Zs*k + RL)*(RL*k^2 + Zs*k - RL))^(1/2))/(- RL^2*k^2 + RL^2 + Zs^2);
 
 
    RL1=[RL1 Rx];

   
end




RL1(RL1<16)=16;
plot(wRL/(2*pi),32./RL1,'LineWidth',3);
hold on; 
RL2=1./((1/RL)-(1./RL1));
% RL2(RL2>64)=NaN;
plot(wRL/(2*pi),32./RL2,'--','LineWidth',3);
hold on;

%%
line([1e5 2e5], [32 32],'LineWidth',3)

%%

