close all
clear all
I = imread('./imagenes/gatito-BN.png');
% Asegurar trabajar en escala de grises
[r,c,d]=size(I);
if d>1
    I=rgb2gray(I);
end
 
I=double(I);
f=input('Introduce el filtro deseado: 1-Motion, 2-Average, 3-Disk, 4-Gaussian, 5-Laplaciano, 6-Prewitt(H), 7-Prewitt(V), 8-Sobel(H) y 9-Sobel(V): ');
if f==1
    l=input('Introduce la longitud de FM: ');
    th=input('Introduce el ángulo de FM: ');
    h = fspecial('motion', l, th); %len y theta
elseif f==2
    l=input('Introduce la tamaño de FA: ');
    h=fspecial('average', l); % hsize
elseif f==3
    ra=input('Introduce el radio de FD: ');
    h = fspecial('disk', ra); %radius
elseif f==4
    l=input('Introduce la longitud de FG: ');
    s=input('Introduce sigma (0-1) de FG: ');
    h=fspecial('gaussian', l, s); %hsize, sigma
elseif f==5
    a=input('Introduce alpha (0-1) de FL: ');
    h = fspecial('laplacian', a); %alpha
elseif f==6
    h = fspecial('prewitt');
    b = h;
elseif f==7
    h = fspecial('prewitt');
    h=h';
    a = h;
elseif f==8
    h = fspecial('sobel');
elseif f==9
    h = fspecial('sobel');
    h=h';
end
 
If=fftshift(fft2(I));
H=fft2(h,r,c);
H=fftshift(H);
Ifc=If.*H;
 
Ift=real(ifft2(fftshift(Ifc)));
 
figure, imshow([I,uint8(Ift)]);  title('Imagen Original y Filtrada');
k = uint8(Ift);
 
figure, subplot(3,1,1), imshow(log(abs(If)+1),[]), title('log(EA) de la Imagen')
subplot(3,1,2), imshow(log(abs(H)+1),[]), title('log(EA) de H')
subplot(3,1,3), imshow(log(abs((Ifc))+1),[]), title('log(EA) Imagen degradada')
 
figure, subplot(3,1,1), colormap hsv, mesh(log(abs((If))+1)), title('EA de imagen original');
subplot(3,1,2), colormap hsv, mesh(abs(H)), title('EA de H');
subplot(3,1,3), colormap hsv, mesh(log(abs((Ifc))+1)), title('EA de imagen degradada');

