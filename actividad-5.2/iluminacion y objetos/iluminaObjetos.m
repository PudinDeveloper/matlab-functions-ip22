% Parte 0 - Imágen original y fondo.
I = imread('rice.png');
imshow(I);

se = strel('disk',15);
background = imopen(I,se);
imshow(background);

% Parte 1 - Procesar la imágen original con el fondo.
I2 = I - background;
imshow(I2);

% Parte 2 - Aumentar contraste con saturación del 1% para intensificar.
I3 = imadjust(I2);
imshow(I3);

% Parte 3 - Convertir la imágen a valores binarios.
bw = imbinarize(I3);
bw = bwareaopen(bw,50);
imshow(bw);

% Parte 4 - Identificar objetos de una imágen.
