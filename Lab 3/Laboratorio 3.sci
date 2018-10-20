//Descripción: función que permite realizar la interpolación mediante 
//             el método de interpolación de Newton.
//
//Input: “X” el vector de las abscisas de los nodos.
//Input: “Y” el vector de las ordenadas de los nodos.
//Input: “x” el valor a interpolar o extrapolar, respectivamente.
//Output: “fx” el valor de la interpolación calculada mediante el 
//             método de interpolación de Newton para el valor de “x”.
function fx = UN_Inter_Newton(X,Y,x)
    n=length(X)-1;
    A=zeros(n+1,n+1);
    A(:,1)=Y';
    for k=2:n+1
        for J=k:n+1
            A(J,k)=[A(J,k-1)-A(J-1,k-1)]/[X(J)-X(J-k+1)];
        end
    end
    //disp(A);
    polinomio=A(1,1);
    N=A(1,1);
    V=1;
    for i=1:n
        V=V*(x-X(i));
        polinomio=polinomio+V*A(i+1,i+1);
        N=N+A(i+1,i+1)*poly(X(1:(i)),"x");
    end
    //disp(N);
    //printf('el valor interpolado es %.20f\n',polinomio);
    fx=polinomio;
endfunction

//Descripción: función que permite realizar la interpolación mediante 
//              el método de interpolación de Lagrange.
//
//Input: “X” el vector de las abscisas de los nodos.
//Input: “Y” el vector de las ordenadas de los nodos.
//Input: “x” el valor a interpolar o extrapolar, respectivamente.
//Output: “fx” el valor de la interpolación calculada mediante el 
//            método de interpolación de Lagrange para el valor de “x”.
function fx = UN_Inter_Lagrange(X,Y,x)
    fx = 0;
    N=0;
    n = length(X);
    V = poly([0, 1], "x","coeff");
    for j = 1 : n
        z = 1;
        M = 1;
        for i = 1 : n
            if i~=j
                M = M * [(V-X(i))/(X(j)-X(i))];
                z = z * (x-X(i))/(X(j)-X(i));
            end
        end
        //disp(M);
        fx = fx + z*Y(j);
        N=N+M*Y(j);
    end 
    //disp(N);
    //printf('el valor interpolado es %.20f\n',fx);
endfunction

