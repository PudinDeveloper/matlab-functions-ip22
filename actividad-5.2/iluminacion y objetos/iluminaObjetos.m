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
cc = bwconncomp(bw,4);
cc.NumObjects;
grain = false(size(bw));
grain(cc.PixelIdxList{50}) = true;
imshow(grain);

% Parte 5 - Identificar objetos de una imágen en un mapa matriz de colores.
labeled = labelmatrix(cc);
whos labeled
RGB_label = label2rgb(labeled,'spring','c','shuffle');
imshow(RGB_label);

% Parte 6 - Procesar el area de cada objeto en la imágen.
graindata = regionprops(cc,'basic');
grain_areas = [graindata.Area];
grain_areas(50);

[min_area, idx] = min(grain_areas);

grain = false(size(bw));
grain(cc.PixelIdxList{idx}) = true;
imshow(grain);

histogram(grain_areas);
title('Histogram of Rice Grain Area');