%% Definitions
clc;clear;
path='c:\data2';   fileinfo = dir(fullfile(path,'*.au'));   filesnumber=size(fileinfo);
for i = 1 : filesnumber(1,1)
[signal{i} fs{i}] = audioread(fullfile(path,fileinfo(i).name));
    disp(['Loading Sound No :   ' num2str(i) ]);
end;
win = 0.050;  step = 0.050;
%% Time domain features

% Energy Entropy
for i = 1 : filesnumber(1,1) 
EnergyEntropy{i}=Energy_Entropy_Block(signal{i},win*fs{i}, step*fs{i},10)'; 
    disp(['EnergyEntropy No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Changing range
EE{i}=EnergyEntropy{i}(1:590,1);
    disp(['EnergyEntropy No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Extracted features
eefeature(i,:)=EE{i};end;
%%
% Short Time Energy
for i = 1 : filesnumber(1,1) 
ShortTimeEnergy{i}=ShortTimeEnergy(signal{i},win*fs{i}, step*fs{i}); 
    disp(['ShortTimeEnergy No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Changing range
STE{i}=ShortTimeEnergy{i}(1:590,1);
    disp(['ShortTimeEnergy No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Extracted features
stefeature(i,:)=STE{i};end;
%%
% Zero Crossing Rate
for i = 1 : filesnumber(1,1) 
ZeroCrossingRate{i}=zcr(signal{i},win*fs{i}, step*fs{i}, fs); 
    disp(['ZeroCrossingRate No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Changing extracted feature range
ZCR{i}=EnergyEntropy{i}(1:590,1);
    disp(['ZeroCrossingRate No :   ' num2str(i) ]);end;

for i = 1 : filesnumber(1,1) % Extracting final features
zcrfeature(i,:)=ZCR{i};end;
%% Labaling
eefinal=feature;
eefinal(1:50,591)=1;
eefinal(51:100,591)=2;
eefinal(101:150,591)=3;

stefinal=feature;
stefinal(1:50,591)=1;
stefinal(51:100,591)=2;
stefinal(101:150,591)=3;

zcrfinal=feature;
zcrfinal(1:50,591)=1;
zcrfinal(51:100,591)=2;
zcrfinal(101:150,591)=3;

