clc

//Se supone que previamente existe cargada una función f en el sistema dedinida así:
function fx = f(x)
    fx = cos(2*x)
endfunction
//sobre esta función es sobre la cual se hallarán sus derivadas


//Esta función permite obtener la primera derivada de de la función f en x utilizando la formula centrada en orden O(h^2)
//x = In = Es el valor para el cual se quiere calcular la derivada
//h = In = Es el incremento decimal
function dfh2 = UN_primera_derivada_h2(x,h)
    dfh2 = (f(x+(1*h))-f(x+(-1*h)))/(2*h)
endfunction


//Esta función permite obtener la primera derivada de de la función f en x utilizando la formula centrada en orden O(h^4)
//x = In = Es el valor para el cual se quiere calcular la derivada
//h = In = Es el incremento decimal
function dfh4 = UN_primera_derivada_h4(x,h)
    dfh4 =(-f(x+(2*h))+(8*f(x+(1*h)))-(8*f(x+(-1*h)))+f(x+(-2*h)))/(12*h)
endfunction


//Esta función permite obtener la segunda derivada de de la función f en x utilizando la formula centrada en orden O(h^2)
//x = In = Es el valor para el cual se quiere calcular la derivada
//h = In = Es el incremento decimal
function d2fh2 = UN_segunda_derivada_h2(x,h)
    d2fh2 = (f(x+(1*h))-(2*f(x+(0*h)))+f(x+(-1*h)))/(h^2)
endfunction


//Esta función permite obtener la segunda derivada de de la función f en x utilizando la formula centrada en orden O(h^4)
//x = In = Es el valor para el cual se quiere calcular la derivada
//h = In = Es el incremento decimal
function d2fh4 = UN_segunda_derivada_h4(x,h)
    d2fh4 = (-f(x+(2*h))+(16*f(x+(1*h)))-(30*f(x+(0*h)))+(16*f(x+(-1*h)))-f(x+(-2*h)))/(12*(h^2))
endfunction
