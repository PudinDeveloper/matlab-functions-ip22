close all 
clear 
% La imagen se lee.
I= imread("cameraman.tif");
% En estas variables se guarda el tamaño de la imagen.
[r,c,d]=size(I); 
% Aquí se comprueba que la imagen sea blanco y negro.
if d>1 
 I=rgb2gray(I); 
end
% La imagen se convierte en tipo de dato double.
I=im2double(I); 
% Se aplica la degradación motion con la función fspecial().
PSF = fspecial('motion', 100, 450); 
% Se aplica el filtro de convolución circular.
ID = imfilter(I, PSF, 'conv','circular');
% En estas variables se especifíca el nivel de ruido.
MR = 0; % MR = valores de luminosidad.
VR = 0.001; % VR = Nivel de ruido.
% Se aplica ruido gaussiano usando las variables anteriores.
IDR = imnoise(ID, 'gaussian',MR,VR);
% Se agregan los valores y patrones de la imagen en la variable.
Est_Ruido = VR/var(I(:));
% Se utilizan variables anteriores que contienen ruido, degradación e
% información para restaurar la imagen.
IrFW = deconvwnr(IDR, PSF, Est_Ruido); 
% Se muestran los resultados en un subplot.
figure 
subplot(2,2,1), imshow(I), title('Imagen Original'); 
subplot(2,2,2), imshow(ID), title('Imagen I (Conv Circular)');
subplot(2,2,3), imshow(IDR), title('Imagen IDR (imnoise Gaussian)'); 
subplot(2,2,4), imshow(IrFW), title('Imagen IrFW (deconvwnr (Ruido))');