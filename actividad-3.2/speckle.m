function resul = speckle(a)
    
    resul = imnoise(a,'speckle', 0.05);

end