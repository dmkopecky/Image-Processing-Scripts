close all;
clear all;
I = imread('groundtruth.tif');
[Gmag, Gdir] = imgradient(I,'prewitt');
figure
imshowpair(Gmag, Gdir, 'montage');
title('Gradient Magnitude, Gmag (left), and Gradient Direction, Gdir (right), using Prewitt method')