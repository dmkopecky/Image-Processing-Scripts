dc = dir('*.bmp');
for file = dc'

    fprintf(1,'Doing something with %s\n',file.name);
    I = imread(file.name);
    %diamond configuration
    %J = imresize(I,[1086 543],'nearest');
    J = imresize(I,[543 272],'nearest');
    %T = blkproc(J, [10 10], @mean2);
    imwrite(J,file.name);
end