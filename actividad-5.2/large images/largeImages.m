% Parte 1 - Imágen Original
BW1 = imread('circbw.tif');
figure
imshow(BW1);

% Parte 2 - Crear un elemento estructural
SE = strel('rectangle',[40 30]);
BW2 = imopen(BW1, SE);
imshow(BW2);

% Parte 3 - Abrir una imágen y realizar Erosion y Dilatación
BW3 = imerode(BW1,SE);
imshow(BW3);

% Parte 4 - Restaurar rectángulos a tamaño original
BW4 = imdilate(BW3,SE);
imshow(BW4);

% Parte 5 - Realizar operaciones secuenciales para cambiar el elemento
% estructural y dilatar la imágen
SE = strel('diamond',15);
BW5 = imdilate(BW3,SE);
imshow(BW5)