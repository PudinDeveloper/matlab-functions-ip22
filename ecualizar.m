function Imgeq = ecualizar(Img)
    
    imgoriginal = Img;
    %No de filas y columnas
    [fil,col] = size(Img);
    total_pixels = fil * col;

    Imgeq = zeros(fil,col);
    %histo = zeros(1,256);
    % Calculo del histograma de la imagen
    hist = imhist(Img);
    % variable Img en una variable de doble precision
    Img = double (Img);
    % Vector de 255 elem. nulos a la variable probabilidad, acumulada
    % y ecualizador
    probabilidad = zeros (1,256);
    acumulada = zeros(1,256);
    ecualizador= zeros(1,256);

    % Calcula la probabilidad de que se presenten cada uno de los niveles
    % de gris (Frecuencia relativa)
    for k=1:256
    probabilidad(k)=hist(k)/total_pixels;
    end
    % La probabilidad acumulada que tiene el pixel 0 es la probabilidad de 0
    acumulada(1) = probabilidad(1);
    % Calculo de la acumulada(k) como la suma de la acumulada anterior mas %
    % la probabilidad de nivel de gris que existe en k. No empieza en 1 ya %
    % que la acumulada del primer pixel es igual a la probabilida de este %

    for k = 2:256
    acumulada(k) = acumulada(k-1) + probabilidad(k);
    end
    % Ecualizador va a contener la transformacion del nivel de gris %
    for k=1:256
    ecualizador(k) = acumulada(k)*256;
    end
    %Sustitucion de los niveles de gris en base a ecualizador
    for i=1:fil
    for j=1:col
    k = Img(i,j);
    Imgeq(i,j)=ecualizador(k+1);
    end
    end
    Imgeq = uint8(Imgeq);
    % imshow(Imgeq);
    
    %subplot(2,2,1);imshow(imgoriginal);title("Imagen Original");
    %subplot(2,2,2);imhist(imgoriginal);title("Histo.Im.Orig");
    %subplot(2,2,3);imshow(Imgeq);title("Imagen Ecualiz.");
    %subplot(2,2,4);imhist(Imgeq);title("Histo.Im.Ecualiz.");

end