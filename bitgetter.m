clear all;% DLP4500GUI image creation 
%note: In the GUI the bit planes are defined as G = R, B = G, R = B
 bg = imread('blank.bmp');%This blank black image needs to be 24 bit RGB
for k=49:72% index over images
  bmpFilename{k} = strcat(num2str(k), '.bmp');
   imageData{k} = imread(bmpFilename{k});

end
 for n = 1 : 8% index bitget for RGB
 Ry{n} = bitget(imageData{48+n}, 1);
 end
 for n = 1 : 8
 Gy{n} = bitget(imageData{56+n}, 1);
 end
 for n = 1 : 8
 By{n} = bitget(imageData{64+n}, 1);
 end
 R = bg(:,:,1);% assign bitplanes
 newR = bitset(bitset(bitset(bitset(bitset(bitset(bitset(bitset(R, 8, Ry{8}), 7, Ry{7}), 6, Ry{6}), 5, Ry{5}), 4, Ry{4}), 3, Ry{3}), 2, Ry{2}), 1, Ry{1});
 G = bg(:,:,2);
 newG = bitset(bitset(bitset(bitset(bitset(bitset(bitset(bitset(G, 8, Gy{8}), 7, Gy{7}), 6, Gy{6}), 5, Gy{5}), 4, Gy{4}), 3, Gy{3}), 2, Gy{2}), 1, Gy{1});
 B = bg(:,:,3);
 newB = bitset(bitset(bitset(bitset(bitset(bitset(bitset(bitset(B, 8, By{8}), 7, By{7}), 6, By{6}), 5, By{5}), 4, By{4}), 3, By{3}), 2, By{2}), 1, By{1});
 C = cat(3,newR,newG,newB);% form RGB image
 imwrite(C, 'newG1.bmp');