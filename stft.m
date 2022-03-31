clear; close all; clc;

Fs = 16*1000; % サンプリング周波数
nyquistFrequecy=Fs/2; % ナイキスト周波数
T = 10; % 周期
time = linspace(0,T,T*Fs).';

f1 = 440;
f2 = 2*f1;
omega1 = 2*pi*f1;
omega2 = 2*pi*f2;
theta = 0;

amp = 0.1;

sinWave1 = amp*sin(omega1*time+theta);
sinWave2 = amp*sin(omega2*time+theta);

inputSignal = sinWave1+sinWave2;

[powerSpectrogram,nTimeFrame,long]=ps(T,Fs,inputSignal);

xAxis = linspace(0,T,nTimeFrame); % x: 時間軸
yAxis = linspace(0,Fs,long); % y: 周波数軸
sc = imagesc('XData',xAxis,'YData',yAxis,'CData',powerSpectrogram);
axis  tight; % 表示の時の枠補正
ylim([0 nyquistFrequecy]) % 反転表示部分カット
colorbar



