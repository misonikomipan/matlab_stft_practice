clear; close all; clc;

[y, Fs] = audioread('step4.wav');
inputSignal = y(:, 1); % ステレオ音声の片方採取
nyquistFrequecy=Fs/2;
T = size(inputSignal, 1)/Fs; % 信号長の計算
time = linspace(0, T, T*Fs).';

[powerSpectrogram, nTimeFrame, fftLength]=ps(T, Fs, inputSignal);

maximum = max(max(powerSpectrogram));
xAxis = linspace(0, T, nTimeFrame); % x: 時間軸
yAxis = linspace(0, Fs,  fftLength); % y: 周波数軸
sc = imagesc('XData', xAxis, 'YData', yAxis, 'CData', powerSpectrogram);
axis  tight;
caxis([-60 maximum])
ylim([0 nyquistFrequecy])% 反転表示部分カット
colorbar




