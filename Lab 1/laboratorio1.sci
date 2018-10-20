
//description: Function that calculates the derivate 
//             of a real polynomial 
//input: "A" An array that specifies the polynomial, 
//       where the main coefficient is the first element
//output: "dp" An array that specifies the derivate of 
//        the polynomial "A"
function  dp  =  UN_derivada_poli(A)
    n = length(A)
    dp = 1:n-1
    for i = 1:n-1
        dp(i) = A(i)*(n-i)
    end
    return dp
endfunction


//description: Function that evaluates a polynomial 
//             using the Hornet's method
//input: "A" An array that specifies the polynomial, 
//       where the main 
//       coefficient is the first element
//input: "x" Value to evaluate the polynomial "A"
//output: "px" Functional value obtained from evaluation 
//        of the polynomial "A" at the value "x"
function  px  =  UN_horner(A,x)
    n = length(A)
    px = A(1) 
    for i = 2:n
        px = px*x+A(i)
    end

    return px
endfunction


//Descripción: función que calcula la aproximación de una raíz  
//             de un polinomio mediante el método de Bisección
//input: "A" Un arreglo que especifica los coeficientes del polinomio, 
//       donde el coeficiente principal es el primer elemento
//input: "a" Extremo izquierdo del intervalo inicial
//input: "b" Extremo derecho del intervalo inicial
//input: "eps" Precisión del error deseada
//input: "M" Máximo número de iteraciones 
//output: "r" Aproximación parcial de la raíz del polinomio 

//         Explicación de parámetros de tabla 
// "i" Número de iteración 
// "a" Extremo izquierdo del intervalo parcial
// "b" Extremo derecho del intervalo parcial
// "ri" Aproximación parcial de la raíz del polinomio 
// "|p(ri)|" Error absoluto  
function r = UN_biseccion(A, a, b, eps, M)
    extremo1=a
    extremo2=b 
    nuevoExtremo=extremo1
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    printf("\ti \t\t a \t\t\t b \t\t\tri \t\t     |p(ri)|\n")
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    i=0
	while i < M
        cota1 = UN_horner(A,extremo1)
		cota2 = UN_horner(A,extremo2)
        if extremo1<extremo2 then
            printf('\t%d \t %.16f \t %.16f \t',i,extremo1,extremo2)
        else
            printf('\t%d \t %.16f \t %.16f \t',i,extremo2,extremo1)
        end
		if (cota1*cota2)>0 then
			printf('\nNo hay raices en el intervalo escogido\n')
            return null
			break
		elseif cota1==0 then
            printf('%.16f\n',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f',i,extremo1)
            return extremo1
			break
		elseif cota2==0 then
            printf('%.16f\n',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f',i,extremo2)
            return extremo2
			break
		else
			extremoAnterior=nuevoExtremo
			cotaAnterior = UN_horner(A,extremoAnterior)
			nuevoExtremo = (extremo1 + extremo2)/2
            r=nuevoExtremo
			nuevaCota = UN_horner(A,nuevoExtremo)
			er=abs(nuevaCota)
            printf('%.16f \t',nuevoExtremo)
			printf('%.16f\n',er)
			if er<eps then
				break
			elseif (nuevaCota*cota1)<0 then
				extremo2=nuevoExtremo
			else
				extremo1=nuevoExtremo
			end	
		end
        i=i+1
    end
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    else 
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    end
endfunction

//Descripción: función que calcula la aproximación de una raíz  
//             de un polinomio mediante el método de Regla Falsa
//input: "A" Un arreglo que especifica los coeficientes del polinomio, 
//       donde el coeficiente principal es el primer elemento
//input: "a" Extremo izquierdo del intervalo inicial
//input: "b" Extremo derecho del intervalo inicial
//input: "eps" Precisión del error deseada
//input: "M" Máximo número de iteraciones 
//output: "r" Aproximación parcial de la raíz del polinomio 

//         Explicación de parámetros de tabla 
// "i" Número de iteración 
// "a" Extremo izquierdo del intervalo parcial
// "b" Extremo derecho del intervalo parcial
// "ri" Aproximación parcial de la raíz del polinomio 
// "|p(ri)|" Error absoluto  
function r = UN_regla_falsa(A, a, b, eps, M)
    extremo1=a
    extremo2=b 
    nuevoExtremo=extremo1
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    printf("\ti \t\t a \t\t\t b \t\t\tri \t\t     |p(ri)|\n")
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    i=0
	while i < M
        cota1 = UN_horner(A,extremo1)
		cota2 = UN_horner(A,extremo2)
        if extremo1<extremo2 then
            printf('\t%d \t %.16f \t %.16f \t',i,extremo1,extremo2)
        else
            printf('\t%d \t %.16f \t %.16f \t',i,extremo2,extremo1)
        end
		if (cota1*cota2)>0 then
			printf('\nNo hay raices en el intervalo escogido\n')
            return null
			break
		elseif cota1==0 then
            printf('%.16f',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f',i,extremo1)
            return extremo1
			break
		elseif cota2==0 then
            printf('%.16f',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f',i,extremo2)
            return extremo2
			break
		else
			extremoAnterior=nuevoExtremo
			cotaAnterior = UN_horner(A,extremoAnterior)
			nuevoExtremo = extremo2-((cota2*(extremo2-extremo1))/(cota2-cota1))
            r=nuevoExtremo
			nuevaCota = UN_horner(A,nuevoExtremo)
			er=abs(nuevaCota)
            printf('%.16f \t',nuevoExtremo)
			printf('%.16f\n',er)
			if er<eps then
				break
			elseif (nuevaCota*cota1)<0 then
				extremo2=nuevoExtremo
			else
				extremo1=nuevoExtremo
			end	
		end
        i=i+1
    end
    printf("-----------------------------------------------------------------------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    else 
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    end
endfunction


//Descripción: función que calcula la aproximación de una raíz  
//             de un polinomio mediante el método de la Secante
//input: "A" Un arreglo que especifica los coeficientes del polinomio, 
//       donde el coeficiente principal es el primer elemento
//input: "x0" Primer punto elegido para la recta secante inicial
//input: "x1" segundo punto elegido para la recta secante inicial
//input: "eps" Precisión del error deseada
//input: "M" Máximo número de iteraciones 
//output: "r" Aproximación parcial de la raíz del polinomio 

//         Explicación de parámetros de tabla 
// "i" Número de iteración 
// "xi" Anterior aproximación parcial de la raíz del polinomio 
// "xi+1" Aproximación parcial de la raíz del polinomio 
// "|p(ri)|" Error absoluto 
function r = UN_secante(A, x0, x1, eps, M)
    extremo1=x0
    extremo2=x1
    nuevoExtremo=extremo2
    nuevaCota = UN_horner(A,nuevoExtremo)
    printf("--------------------------------------------------------------------------------------\n")
    printf("\ti \t\t xi \t\t\t xi+1 \t\t\t|p(xi+1)|\n")
    printf("--------------------------------------------------------------------------------------\n")
    i=0
    while i < M
        cota1 = UN_horner(A,extremo1)
        cota2 = UN_horner(A,extremo2)
        er=abs(cota2)
        printf('\t%d \t%.16f \t%.16f \t%.16f \t\n',i,extremo1,extremo2,er)
        if cota1==0 then
            printf('%.16f\n',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f\n',i,extremo1)
            return extremo1
		elseif cota2==0 then
            printf('%.16f\n',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f\n',i,extremo2)
            return extremo2
        else
			extremoAnterior=nuevoExtremo
			cotaAnterior = UN_horner(A,extremoAnterior)
			nuevoExtremo = extremo2-((cota2*(extremo2-extremo1))/(cota2-cota1))
            r=extremo2
			nuevaCota = UN_horner(A,nuevoExtremo)
			er=abs(nuevaCota)
			if er<eps then
                i=i+1
                extremo1=extremo2
				extremo2=nuevoExtremo
                cota1 = UN_horner(A,extremo1)
                cota2 = UN_horner(A,extremo2)
                er=abs(cota2)
                printf('\t%d \t%.16f \t%.16f \t%.16f \t\n',i,extremo1,extremo2,er)
				break
			else
				extremo1=extremo2
				extremo2=nuevoExtremo
			end	
		end
    i=i+1
    end
    printf("--------------------------------------------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    else 
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    end
endfunction

//Descripción: función que calcula la aproximación de una raíz  
//             de un polinomio mediante el método de Newton-Raphson
//input: "A" Un arreglo que especifica los coeficientes del polinomio, 
//       donde el coeficiente principal es el primer elemento
//input: "x0" Punto inicial
//input: "eps" Precisión del error deseada
//input: "M" Máximo número de iteraciones 
//output: "r" Aproximación parcial de la raíz del polinomio 

//         Explicación de parámetros de tabla 
// "i" Número de iteración 
// "xi" Aproximación parcial de la raíz del polinomio 
// "|p(ri)|" Error absoluto 
function r = UN_newton(A, x0, eps, M)
    extremo1=x0
    nuevoExtremo=extremo1
    nuevaCota = UN_horner(A,nuevoExtremo)
    printf("---------------------------------------------------------------\n")
    printf("\ti\t\txi\t\t\t|p(xi)|\n")
    printf("---------------------------------------------------------------\n")
    i=0
    printf('\t%d \t',i)
    printf('%.16f \t',nuevoExtremo)
    printf('%.16f\n',abs(nuevaCota))
    i=i+1
    while i < M
        cota1 = UN_horner(A,extremo1)
        printf('\t%d \t',i)
        if cota1==0 then
            printf('%.16f',extremo1)
            printf('\n%d   Hay una raiz en x = %.16f',i,extremo1)
            return extremo1
			break
        else
            nuevoExtremo = extremo1-(cota1/(UN_horner(UN_derivada_poli(A),extremo1)))
            nuevaCota = UN_horner(A,nuevoExtremo)
            cotaAnterior = UN_horner(A,extremo1)
            r=nuevoExtremo
			er=abs(nuevaCota)
            printf('%.16f \t',nuevoExtremo)
			printf('%.16f\n',er)
			if er<eps then
				break
			else
                extremo1=nuevoExtremo
			end	
		end
        i=i+1
    end
    printf("---------------------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    else 
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la raíz del polinomio es: %.16f\n",r)
    end
endfunction
