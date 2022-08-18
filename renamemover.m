clear all;
a ='C:\Users\dillo\Desktop\mover';
A =dir( fullfile(a, '*.bmp') );
fileNames = { A.name };
for iFile = 1 : numel( A )
        for y = 2*iFile-1
  newName = fullfile(a, sprintf( '%y.bmp',iFile) );
  movefile( fullfile(a, fileNames{ iFile }), newName );
        end
end 