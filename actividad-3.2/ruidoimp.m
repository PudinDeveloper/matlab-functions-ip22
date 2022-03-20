function b=ruidoimp(a,p,imin,imax)
    
    % Añade ruido impulsivo a una imagen
    % b=ruidoimp(a,p,imin,imax)
    % b: imagen de salida con ruido
    % a: imagen de entrada
    % p: probabilidad del ruido
    % imin: valor del impulso minimo
    % imax: valor del impulso maximo

    [m,n]=size(a);
    a=double(a);
    np=(p*m*n);
    turno=0;
    b=a;
    for inp = 1:np
        k=ceil(m*rand);
        l=ceil(n*rand);
        if turno==0;
            turno=1;
            b(k,l)=imax;
            else
                turno=0;
                b(k,l)=imin;
        end
    end
    b=uint8(b);

end