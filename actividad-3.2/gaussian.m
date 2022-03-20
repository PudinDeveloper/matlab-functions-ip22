function resul = gaussian(a)
    
    resul = imnoise(a,'gaussian', 0, 0.02);

end