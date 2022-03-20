function resultado = rojo(img)
    img = img(:,:,1);
    resultado = ecualizar(img);
    imshow(img); 
end