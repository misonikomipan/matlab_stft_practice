   
function [powerSpectrogram,nTimeFrame,long] = ps(T,Fs,inputSignal)

long = 1024; % FFT長
win = hann(long); % ハニング窓関数
shiftSize = long/2; % シフト長
remainder = rem(T*Fs,shiftSize); % 全長をシフト長で割った余り
padSize = long-remainder; % 余りをなくすための数
zeroMatrix = zeros(padSize,1); % 余りをなくす分の0行列作成
fixedWave = cat(1,inputSignal,zeroMatrix); % がっちゃんこ

nTimeFrame = (T*Fs+padSize)/shiftSize-1; % シフトの回数
spectrogram = zeros(long,nTimeFrame);

for start = 1:1:nTimeFrame
    startP = 1+(start-1)*shiftSize; % シフトの始点
    endP = startP+long-1; % シフトの終点
    cutWave = fixedWave(startP:endP); % 波形をFFT長にカット
    cutWaveWin = cutWave.*win; % カットした波形に窓関数をかける
    spectrogram(:,start) = fft(cutWaveWin); % 窓関数をかけた波形の列ベクトルを格納
end

powerSpectrogram = 10*log10(abs(spectrogram).^2); % パワースペクトログラム(dB表記)

end