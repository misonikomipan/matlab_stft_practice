clear; close all; clc;

[y,Fs] = audioread('step4.wav');
inputSignal = y(:,1);
nyquistFrequecy=Fs/2;
T = size(inputSignal,1)/Fs;

time = linspace(0,T,T*Fs).';

length = 1024;
win = hann(length);

shiftSize = length/2;
rem = rem(T*Fs,shiftSize);
padSize = length-rem;
zeroMatrix = zeros(padSize,1);
fixedWave = cat(1,inputSignal,zeroMatrix);

nTimeFrame = (T*Fs+padSize)/shiftSize-1;
spectrogram = zeros(length,nTimeFrame);

for start = 1:1:nTimeFrame
    startP = 1+(start-1)*shiftSize;
    endP = startP+length-1;
    cutWave = fixedWave(startP:endP);
    cutWaveWin = cutWave.*win;
    spectrogram(:,start) = fft(cutWaveWin);
end

powerSpectrogram = 10*log10(abs(spectrogram).^2);
maximum = max(max(powerSpectrogram));

xAxis = linspace(0,T,nTimeFrame);
yAxis = linspace(0,Fs,length);
sc = imagesc('XData',xAxis,'YData',yAxis,'CData',powerSpectrogram);
axis  tight;
caxis([-60 maximum])
ylim([0 nyquistFrequecy])
colorbar




