tronco = imread("./imagenes/tronco.bmp");
mariposa = imread("./imagenes/mariposa.bmp");
troncoMariposa = imread("./imagenes/troncoMariposa.bmp");

mariposaF = fft2(mariposa);
troncoMariposaF = fft2(troncoMariposa);

mConj = conj(mariposaF)./abs(mariposaF);

t = mConj .* troncoMariposaF;

it= fftshift(ifft2(t));
figure, subplot(1,2,1),
imshow(troncoMariposa);
subplot(1,2,2),
imshow(real(it), []);

% mesh(it);