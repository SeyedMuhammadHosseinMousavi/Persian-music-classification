clc;
clear;
[signal,fs] = audioread('jazz2.wav');
win = 0.050;
step = 0.050;
fs=44100;
%% Time domain features
EnergyEntropy = Energy_Entropy_Block(signal, win*fs, step*fs, 10)';
ShortTimeEnergy = ShortTimeEnergy(signal, win*fs, step*fs);
zerocrossingrate = zcr(signal, win*fs, step*fs, fs);
%Frequency domain features
SpectralRollOff = SpectralRollOff(signal, win*fs, step*fs, 0.80, fs)';
SpectralCentroid = SpectralCentroid(signal, win*fs, step*fs, fs);
SpectralFlux = SpectralFlux(signal,win*fs, step*fs, fs);

% tts(' Six features have been extracted');
% tts(' Features from time-domain are : Energy Entropy , Short Time Energy , zero crossing rate , and , features from frequency domain are : Spectral RollOff , Spectral Centroid , Spectral Flux');

a=ShortTimeEnergy';
b=ShortTimeEnergy';
c=ShortTimeEnergy';

%% Plotting Results
signal=signal(1:end,1);

sizesignal=size(signal);
% plot(1:sizesignal(1),signal);  figure;
sizeEnergyEntropy=size(EnergyEntropy);
% plot(1:sizeEnergyEntropy(1),EnergyEntropy); figure;
sizeShortTimeEnergy=size(ShortTimeEnergy);
% plot(1:sizeShortTimeEnergy(1),ShortTimeEnergy);figure;
sizezerocrossingrate=size(zerocrossingrate);
% plot(1:sizezerocrossingrate(1),zerocrossingrate);figure;
sizeSpectralRollOff=size(SpectralRollOff);
% plot(1:sizeSpectralRollOff(1),SpectralRollOff);figure;
sizeSpectralCentroid=size(SpectralCentroid);
% plot(1:sizeSpectralCentroid(1),SpectralCentroid);figure;
sizeSpectralFlux=size(SpectralFlux);
% plot(1:sizeSpectralFlux(1),SpectralFlux);
% tts(' All figures are generated');

%% Subplotting
figure('units','normalized','outerposition',[0 0 1 1])
subplot(4,2,[1 2])
plot(1:sizesignal(1),signal);title('Wave File '); legend('Test Data,Ney');
subplot(4,2,3)
plot(1:sizeEnergyEntropy(1),EnergyEntropy,'g','LineWidth',1.5);title('Energy Entropy Block '); legend('Time Domain');
subplot(4,2,5)
plot(1:sizeShortTimeEnergy(1),ShortTimeEnergy,'g','LineWidth',1.5);title('Short Time Energy');legend('Time Domain');
subplot(4,2,7)
plot(1:sizezerocrossingrate(1),zerocrossingrate,'g','LineWidth',1.5);title('Zero Crossing Rate'); legend('Time Domain');
subplot(4,2,4)
plot(1:sizeSpectralRollOff(1),SpectralRollOff,'r','LineWidth',1.5);title('Spectral Roll Off'); legend('Frequency Domain');
subplot(4,2,6)
plot(1:sizeSpectralCentroid(1),SpectralCentroid,'r','LineWidth',1.5);title('Spectral Centroid');legend('Frequency Domain');
subplot(4,2,8)
plot(1:sizeSpectralFlux(1),SpectralFlux,'r','LineWidth',1.5); title('Spectral Flux');legend('Frequency Domain');
% tts(' Process is done');


