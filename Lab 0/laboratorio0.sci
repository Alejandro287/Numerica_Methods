//description: Function that calculates the machine epsilon
//input: none
//output: none
function  UN_epsilon
    t = 1
    m = 0
    printf("-------------------------------\n")
    printf("i \t\t epsilon\n")
    printf("-------------------------------\n")
    while 1 + t > 1
        printf("%d \t %0.20e \n",m,t)
        t = t/2
        m = m+1
    end
    printf("-------------------------------\n")
endfunction

//description: Function that calculates the square root 
//             of a positive real number
//input: "a" A positive real number to obtain the square root
//input: "x0" Initial value to start the iterative algorithm
//input: "eps" Precision to achieve
//input: "M" Maximum number of iterations
//output: "r" Square root of the number "a"
function  r  =  UN_raiz_cuadrada(a,x0,eps,M)
    i = 0
    printf("--------------------------------------------------\n")
    printf("i\t\t Xi \t\t       error\n")
    printf("--------------------------------------------------\n")
    printf("%d \t %.15f \t ----------------- \n",i,x0)
    while i < M
        r = 0.5*(x0 + a/x0)
        e = abs((r-x0)/r)
        i = i+1
        printf("%d \t %.15f \t %.15f \n",i,r,e)
        if e < eps then
            break
        else
            x0 = r
        end
    end
    printf("--------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la raíz cuadrada de %d es: %.15f\n",a,r)
    else 
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la raíz cuadrada de %d es: %.15f\n",a,r)
    end
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

//description: Function that calculates an approximation 
//             of the exponential function using its Taylor 
//             series
//input: "x" Value to calculate exp(x)
//input: "eps" Precision to achieve 
//input: "M" Maximum number of iterations
//output: "ex" Functional value obtained from evaluation of 
//        the exponential function
function  ex  =  UN_exp(x,eps,M)
    fact = 1
    ex = 1
    i = 1
    p = x
    printf("--------------------------------------------------\n")
    printf("i\t\t Xi \t\t       error\n")
    printf("--------------------------------------------------\n")
    printf("%d \t %.15f \t ----------------- \n",0,ex)
    while i < M
        s = ex + (p)/fact
        e = abs((s-ex)/s)
        printf("%d \t %.15f \t %.15f \n",i,s,e)
        if e < eps then
            break
        else 
            ex = s
            i = i + 1
            fact = fact * i
            p = p * x
        end
    end
    printf("--------------------------------------------------\n")
    if i < M then
        printf("¡EXITO! el cálculo fue exitoso, la mejor aproximación\n")
        printf("de la exponencial de %f es: %.15f\n",x,s)
    else
        printf("¡FRACASO! el cálculo no fue exitoso, la mejor aproximación\n")
        printf("de la exponencial de %f es: %.15f\n",x,s)
    end
endfunction
