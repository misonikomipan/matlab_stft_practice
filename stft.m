clear; close all; clc;

Fs=16*1000;
T=10;
t=linspace(0,T,T*Fs).';

f1=440;
f2=2*f1;
omega1=2*pi*f1;
omega2=2*pi*f2;
theta=0;

A=0.1;

y1=A*sin(omega1*t+theta);
y2=A*sin(omega2*t+theta);

y=y1+y2;

plot(t,y)



