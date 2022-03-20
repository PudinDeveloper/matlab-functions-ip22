function resultado = rgbACr(img)
    resultado = rgb2ycbcr(img);
    imshow(resultado); 
end