close all;
clear all;
% Get a list of all TIFF files in the current folder AND in all subfolders below it.
fileListing = dir('**/*.tif*');
% For each file we learned of, process it...
numberOfFiles = length(fileListing)
for k = 1 : numberOfFiles
	% Get the full filename (folder & base file name) of this particular file.
	thisFullFileName = fullfile(fileListing(k).folder, fileListing(k).name);
	fprintf('Processing image %d of %d : %s...\n', k, numberOfFiles, thisFullFileName);
	% Now do something with this image. For example, display it:
	% First read image into a variable.
	thisImage = imread(thisFullFileName);
	% Now display it.
% 	imshow(thisImage);
% 	drawnow; % Force immediate refresh of screen.
	% Now perform other operations on the image if you want...
    img1 = imread('img1.tif');
img2 = imread(thisFullFileName);
[bssimval,ssimmap] = ssim(img2,img1);
[cpeaksnr,dsnr] = psnr(img2, img1);
amse = immse(img2, img1);
 folder = 'C:\Users\dillo\Desktop\shg data\2022\06-11-2021\1024-100ms\1Compression';
% stackname=strcat(folder,'\','tabledata','.txt');
T = table(amse, bssimval, cpeaksnr, dsnr);
[~, basename, ~] = fileparts(thisFullFileName);
newFullName = fullfile(folder, [basename '.txt']);
writetable(T,newFullName) 
 
end