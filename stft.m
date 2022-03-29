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

y1=amp*sin(omega1*time+theta);
y2=amp*sin(omega2*time+theta);

y=y1+y2;



