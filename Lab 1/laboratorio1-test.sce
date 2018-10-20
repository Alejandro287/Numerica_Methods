clc

printf("     ====  Método de bisección  ====\n\n")

UN_biseccion([1 0 -2 0 -3], -1, 3, 1e-8, 5);

printf("\n\n")

UN_biseccion([1 0 -2 0 -3], -1, 3, 1e-8, 50);

printf("\n\n\n     ====  Método de la regla falsa  ====\n\n")

UN_regla_falsa([1 0 -2 0 -3], -1, 3, 1e-8, 5);

printf("\n\n")

UN_regla_falsa([1 0 -2 0 -3], -1, 3, 1e-4, 50);

printf("\n\n\n     ====  Método de Newton  ====\n\n")

UN_newton([1 0 -2 0 -3], -5, 1e-8, 5);

printf("\n\n")

UN_newton([1 0 -2 0 -3], -5, 1e-8, 10);

printf("\n\n\n     ====  Método de la secante  ====\n\n")

UN_secante([1 0 -2 0 -3], -1, 3, 1e-8, 5);

printf("\n\n")

UN_secante([1 0 -2 0 -3], -1, 3, 1e-8, 50);
