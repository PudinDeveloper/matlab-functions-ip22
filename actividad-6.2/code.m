% 1 Esta sección del código nos permite leer la imágen coloredChips y
% posteriormente se muestra con la función imshow.
rgb = imread('coloredChips.png');
figure
imshow(rgb)

% 2. Esta parte nos permite añadir de manera interactiva una linea que
% muestra valores segun la posición donde se encunetre seleccionada.
d = imdistline;

% 3. Nos permite eliminar la linea de la imágen generada anteriormente.
delete(d);

% 4. Esta función nos permite convertir la imágen origianl a escala de
% grises para seguir trabajando con propiedades de la misma.
gray_image = rgb2gray(rgb);
imshow(gray_image); title('Conversión a Escala de Grises');

% % 5. Aqui se guardan algunas variables como centers y radii que
% representan el centro y propiedades de algunas imagenes de los ciruclos
% en la imágen, ademas se busca su Polaridad oscura.
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');
h = viscircles(centers,radii);
imshow(h);

% % 6. Aqui ya se marcan con una suposición de imagen los círculos, podemos
% observar que mayormente solo quedán marcados azules y rojos, y una de
% color verde. 
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.9);
delete(h)   % Se borra la variable h que contenía variables de center y radii 
            % para la identificación de los circulos.
imshow(rgb);
h = viscircles(centers,radii);

% % 7. En esta función ya se puede incluso obervar como el codigo
% identifica los circulos que estan tapados por otros circulos, esto se basa en que 
% el programa detecta previamente los valores de los circulos, y hace una aproximación.
[centers, radii] = imfindcircles(rgb,[20 
25],'ObjectPolarity','dark','Sensitivity',0.92);
delete(h); 
h = viscircles(centers,radii);

% % 8. Nuevamente se hace la indentificación de los círculos a excepción
% de las amarillos que deben ser indentificados posteriormente con otros
% valores para no confundirse con valores del fondo.
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.92,'Method','twostage');
delete(h);
h = viscircles(centers,radii);

% % 9. Aqui se realiza el uso de la variable PhaseCode en "imfindcircles", lo
% cual ayuda a determinar la sensibilidad para identifdicar círculos, sin
% embargo podemos notar que los círculos de color amarillo aun no están.
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.95,'Method','PhaseCode');
delete(h);
viscircles(centers,radii);

% 10. Hay algún tipo de círculos que no se encuentran?
% Si, en el siguiente código se aplican más filtros de sensibilidad, y
% solo quedá un círculo a la derecha sin seleccionar ya que muy
% probablemente MatLab lo confunde con la alta exposición a la luz en la
% que el objeto se encuentra.
[centersBright, radiiBright] = imfindcircles(rgb,[20 
25],'ObjectPolarity','bright','Sensitivity',0.92);
hBrigth = viscircles(centersBright, radiiBright,'EdgeColor','b');

% 11. Finalmente con mas filtros  donde se determina el brillo, la oscuridad,
% el contorno y ademas varias métricas de luminosidad, es posible
% seleccionar todos los círculos correctamente e incluso se podrían extraer
% de la imágen.
[centersBright, radiiBright, metricBright] = imfindcircles(rgb,[20 
25],'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
[centersDark, radiiDark, metricDark] = imfindcircles(rgb,[20 
25],'ObjectPolarity','dark','Sensitivity',0.92,'EdgeThreshold',0.1);
hDark = viscircles(centersDark, radiiDark,'EdgeColor','g');