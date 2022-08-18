dc = dir('*.bmp');
for file = dc'

    fprintf(1,'Doing something with %s\n',file.name);
    I = imread(file.name);
    %diamond configuration
    %J = imresize(I,[1086 543],'nearest');
    J = imrotate(I,45);
    imwrite(J,file.name);
end