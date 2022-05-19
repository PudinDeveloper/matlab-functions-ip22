matrixResolve =    [0 0 0 0 0 0 1 1 0 0;
                    2 0 0 3 0 3 0 0 0 0;
                    2 0 0 3 3 3 0 0 0 0;
                    0 0 3 3 3 0 0 0 0 0;
                    0 0 3 0 3 0 0 6 6 0;
                    0 0 3 3 3 0 0 6 6 0;
                    0 0 0 0 0 0 7 0 6 0;
                    8 0 0 0 0 9 0 0 0 0];

matriz =   [0 0 0 0 0 0 1 1 0 0;
            1 0 0 1 0 1 0 0 0 0;
            1 0 0 1 1 1 0 0 0 0;
            0 0 1 1 1 0 0 0 0 0;
            0 0 1 0 1 0 0 1 1 0;
            0 0 1 1 1 0 0 1 1 0;
            0 0 0 0 0 0 1 0 1 0;
            1 0 0 0 0 1 0 0 0 0];

matriz2 =  [0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0;
            0 0 0 0 0 0 0 0 0 0];
        

% Se identifica el tamaño de las columnas y filas.
[row, col] = size(matriz);

% Se establece un contador para la segmentación.
contador = 1;

% Se inicia un ciclo para determinar la segmentación.
for i=1:row
    for x=1:col
        %Se hace una primera pasada para verificar los espacios afectados.
        if (matriz(i, x) ~= 0)
            %Se muestra en consola
            disp("En la fila " + i + " y columna " + x + " no hay 0");
            % Se establece el valor del contador, ademas al contador se le
            % suma un valor para la siguiente segmentación.
            matriz2(i, x) = contador;
            contador = contador + 1;
        else
            % Se verifica si se quieren cambiar valores en los bordes 
            % superiores de la matriz, en caso afirmativo toma el valor 
            % de la izquierda.
            if (x-1 >= 1 && i-1 <= 0 && matriz2(i, x-1) ~= 0)
                matriz2(i, x) = matriz2(i, x-1);
            else
                % Se verifica si se quieren cambiar valores en los bordes 
                % laterales de la matriz, en caso afirmativo toma el valor
                % superior.
                if (i-1 >= 1 && x-1 >= 1 && matriz2(i-1, x) ~= 0)
                    matriz2(i, x) = matriz2(i-1, x);
                else
                    % Calcula sin un valor lateral es parte de la misma
                    % estructura y la asigna automáticamente.
                    if (x-1 >= 1 && matriz2(i, x-1) ~= 0)
                        matriz2(i, x) = matriz2(i, x-1);
                    else
                    % Calcula sin un valor superior es parte de la misma
                    % estructura y la asigna automáticamente.
                        if (i-1 >= 1 && matriz2(i-1, x) ~= 0)
                            matriz2(i, x) = matriz2(i-1, x);
                        else
                            % En caso contrario se asigna el valor del
                            % contador.
                            matriz2(i, x) = contador;
                            contador = contador + 1;
                        end
                    end
                end
            end
        end
    
    
    end
end

% Se asigan valores nuevos a segmentos unidos.
for i=1:row
    for x=1:col
        if (matriz2(i, x) == 4 || matriz2(i, x) == 5)
            matriz2(i, x) = 3;
        end
    end
end

% Se muestra la Matriz Resuelta
disp(matriz2);