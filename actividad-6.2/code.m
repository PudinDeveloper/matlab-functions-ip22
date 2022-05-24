% 1 Esta sección del código nos permite leer la imágen coloredChips y
% posteriormente se muestra con la función imshow.
rgb = imread('coloredChips.png');
figure
imshow(rgb)

% 2. Esta parte nos permite añadir de manera interactiva una linea que
% muestra valores segun la posición donde se encunetre seleccionada.
d = imdistline;

% % 3. ???????????????
% pause
% delete(d);
% % 4. ???????????????
% gray_image = rgb2gray(rgb);
% imshow(gray_image); title('??????????????')

% % 5. ???????????????
% % Qué contienen las variables: centers y radii?
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark');
% imshow(rgb);
% h = viscircles(centers,radii);

% % 6. ???????????????
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.9);
% delete(h) % ???????????????
% imshow(rgb);
% h = viscircles(centers,radii);

% % 7. ???????????????
% [centers, radii] = imfindcircles(rgb,[20 
% 25],'ObjectPolarity','dark','Sensitivity',0.92);
% delete(h); 
% h = viscircles(centers,radii);

% % 8. ???????????????
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.92,'Method','twostage');
% delete(h);
% h = viscircles(centers,radii);

% % 9. ???????????????
% [centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.95,'Method','PhaseCode');
% delete(h);
% viscircles(centers,radii);

% % Hay algún tipo de círculos que no se encuentran?
% % ??????????????????
% [centersBright, radiiBright] = imfindcircles(rgb,[20 
% 25],'ObjectPolarity','bright','Sensitivity',0.92);
% hBrigth=viscircles(centersBright, radiiBright,'EdgeColor','b');

% % ???????
% delete(hBright)
% [centersBright, radiiBright, metricBright] = imfindcircles(rgb,[20 25],'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
% hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
% [centersDark, radiiDark, metricDark] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark','Sensitivity',0.92,'EdgeThreshold',0.1);
% hDark = viscircles(centersDark, radiiDark,'EdgeColor','g');