bg = imread('blank.bmp');
G = bg(:,:,2);
for k=49:56
  bmpFilename = strcat(num2str(k), '.bmp');
  imageData = imread(bmpFilename);
  Gy = bitget(imageData, 1);
  newG = bitset(bitset(bitset(bitset(bitset(bitset(bitset(bitset(G, 8, Gy), 7, Gy), 6, Gy), 5, Gy), 4, Gy), 3, Gy), 2, Gy), 1, Gy);
end
bg(:,:,2) = newG;