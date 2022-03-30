clear; close all; clc;

Fs=16*1000;
T=10;
time=linspace(0,T,T*Fs).';

f1=440;
f2=2*f1;
omega1=2*pi*f1;
omega2=2*pi*f2;
theta=0;

amp=0.1;

sinwave1=amp*sin(omega1*time+theta);
sinwave2=amp*sin(omega2*time+theta);

sinwave=sinwave1+sinwave2;

length=1024;
win=hann(length);

shiftSize=length/2;
rem=1-T*Fs/shiftSize;
correctionDigit=shiftSize*rem;
fixedwave=padarray(sinwave,correctionDigit,0,'post');

column=T*Fs/shiftSize;
spectrogram=zeros(length,column);

for start=0:shiftSize:T*Fs
    cutwave=fixedwave(start:start+length);
    cutwavewin=cutwaxe.*win;
    gaincolumn=(start/512)+1;
    spectrogram(:,gaincolumn)=fft(cutwavewin);
end



