%sequence matrix
clear all;
n = 32;
N = n^2;
warm_up;
eval(['load WalshParams_0914_' num2str(n)]);
pwh = A_fWH(eye(N),permy,permx);
% H = fWHtrans(i); for generating higher ordre e.g. n = 256
 pwh(pwh<0)=0;
 pwh(pwh>0)=1;
% B = H(:,permx);
% C = B(permy,:);
%black array
% B = zeros(16384,'uint8');
%white array
%B = 255*ones(16384,'uint8');
%b = kron(pwh,ones(24));
%out = reshape(B',n,n,[]);
out = reshape(pwh',n,n,[]);
z = permute(out,[2 1 3]);
   for x = 1 : N
   %    for y = 2*x-1
   for y = x
           imwrite(z(:,:,x),strcat(num2str(y),'.bmp'));
       end
   end
%save('pwh3dones.mat', 'z');
