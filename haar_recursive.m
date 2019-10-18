function [M] = haar_recursive(M,n,mask,pixel)
% when imput, leave M as []
% for DMD mask and pixel are 1
% example: haar_recursive([],2,1,1)
if n == 0
    M(end + 1,:) = mask(:);
end
if n > 0
    mask1(1:pixel,1:pixel) = mask;
    mask1(pixel+1:2*pixel,1:pixel) = mask;
    mask1(1:pixel,pixel+1:2*pixel) = mask;
    mask1(pixel+1:2*pixel,pixel+1:2*pixel) = mask;
    
    mask2(1:pixel,1:pixel) = mask;
    mask2(pixel+1:2*pixel,1:pixel) = mask;
    mask2(1:pixel,pixel+1:2*pixel) = 0;
    mask2(pixel+1:2*pixel,pixel+1:2*pixel) = 0;
    
    mask3(1:pixel,1:pixel) = mask;
    mask3(pixel+1:2*pixel,1:pixel) = 0;
    mask3(1:pixel,pixel+1:2*pixel) = mask;
    mask3(pixel+1:2*pixel,pixel+1:2*pixel) = 0;
    
    mask4(1:pixel,1:pixel) = mask;
    mask4(pixel+1:2*pixel,1:pixel) = 0;
    mask4(1:pixel,pixel+1:2*pixel) = 0;
    mask4(pixel+1:2*pixel,pixel+1:2*pixel) = mask;
    
    M = haar_recursive(M,n-1,mask1,pixel*2);
    M = haar_recursive(M,n-1,mask2,pixel*2);
    M = haar_recursive(M,n-1,mask3,pixel*2);
    M = haar_recursive(M,n-1,mask4,pixel*2);
end
end