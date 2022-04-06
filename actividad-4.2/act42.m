close all 
clear 
I= imread("cameraman.tif"); 
[r,c,d]=size(I); 
if d>1 
 I=rgb2gray(I); 
end 
I=im2double(I); 
PSF = fspecial('motion', 7, 45); 
ID = imfilter(I, PSF, 'conv','circular'); 
MR= 0; 
VR = 0.001; 
IDR = imnoise(ID, 'gaussian',MR,VR); 
Est_Ruido = VR/var(I(:)); 
IrFW = deconvwnr(IDR, PSF, Est_Ruido); 
figure 
subplot(2,2,1), imshow(I), title('Imágen Original'); 
subplot(2,2,2), imshow(ID), title('Imágen I (Conv Circular)');
subplot(2,2,3), imshow(IDR), title('Imágen IDR (imnoise Gaussian)'); 
subplot(2,2,4), imshow(IrFW), title('Imágen IrFW (deconvwnr (Ruido))');