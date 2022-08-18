close all;
clear all;
fid_p = fopen('File_all.txt','w'); % writing file id
x = 1:99;
for i =1:length(x)
    pkeep = x*.001;
    filename = ['Image',num2str(pkeep(i)),'.txt'];%filename
    fid_t=fopen(filename,'r');%open it and pass id to fscanf (reading file id)
    data = fscanf(fid_t,'%c');%read data
    fprintf(fid_p,'%c',data);%print data in File_all
    fclose(fid_t);% close reading file id
end
fclose(fid_p); %close writing file id
