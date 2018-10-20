

function fx = f(x)
    //fx = sin(3*x/2)
    fx = -x^2+14*x+21
endfunction




function T = UN_integral_trapecio(a,b,n)
    h=((b-a)/n)
    suma=0
    for k=1:n-1
        suma = suma + f(a+(k*h))
    end
    T = (((f(a)+f(b))/2)+suma)*h
endfunction




function S = UN_integral_simpson(a,b,n)
    h=((b-a)/(2*n))
    //disp(h)
    sumaImp=0
    sumaPar=0
    for k=1:((2*n)-1)
        if modulo(k,2) == 0 then
            sumaPar = sumaPar + f(a+(k*h))
        else 
            sumaImp = sumaImp + f(a+(k*h))
        end
    end
    S=(((f(a)+f(b))+(2*sumaPar)+(4*sumaImp))*h)/3
endfunction


function ans=simpson(a,b,n)
    n=2*n
    h=(b-a)/n;
    suma=0;
    for i=1:n-1
        x=a+i*h;
        if modulo(i,2)==0
            suma=suma+2*f(x);
        else 
            suma=suma+4*f(x);
        end 
    end
    ans=(h/3)*(f(a)+f(b)+suma);
endfunction
