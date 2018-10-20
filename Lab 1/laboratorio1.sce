clc

printf("     ====  Método de bisección  ====\n\n")

UN_biseccion([1 2 10 -20], -2, 2, 1e-8, 5);

printf("\n\n")

UN_biseccion([1 2 10 -20], -2, 2, 1e-8, 50);

printf("\n\n\n     ====  Método de la regla falsa  ====\n\n")

UN_regla_falsa([1 2 10 -20], -2, 2, 1e-8, 5);

printf("\n\n")

UN_regla_falsa([1 2 10 -20], -2, 2, 1e-8, 50);

printf("\n\n\n     ====  Método de Newton  ====\n\n")

UN_newton([1 2 10 -20], -2, 1e-8, 5);

printf("\n\n")

UN_newton([1 2 10 -20], -2, 1e-8, 50);

printf("\n\n\n     ====  Método de la secante  ====\n\n")

UN_secante([-2 -4 7 -3], -4.5, 4.5, 1e-8, 10);

printf("\n\n")

UN_secante([1 2 10 -20], -2, 2, 1e-8, 50);
