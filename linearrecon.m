
%%%%%linear Reconstruction-07132016%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%step 1 % remove the spikes and display the soothing spectrum
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath(genpath('C:\Users\dillo\Documents\MATLAB\backup\SB1\projector_camera'));
cd 'C:\Users\dillo\Documents\MATLAB\backup\SB1\projector_camera'

close all;
clear all;
clc;
figure;
%load the pattern data
%
%a test
%FFData=importdata('C:\Users\dillo\Desktop\shg data\test\08202016\Linear-image\Cu-KCN-Linear-4096-202.txt');
FFData=importdata('C:\Users\dillo\Desktop\shg data\2022\06-11-2021\1024-100ms\sheet1.txt');
%FFData=importdata('C:\Users\dillo\Documents\MATLAB\backup\SB1\projector_camera\myFile256.txt');
%FFData=FFData*(1);
NN=32;
for k = 1:99
pkeep = .01*k;
warm_up;
[estIm] = cam_recon_TVAL3_4UH(FFData,1,pkeep,NN,2^4,2^7,1e-3);
image0 = reshape(estIm, NN, NN);
% coeffs: encoded data
% 
% StartID: the starting index of measurements used for recovery
%
% pkeep: percent to keep, which must be between 0 and 1
%
% sidelength: side length of square image
%
% mu, beta, tol: optional parameters. The user can igore these three inputs. 
%           The algorithm will assign some default values for them in that 
%           case. If one want to assign them manually, choose both mu and 
%           beta in [2^3, 2^8], based on the noise level and recovery percentage. 
%           Simply enumerating different choices is feasible, and recommended. 


% eg: estIm = cam_recon_TVAL3_4UH(coeffs,1,0.99,64,10^6,10^6);
% estIm is a 4d datacube, its size is [sidelength,sidelength,1,numberofspectrum]
% with first two demensions are in space; the last one is he spectrum

%figure;
imagesc(image0);
colormap(gray);
axis equal;
folder = 'C:\Users\dillo\Desktop\shg data\2022\06-11-2021\1024-100ms\1Compression'; 
%stackname=strcat(folder,'\','CS_image','.tif');
%stacksname=strcat(folder,'\','CS_384','.tif');
%stackssname=strcat(folder,'\','CS_512','.tif');
% image=image0;
% image=(image-min(min(image)))/(max(max(image))-min(min(image)))*100000;
% Dimage=uint16(image);
% Eimage = imresize(Dimage, [512, 512], 'nearest');
%Dimage=fliplr(Dimage);
%Dimage=imrotate(Dimage,-45);
image0=fliplr(image0);
image0=imrotate(image0,90);
%imwrite(mat2gray(image0),stackname);
fname = fullfile(folder, ['Image' num2str(pkeep) '.tif']);
imwrite(mat2gray(image0),fname,'tif');
dir(folder)
end
%imwrite(Eimage,stacksname);
% imwrite(imresize(mat2gray(image0),[512 512],'nearest'),stackssname);
%imwrite(imresize(mat2gray(image0),[512 512],'nearest'),stackssname);