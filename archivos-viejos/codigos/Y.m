function resultado = Cr(img)
    img = rgb2ycbcr(img);
    resultado = img(:,:,3);
    imshow(resultado);
end