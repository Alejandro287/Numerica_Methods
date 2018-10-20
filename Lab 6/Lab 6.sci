

function fx = f(x)
    fx = sin(3*x/2)
endfunction



//Función que permite obtener una aproximación de la integral 
//de una función f desde un punto a hasta un punto b, 
//utilizando la Regla Compuesta del Trapecio

//Input: "a" Límite inferior de la integral
//Input: "b" Límite superior de la integral
//Input: "n" Numero de particiones del intervalo [a,b]

// Output: "T" Aproximación de la integral de la función f entre el intervalo [a,b]
//hallada mediante la Regla Compuesta del Trapecio con un numero de particiones n 
function T = UN_integral_trapecio(a,b,n)
    h=((b-a)/n)
    suma=0
    for k=1:n-1
        suma = suma + f(a+(k*h))
    end
    T = (((f(a)+f(b))/2)+suma)*h
endfunction




//Función que permite obtener una aproximación de la integral 
//de una función f desde un punto a hasta un punto b, 
//utilizando la Regla Compuesta de Simpson

//Input: "a" Límite inferior de la integral
//Input: "b" Límite superior de la integral
//Input: "n" Mitad del numero de particiones del intervalo [a,b]

// Output: "S" Aproximación de la integral de la función f entre el intervalo [a,b]
//hallada mediante la Regla Compuesta de Simpson con un numero de particiones 2n
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
    //disp(sumaPar)
    //disp(sumaImp)
    S=(((f(a)+f(b))+(2*sumaPar)+(4*sumaImp))*h)/3
endfunction
