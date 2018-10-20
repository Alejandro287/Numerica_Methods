function X = UN_sustitucion_regresiva(U,B)
    [f,c]=size(U);
    b = B'
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


function X = UN_sustitucion_progre(L,B)
    [f,c]=size(L);
    b = B'
    X=zeros(f,1);
    for i=1:f
        X(i)=b(i)
        for j=1:f
            if i == j then
                a = L(i,j)
                continue
            end
            X(i)= X(i)-(L(i,j)*X(j))
        end
        X(i)= X(i)/a
    end
    return X
endfunction


function [U,C] = UN_eliminacion_gauss(A,B)
    A=[A B]
    [f,c]=size(A);
    disp(A)
    for i=1:f
        fila = 0
        for j=i:f
            p=(abs(A(j,i)))
            if p > fila then
                fila = j
            end
        end
        filaTemp = A(i,:)
        A(i,:) = A(fila,:)
        A(fila,:) = filaTemp
        disp(A)
        for k=i+1:f
            m = A(k,i)/A(i,i)
            A(k,:) = A(k,:) - m*A(i,:)
            disp(A)
        end
    end
    U = A(1:f,1:f)
    C = A(1:f,c:c)
    disp(U)
    disp(C)
    H=UN_sustitucion_regresiva(U,C)
    disp(H)
    return [U,C]
endfunction

function [U,C] = UN_eliminacion_gauss2(A,B)
    A=[A B]
    [f,c]=size(A);

    for i=1:f
        for k=i+1:f
            d = A(i,i)*A(k,i)
            e = A(k,i) *A(i,:)
            if d >= e then
                A(k,:) = A(i,i)*A(k,:) - A(k,i) *A(i,:)
            else 
                A(k,:) = A(k,i) *A(i,:) - A(i,i)*A(k,:)
            end
        end
    end
    U = A(1:f,1:f)
    C = A(1:f,c:c)
    return [U,C]
endfunction


function [L,U] = UN_factorizacion_LU(A)
    [f,c]=size(A);
    disp(A)
    L = eye(f,f)
    for i=1:f
        fila = 0
        for j=i:f
            p=(abs(A(j,i)))
            if p > fila then
                fila = j
            end
        end
        filaTemp = A(i,:)
        A(i,:) = A(fila,:)
        A(fila,:) = filaTemp
        disp(A)
        for k=i+1:f
            L(k,i) = A(k,i)/A(i,i)
            A(k,:) = A(k,:) - L(k,i)*A(i,:)
            disp(A)
        end
    end
    U = A
    disp(L)
    disp(U)
    return [L,U]
endfunction


function X = UN_solucion_LU(L,U,B)
    Y = UN_sustitucion_progre(L,B)
    disp (Y)
    X = UN_sustitucion_regresiva(U,Y)
    return X
endfunction
