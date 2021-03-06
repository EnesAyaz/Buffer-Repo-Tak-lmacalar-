ats=time(2)-time(1);
fs=1/ts;
number_of_sample= fs/50;

starting=1+1*number_of_sample;
ending= 1+2*number_of_sample;
figure('name','Load Current')
plot(time((starting:ending)),load_cur_A(starting:ending));
hold on; 
plot(time((starting:ending)),load_cur_B(starting:ending));
hold on;
plot(time((starting:ending)),load_cur_C(starting:ending));
title('Load Current');
ylabel('Current(A)');
xlabel('Time(s)');

%% SAIA 
SAIA_new=SAIA(starting:ending);
yA = fft(SAIA_new);
LA=length(yA);
SAIA_mag2= abs(yA/LA);
SAIA_mag=SAIA_mag2(1:LA/2+1);
SAIA_mag(2:end-1)=2*SAIA_mag(2:end-1);
P2A_phase= angle(yA/LA);
SAIA_angle=P2A_phase(1:LA/2+1);
fA= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fA,SAIA_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fA,SAIA_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])

%% SBIB

SBIB_new=SBIB(starting:ending);
yA = fft(SBIB_new);
LA=length(yA);
SBIB_mag2= abs(yA/LA);
SBIB_mag=SBIB_mag2(1:LA/2+1);
SBIB_mag(2:end-1)=2*SBIB_mag(2:end-1);
P2A_phase= angle(yA/LA);
SBIB_angle=P2A_phase(1:LA/2+1);
fB= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fB,SBIB_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fB,SBIB_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%% SCIC
SCIC_new=SCIC(starting:ending);
yA = fft(SCIC_new);
LA=length(yA);
SCIC_mag2= abs(yA/LA);
SCIC_mag=SCIC_mag2(1:LA/2+1);
SCIC_mag(2:end-1)=2*SCIC_mag(2:end-1);
P2A_phase= angle(yA/LA);
SCIC_angle=P2A_phase(1:LA/2+1);
fC= fs*(0:(LA/2))/LA;

figure();
subplot(2,1,1)
stem(fC,SCIC_mag);
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fC,SCIC_angle);
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%%
%% w axis
w=2*pi*fA;

%% Parameter values
LATop  = 03.40e-9;
LABot  = 20.25e-9;
LAMid  = 01.30e-9;
LBTop  = 03.38e-9;
LBBot  = 20.38e-9;
LBMid  = 01.30e-9;
LCTop  = 03.41e-9;
LCBot  = 20.94e-9;
LCMid  = 01.30e-9;
LABTop = 18.30e-9;
LABBot = 10.20e-9;
LBCTop = 21.84e-9;
LBCBot = 11.14e-9;

ESLA = 19e-15;
ESLB = 19e-15;
ESLC = 19e-15;

C1A = 5e-6;
C1B = 5e-6;
C1C = 5e-6;
%% New merged inducances - phA
L1_phA = LATop + LABot + ESLA;
L2_phA = LABTop;
L3_phA = LABBot;
L4_phA = ESLB;
L5_phA = LBTop + LBBot + LBCTop + LBCBot + ESLC;
%% Calculated impedances - phA
Z1_phA = 1i*w*L5_phA + 1./(1i*w*C1C);
Z2_phA = 1i*w*L4_phA + 1./(1i*w*C1B);
Z3_phA = Z1_phA.*Z2_phA./(Z1_phA+Z2_phA);
Z4_phA = Z3_phA + 1i*w*(L2_phA+L3_phA);
Z5_phA = 1i*w*L1_phA + 1./(1i*w*C1A);
Zeqv_phA = Z4_phA.*Z5_phA./(Z4_phA+Z5_phA);
%% Capacitor A 
capA_phA= Z4_phA./(Z4_phA+Z5_phA);
%% New merged inducances - phB
L1_phB = LATop + LABot + LABTop + LABBot + ESLA;
L2_phB = ESLB;
L3_phB = LBTop + LBBot;
L4_phB = LBCTop + LBCBot + ESLC;
%% Calculated impedances - phB
Z1_phB = 1i*w*L1_phB + 1./(1i*w*C1A);
Z2_phB = 1i*w*L2_phB + 1./(1i*w*C1B);
Z3_phB = Z1_phB.*Z2_phB./(Z1_phB+Z2_phB);
Z4_phB = Z3_phB + 1i*w*(L3_phB);
Z5_phB = 1i*w*L4_phB + 1./(1i*w*C1C);
Zeqv_phB = Z4_phB.*Z5_phB./(Z4_phB+Z5_phB);
%% capacitor A
capA_phB=(Z5_phB./(Z4_phB+Z5_phB)).*(Z2_phB./(Z1_phB+Z2_phB));
%% New merged inducances - phC
L1_phC = LATop + LABot + LABTop + LABBot + ESLA;
L2_phC = ESLB;
L3_phC = LBTop + LBBot + LBCTop + LBCBot;
L4_phC = ESLC;
L5_phC = LCTop + LCBot;
%% Calculated impedances - phC
Z1_phC = 1i*w*L1_phC + 1./(1i*w*C1A);
Z2_phC = 1i*w*L2_phC + 1./(1i*w*C1B);
Z3_phC = Z1_phC.*Z2_phC./(Z1_phC+Z2_phC);
Z4_phC = Z3_phC + 1i*w*(L3_phC);
Z5_phC = 1i*w*L4_phC + 1./(1i*w*C1C);
Z6_phC = Z4_phC.*Z5_phC./(Z4_phC+Z5_phC);
Zeqv_phC = Z6_phC + 1i*w*L5_phC;
%% capacitor A
capA_phC=(Z5_phC./(Z4_phC+Z5_phC)).*(Z2_phC./(Z1_phC+Z2_phC));
%%
figure();
subplot(2,1,1)
stem(fC,abs(capA_phC));
ylabel('Mag')
xlabel('Frequency')
xlim([0 120000])
subplot(2,1,2)
stem(fC,angle(capA_phC));
ylabel('Angle')
xlabel('Frequency')
xlim([0 120000])
%%
k=length(SAIA_mag);
capA=SAIA_mag(1:k)'.*capA_phA(1:k)+SBIB_mag(1:k)'.*capA_phB(1:k)+SCIC_mag(1:k)'.*capA_phC(1:k);
figure();
stem(fA(1:k),capA(1:k));
ylabel('Mag')
xlabel('Frequency')
xlim([0 200000])

%% cap A current

capA_cur_new=capA_cur(starting:ending);
yA = fft(capA_cur_new);
LA=length(yA);
capA_cur_mag2= abs(yA/LA);
capA_cur_mag=capA_cur_mag2(1:LA/2+1);
capA_cur_mag(2:end-1)=2*capA_cur_mag(2:end-1);
P2A_phase= angle(yA/LA);
r
capA_cur_angle=P2A_phase(1:LA/2+1);
fA= fs*(0:(LA/2))/LA;


figure();
stem(fA(1:k),capA_cur_mag(1:k));
ylabel('Mag')
xlabel('Frequency')
xlim([0 200000])

%%

figure();
stem(fA(1:k),capA_cur_mag(1:k));
hold on;
stem(fA(1:k),capA(1:k));
% xlim([119000 121000])

ylabel('Mag','FontSize',14,'FontWeight','Bold')
xlabel('Frequency','FontSize',14,'FontWeight','Bold')
legend({'Simulation Result','Impedance Model'},'Location','best');
title('Capacitor A ')







