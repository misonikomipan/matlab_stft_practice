clear; close all; clc;

[y,Fs] = audioread('step4.wav'); % 音声ファイル認識
inputSignal = y(:,1); % ステレオ音声の片方採取
nyquistFrequecy=Fs/2;
T = size(inputSignal,1)/Fs; % 周期の計算
time = linspace(0,T,T*Fs).';

[powerSpectrogram,nTimeFrame,long]=ps(T,Fs,inputSignal);

maximum = max(max(powerSpectrogram));
xAxis = linspace(0,T,nTimeFrame); % x: 時間軸
yAxis = linspace(0,Fs,long); % y: 周波数軸
sc = imagesc('XData',xAxis,'YData',yAxis,'CData',powerSpectrogram);
axis  tight; % 表示の時の枠補正
caxis([-60 maximum]) % 表示色の範囲指定
ylim([0 nyquistFrequecy])% 反転表示部分カット
colorbar




