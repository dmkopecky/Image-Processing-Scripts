dc = dir('*.bmp');
for file = dc'

    fprintf(1,'Doing something with %s\n',file.name);
    I = imread(file.name);
    %I = rgb2gray(I);
    [m n] = size(I);
    p = 768;
    q = 1024;
    %q = 1152;
    K_pad = padarray(I, [floor((p-m)/2) floor((q-n)/2)], 0,'post');
    K_pad = padarray(K_pad, [ceil((p-m)/2) ceil((q-n)/2)], 0,'pre');
    imwrite(K_pad,file.name);
end