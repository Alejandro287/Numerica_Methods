

function [A,B] = UN_ajuste_lineal(X,Y)
    n=length(X)
    x2=0
    x1=0
    xy=0
    y1=0
    for i=1:n
        x2 = x2 + ((X(i))^2)
        x1 = x1 + (X(i))
        xy = xy + (X(i)*Y(i))
        y1 = y1 + (Y(i))
    end
    A=[x2 x1; x1 n;]
    B=[xy; y1;]
    [A,B] = UN_eliminacion_gauss(A,B)
    H = UN_sustitucion_regresiva(A,B)
    A = H(1)
    B = H(2)
    return [A,B]
endfunction


function A = UN_ajuste_potencial(X,Y,M)
    n=length(X)
    x2m=0
    xmy=0
    for i=1:n
        x2m = x2m + ((X(i))^(2*M))
        xmy = xmy + (((X(i))^(M))*(Y(i)))
    end
    A=(xmy/x2m)
    return A
endfunction



function [A,C] = UN_ajuste_exponencial(X,Y)
    n=length(Y)
    for i=1:n
        Y(i) = (log(Y(i)))
    end
    [A,B] = UN_ajuste_lineal(X,Y)
    C = exp(B)
    return [A,C]
endfunction


function [A,B,C] = UN_ajuste_parabolico(X,Y)
    n=length(X)
    x4=0
    x3=0
    x2=0
    x1=0
    yx2=0
    yx=0
    y1=0
    for i=1:n
        x4 = x4 + ((X(i))^4)
        x3 = x3 + ((X(i))^3)
        x2 = x2 + ((X(i))^2)
        x1 = x1 + (X(i))
        yx2 = yx2 + (Y(i)*(X(i)^2))
        yx = yx + (X(i)*Y(i))
        y1 = y1 + (Y(i))
    end
    A=[x4 x3 x2; x3 x2 x1; x2 x1 n;]
    B=[yx2; yx; y1;]
    [A,B] = UN_eliminacion_gauss(A,B)
    H = UN_sustitucion_regresiva(A,B)
    A = H(1)
    B = H(2)
    C = H(3)
    return [A,B,C]
endfunction


//Este programa permite hallar la solución de un sistema de la forma UX=C, equivalente al sistema AX=B 
//por medio de la eliminación de Gauss
//Entrada: A= Matriz no singular
//Entrada: U=Matriz trinagular superior no singular
//Entrada: C= Vector columna
//Entrada: B= Vector columna
//Salida: [U,C]= Matrix triangular por método de eliminación de Gauss
function [U,C] = UN_eliminacion_gauss(A,B)
    A=[A B] //Matriz aumentada
    [f,c]=size(A); //Tamaño de la matriz aumentada
    for i=1:f
        fila = i
        for j=i:f
            p=(abs(A(j,i)))
            if p > (abs(A(fila,i))) then
                fila = j
            end
        end
        filaTemp = A(i,:)
        A(i,:) = A(fila,:)
        A(fila,:) = filaTemp
        for k=i+1:f
            m = A(k,i)/A(i,i)
            A(k,:) = A(k,:) - m*A(i,:)
        end
    end
    U = A(1:f,1:f)
    C = A(1:f,c:c)
    return [U,C]
endfunction


//Este programa permite hallar la solución de un sistema de la forma AX=B, el cual se va a solucionar
// por medio del método de sustitución regresiva.
//Entrada: U= Matriz trinagular superior no singular
//Entrada: B= Vector columna
//Salida: X= Vector solución de la matriz U
function X = UN_sustitucion_regresiva(U,B)
    [f,c]=size(U); //tamaño de la matriz U
    b = B' //b es el vector B en forma de columna "transpuesta"
    X=zeros(f,1);  
    for i=f:-1:1
        X(i)=b(i)
        for j=f:-1:1
            if i == j then
                a = U(i,j)
                continue
            end
            X(i)= X(i)-(U(i,j)*X(j))
        end
        X(i)= X(i)/a
    end
    return X
endfunction
