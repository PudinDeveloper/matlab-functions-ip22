function resultado = azul(img)
    img = img(:,:,3);
    resultado = ecualizar(img);
    imshow(img); 
end