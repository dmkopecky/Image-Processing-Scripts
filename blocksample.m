clear all;
FFData=importdata('C:\Users\dillo\Desktop\shg data\2022\06-11-2021\16384-100ms\Sheet3.txt');%location of data file, data file must be single column with dimensions n^2
f = normalize(FFData);%normalize intensity max,min 1,0
n = 128;% set pattern dimension
N = n^2;
eval(['load WalshParams_0914_' num2str(n)]);%load pattern
OMEGA = permy;
A = @(z) At_fWH(z, OMEGA, permx);%define transnform
 d = A(f);%inverse transform data
out = reshape(d',n,n,[]);% reshape 1-D array
z = permute(out,[2 1 3]);%permute to correct order
 im = mat2gray(z);%convert image matrix to 8-bit grayscale
 imshow(im);
 folder = 'C:\Users\dillo\Desktop\shg data\2022\06-11-2021\16384-100ms'; %set location of image output
 fname = fullfile(folder, ['basisscan' '.tif']);
imwrite(im,fname,'tif');
dir(folder)