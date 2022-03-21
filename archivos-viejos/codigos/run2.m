%Reading the image
image = imread('C:\Users\diego\Pictures\Eciudad.jpg');
%Transforming the image to grayscale
image = rgb2ycbcr(image);
y = image(:,:,1);
Cb = image(:,:,2);
Cr = image(:,:,3);
ye= y;
Cebe=ecualizar(Cb);
Cere=ecualizar(Cr);
imgeq = cat(3,ye,Cebe,Cere);
imgeq=uint8(imgeq);
imgeq = ycbcr2rgb(imgeq);
image= ycbcr2rgb(image);
%Representacion Grafica
figure(1)
subplot(2,2,1);imshow(image);title('Imagen Original');
subplot(2,2,2);histogram(y,'BinMethod','integers','FaceColor','r','EdgeAlpha',0,'FaceAlpha',1)
hold on
histogram(Cb,'BinMethod','integers','FaceColor','g','EdgeAlpha',0,'FaceAlpha',0.7)
histogram(Cr,'BinMethod','integers','FaceColor','b','EdgeAlpha',0,'FaceAlpha',0.7)
title('Histo.Im.Orig');
subplot(2,2,3);imshow(imgeq);title('Imagen Ecualiz.');
subplot(2,2,4);histogram(ye,'BinMethod','integers','FaceColor','r','EdgeAlpha',0,'FaceAlpha',1)
hold on
histogram(Cebe,'BinMethod','integers','FaceColor','g','EdgeAlpha',0,'FaceAlpha',0.7)
histogram(Cere,'BinMethod','integers','FaceColor','b','EdgeAlpha',0,'FaceAlpha',0.7)
title('Histo.Im.Ecualiz.');