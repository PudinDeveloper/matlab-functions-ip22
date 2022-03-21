F= imread('C:\Users\diego\Pictures\Eciudad.jpg');
I= imread('C:\Users\diego\Pictures\plane.jpg');
figure, title('Imágenes Originales')
subplot(1,2,1), imshow(F); title('Imagen Original')
subplot(1,2,2), imshow(I); title('Imagen Original')

Fc=F; %size 1200x1920

figure,
subplot(1,2,1), imshow(Fc); title('Imagen recortada del fondocon imcrop')

[rF,cF, i]=size(F);
[rI,cI,i]=size(I);
figure, imshow(I)
drawcircle