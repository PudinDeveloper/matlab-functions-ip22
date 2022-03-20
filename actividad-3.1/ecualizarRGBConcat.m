function resultado = ecualizarRGBConcat(R,G,B)
    rgbImage = cat(3, R, G, B);
    resultado = rgbImage;
    
    subplot(2,2,1);imshow(R);title("Imágen RED");
    subplot(2,2,2);imshow(G);title("Imágen GREEN");
    subplot(2,2,3);imshow(B);title("Imágen BLUE");
    subplot(2,2,4);imshow(rgbImage);title("Imágen CONCATENADA");
end