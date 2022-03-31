clear; close all; clc;

Fs = 16*1000;
nyquistFrequecy=Fs/2;
T = 10;
time = linspace(0,T,T*Fs).';

f1 = 440;
f2 = 2*f1;
omega1 = 2*pi*f1;
omega2 = 2*pi*f2;
theta = 0;

amp = 0.1;

sinwave1 = amp*sin(omega1*time+theta);
sinwave2 = amp*sin(omega2*time+theta);

sinwave = sinwave1+sinwave2;

length = 1024;
win = hann(length);

shiftSize = length/2;
rem = rem(T*Fs,shiftSize);
padSize = length-rem;
zeroMatrix = zeros(padSize,1);
fixedWave = cat(1,sinwave,zeroMatrix);

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

xAxis = linspace(0,T,nTimeFrame);
yAxis = linspace(0,Fs,length);
sc = imagesc('XData',xAxis,'YData',yAxis,'CData',powerSpectrogram);
axis  tight;
ylim([0 nyquistFrequecy])
colorbar



