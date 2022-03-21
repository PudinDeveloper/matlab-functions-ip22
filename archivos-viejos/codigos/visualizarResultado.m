function resultado = visualizarResultado(A,B)
    
resultado = 5;

    subplot(2,2,1);imshow(B);title("Imágen ORIGINAL");
    subplot(2,2,2);imhist(B);title("Histograma ORIGINAL");
    subplot(2,2,3);imshow(A);title("Imágen ECUALIZADA");
    subplot(2,2,4);imhist(A);title("Histograma ECUALIZADA");
end