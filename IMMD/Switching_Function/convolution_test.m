fsw=4e4;
carrier_phase=0;
sampleTime=1e-8;
ModulationIndex=0.9;
ffund=50;
fundemental_phase=0;
Phase_Current=10;
load_phase=0;
sim('switching_simulink',0.04);
%%
time=Phase_current.time;
phase_current=Phase_current.data;
leg_current=Leg_Current.data;
fundamental=fundmental.data;
carrier=Carrier.data;
switchingFunc= switching_func.data;
%%
L=length(phase_current);
phase_current_FFT_mag=fft(phase_current);
phase_current_FFT_mag=abs(phase_current_FFT_mag/L);
phase_current_FFT_mag=phase_current_FFT_mag(1:L/2+1);
phase_current_FFT_mag(2:end-1)=2*phase_current_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


phase_current_FFT_angle=fft(phase_current);
phase_current_FFT_angle=angle(phase_current_FFT_angle);
phase_current_FFT_angle=phase_current_FFT_angle(1:L/2+1);

threshold=max(abs(phase_current_FFT_mag)/100);
phase_current_FFT_angle(abs(phase_current_FFT_mag)<threshold)=0; 
phase_current_FFT_mag(abs(phase_current_FFT_mag)<threshold)=0;

figure();
plot(f,phase_current_FFT_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure();
plot(f,180*phase_current_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
xlim([0 300])
ylabel('Phase <Angle')
%%
L=length(leg_current);
leg_current_FFT_mag=fft(leg_current);
leg_current_FFT_mag=abs(leg_current_FFT_mag/L);
leg_current_FFT_mag=leg_current_FFT_mag(1:L/2+1);
leg_current_FFT_mag(2:end-1)=2*leg_current_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


leg_current_FFT_angle=fft(leg_current);
leg_current_FFT_angle=angle(leg_current_FFT_angle);
leg_current_FFT_angle=leg_current_FFT_angle(1:L/2+1);


threshold=max(abs(leg_current_FFT_mag)/100);
leg_current_FFT_angle(abs(leg_current_FFT_mag)<threshold)=0; 
leg_current_FFT_mag(abs(leg_current_FFT_mag)<threshold)=0;

figure();
plot(f,leg_current_FFT_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure();
plot(f,180*leg_current_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% xlim([0 300])
ylabel('Phase <Angle')
%%


L=length(fundamental);
fundamental_FFT_mag=fft(fundamental);
fundamental_FFT_mag=abs(fundamental_FFT_mag/L);
fundamental_FFT_mag=fundamental_FFT_mag(1:L/2+1);
fundamental_FFT_mag(2:end-1)=2*fundamental_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


fundamental_FFT_angle=fft(fundamental);
fundamental_FFT_angle=angle(fundamental_FFT_angle);
fundamental_FFT_angle=fundamental_FFT_angle(1:L/2+1);

threshold=max(abs(fundamental_FFT_mag)/100);
fundamental_FFT_angle(abs(fundamental_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
fundamental_FFT_mag(abs(fundamental_FFT_mag)<threshold)=0;


figure();
plot(f,fundamental_FFT_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure();
plot(f,180*fundamental_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% xlim([0 300])
ylabel('Phase <Angle')

%%


L=length(carrier);
carrier_FFT_mag=fft(carrier);
carrier_FFT_mag=abs(carrier_FFT_mag/L);
carrier_FFT_mag=carrier_FFT_mag(1:L/2+1);
carrier_FFT_mag(2:end-1)=2*carrier_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


carrier_FFT_angle=fft(carrier);
carrier_FFT_angle=angle(carrier_FFT_angle);
carrier_FFT_angle=carrier_FFT_angle(1:L/2+1);

threshold=max(abs(carrier_FFT_mag)/100);
carrier_FFT_angle(abs(carrier_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
carrier_FFT_mag(abs(carrier_FFT_mag)<threshold)=0;


figure();
plot(f,carrier_FFT_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure();
plot(f,180*carrier_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% xlim([0 300])
ylabel('Phase <Angle')

%% 
L=length(switchingFunc);
switchingFunc_FFT_mag=fft(switchingFunc);
switchingFunc_FFT_mag=abs(switchingFunc_FFT_mag/L);
switchingFunc_FFT_mag=switchingFunc_FFT_mag(1:L/2+1);
switchingFunc_FFT_mag(2:end-1)=2*switchingFunc_FFT_mag(2:end-1);
f = (1/sampleTime)*(0:(L/2))/L;


switchingFunc_FFT_angle=fft(switchingFunc);
switchingFunc_FFT_angle=angle(switchingFunc_FFT_angle);
switchingFunc_FFT_angle=switchingFunc_FFT_angle(1:L/2+1);

threshold=max(abs(switchingFunc_FFT_mag)/100);
switchingFunc_FFT_angle(abs(switchingFunc_FFT_mag)<threshold)=0; % determines the low-amplitude threshold
switchingFunc_FFT_mag(abs(switchingFunc_FFT_mag)<threshold)=0;


figure();
plot(f,switchingFunc_FFT_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
figure();
plot(f,180*switchingFunc_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% xlim([0 300])
ylabel('Phase <Angle')

%%

f_new_left=f-ffund;
f_new_left = [f_new_left f(end) f(end)+ffund];
leg_current_left_mag= [(switchingFunc_FFT_mag*Phase_Current)/2 ;0 ;0 ];
leg_current_left_angle=[(switchingFunc_FFT_angle-load_phase) ;0 ;0 ];

%%

f_new_right=f+ffund;
f_new_right = [-ffund 0 f_new_right ];
leg_current_right_mag= [0;0;(switchingFunc_FFT_mag*Phase_Current)/2];
leg_current_right_angle=[0;0;(switchingFunc_FFT_angle+load_phase)];



%%
% leg_current_real_mag =leg_current_left_mag.^2+leg_current_right_mag.^2+ ...
%     2*leg_current_right_mag.*leg_current_left_mag.*cos(leg_current_right_angle).*cos(leg_current_left_angle);
% leg_current_real_mag=sqrt(leg_current_real_mag);
% 
% leg_current_real_angle= leg_current_left_mag.*cos(leg_current_left_angle)+ ...
%     leg_current_right_mag.*cos(leg_current_right_angle);
% leg_current_real_angle=acos(leg_current_real_angle./leg_current_real_mag);


%%
figure();
stem(f,leg_current_FFT_mag) 
hold on; 
stem(f_new_right,leg_current_real_mag) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([-100 300])

%%
figure();
plot(f,180*leg_current_FFT_angle/pi) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
% xlim([0 300])
ylabel('Phase <Angle')









