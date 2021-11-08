%% Definitions
clc;clear;
path='c:\data2';
fileinfo = dir(fullfile(path,'*.au')); 
filesnumber=size(fileinfo);
for i = 1 : filesnumber(1,1)
[signal{i} fs{i}] = audioread(fullfile(path,fileinfo(i).name));
    disp(['Loading Sound No :   ' num2str(i) ]);
end;
win = 0.050;  step = 0.050;
fs2=fs{1};
fs3=44100;
% signalsize=size(signal{1});
for i=1 : filesnumber(1,1)
    s(:,i)=signal{i}(1:661000,1);
    disp(['Cell to Array :   ' num2str(i) ]);
end;
sizes=size(s);
sizes=sizes(1,1);
%% Spectral Roll Off
for i = 1 : filesnumber(1,1)
SRO(i,:)=SpectralRollOff(s(1:sizes,i),win*fs2, step*fs2, 0.80, fs2); 
disp(['SpectralRollOff No :   ' num2str(i) ]);end;

%% SpectralCentroid
for i = 1 : filesnumber(1,1)
SC(i,:)=SpectralCentroid(s(1:sizes,i),win*fs3, step*fs3,fs3); 
disp(['SpectralCentroid No :   ' num2str(i) ]);end;

%% SpectralFlux
for i = 1 : filesnumber(1,1)
SF(i,:)=SpectralFlux(s(1:sizes,i),win*fs3, step*fs3,fs3); 
disp(['SpectralFlux No :   ' num2str(i) ]);end;

%% Labaling
% Spectral Roll Off
srofinal=SRO;
srofinal(1:50,600)=1;
srofinal(51:100,600)=2;
srofinal(101:150,600)=3;

% SpectralCentroid
scfinal=SC;
scfinal(1:50,300)=1;
scfinal(51:100,300)=2;
scfinal(101:150,300)=3;

% SpectralFlux
sffinal=SF;
sffinal(1:50,300)=1;
sffinal(51:100,300)=2;
sffinal(101:150,300)=3;
