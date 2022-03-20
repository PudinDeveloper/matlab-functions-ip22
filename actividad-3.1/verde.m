function resultado = verde(img)
    img = img(:,:,2);
    resultado = ecualizar(img);
    imshow(img); 
end