gatitoOr = imread("./imagenes/gatito.jpg");
gatito = rgb2gray(gatitoOr);
gatito = (imbinarize(gatito));

b = [0, 1, 0; 1, 1, 1; 0, 1, 0];

d = imdilate(gatito, b);
e = imerode(gatito, b);

cierre = imerode(d, b);
apertura = imdilate(e, b);

% Hay que sacar los 2, y luego juntarlos. Combinarlos.

% imshow(c);

% bwmorph skeleton procesos de erosion comtinuas mientras haya un pixel
% vivo

figure 
subplot(2,3,1), imshow(gatitoOr), title('Imagen Original'); 
subplot(2,3,4), imshow(gatito), title('Imagen Binarizada'); 
subplot(2,3,2), imshow(d), title('Imagen Dilatada'); 
subplot(2,3,5), imshow(e), title('Imagen Erosionada');
subplot(2,3,3), imshow(cierre), title('Imagen Cierre');
subplot(2,3,6), imshow(apertura), title('Imagen Apertura');
% imshow(graythresh(gatito));