clear;
%Detect objects using Viola-Jones Algorithm
%To detect Face
FDetect = vision.CascadeObjectDetector;
%Read the input images
path='c:\seven jaffe';
fileinfo = dir(fullfile(path,'*.jpg'));
filesnumber=size(fileinfo);
for i = 1 : filesnumber(1,1)
images{i} = imread(fullfile(path,fileinfo(i).name));
    disp(['Loading image No :   ' num2str(i) ]);
end;
%Returns Bounding Box values based on number of objects
for i = 1 : filesnumber(1,1)
BB{i}=step(FDetect,(imread(fullfile(path,fileinfo(i).name)))); 
end;
%Removing other founded faces and keep just frist face or box
for  i = 1 : filesnumber(1,1)
    BB{i}=BB{i}(1,:);
end;
% find number of empty BB and index of them
c=0;
for  i = 1 : filesnumber(1,1)
   if  isempty(BB{i})
        c=c+1;
        indexempty(c)=i;
   end;
end;
% replace the empty cells with bounding box
for  i = 1 : c
BB{indexempty(i)}=[40 60 180 180];
end;

%Removing other founded faces and keep just frist face or box
for  i = 1 : filesnumber(1,1)
    BB{i}=BB{i}(1,:);
end;
%% Croping the Bounding box(face)
for i = 1 : filesnumber(1,1)
croped{i}=imcrop(images{i},BB{i}); 
    disp(['Croped :   ' num2str(i) ]);
end;
% for i = 1 : filesnumber(1,1)
% figure;subimage(croped{i});end;

%%  Enhance the contrast of an intensity image using histogram equalization.
%rgb to gray convertion
for i = 1 : filesnumber(1,1)
hist{i}=rgb2gray(croped{i});
    disp(['To Gray :   ' num2str(i) ]);
end;
%histeq
for i = 1 : filesnumber(1,1)
histequation{i}=histeq(hist{i}); 
    disp(['Hist EQ :   ' num2str(i) ]);
end;
%imadjust
for i = 1 : filesnumber(1,1)
adjusted{i}=imadjust(hist{i}); 
    disp(['Image Adjust :   ' num2str(i) ]);
end;
%% resize the final image size
imagesize=BB{1}(1,3);
for i = 1 : filesnumber(1,1)
resized{i}=imresize(adjusted{i}, [imagesize NaN]); 
    disp(['Image Resized :   ' num2str(i) ]);
end;

%% Sharp polished feature applaing
for i = 1 : filesnumber(1,1)
sharp{i}=sharppolished(resized{i}); 
    disp(['No of Sharp Polished :   ' num2str(i) ]);
end;
% for i = 1 : 10
% figure;subimage(sharp{i});end;
%% sum feature selection
for i = 1 : filesnumber(1,1)
feature(i,:)=sum(sharp{i});
end;

%% labaling



