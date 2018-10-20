function dy = f(t,y)
    dy=(t^2)-y
endfunction


//Una función que permite obtener una aproximación a la
//solución y(t) de la ecuación diferencial y'=f(t,y) en el intervalo 
//[t0,tn] con condición inicial y(t0)=y0, utilizando el método de Euler.
//
//Input: "t0" Valor inicial de t para el cual se da la condición inicial de y(t0)=y0
//Input: "tM" Valor de t para el cual se quiere calcular la aproximación de la solución y(t)
//Input: "y0" Valor de la condición inicial el cual corresponde a y(t) evaluada en t0
//Input: "M" Es el número de particiones que definen a h (el tamaño del paso)

////Output: "E" Valor de una aproximación encontrada mediante el 
//            Método de Euler para la solución y(t) evaluada en tM


function E = UN_ecua_dif_Euler(t0,y0,tM,M)
    h=(tM-t0)/M
    y=y0
    for i=1:M
        t=t0+((i-1)*h)
        k=f(t,y)
        y=y+k*h
    end
    E = y
endfunction




//Una función que permite obtener una aproximación a la
//solución y(t) de la ecuación diferencial y'=f(t,y) en el intervalo 
//[t0,tn] con condición inicial y(t0)=y0, utilizando el método de 
//Runge-Kutta de orden 4.
//
//Input: "t0" Valor inicial de t para el cual se da la condición inicial de y(t0)=y0
//Input: "tM" Valor de t para el cual se quiere calcular la aproximación de la solución y(t)
//Input: "y0" Valor de la condición inicial el cual corresponde a y(t) evaluada en t0
//Input: "M" Es el número de particiones que definen a h (el tamaño del paso)

////Output: "RK4" Valor de una aproximación encontrada mediante el 
//            Método de Runge-Kutta de orden 4 para la solución y(t) evaluada en tM

function RK4 = UN_ecua_dif_RK4(t0,y0,tM,M)
    h=(tM-t0)/M
    y=y0
    for i=1:M
        t=t0+((i-1)*h)
        k1=f(t,y)
        k2= f( (t+(h/2)) , (y+(h/2)*k1) )
        k3= f( (t+(h/2)) , (y+(h/2)*k2) )
        k4= f( (t+h) , (y+(h*k3)) )
        k=((k1+(2*k2)+(2*k3)+k4)/6)
        y=y+k*h
    end
    RK4 = y
endfunction
