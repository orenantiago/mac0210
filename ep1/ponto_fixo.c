/* 
Nome: Renan Tiago dos Santos Silva
NUSP: 9793606
Parte 1: Método de ponto fixo
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

// converge se x < 2.079
double g_1(double x) {
    return -sqrt(exp(x)/2);
}

// converge se 0.357403 < x < 2.15329
double g_2(double x) {
    return exp(x) - 2*x*x + x;
}
// converge se x > 2
double g_3(double x) {
    return log(2*x*x);
}

//  x0 => ponto inicial para a iteração, n => número de iterações, e => epsilon
double fixed_point_iteration(double x0, double e, int n) {
    double x;
    double (*fun)(double);
    
    // de acordo com o valor de x0, escolho qual função g será utilizada na iteração
    if (x0 < 0.4) {
        fun = &g_1;
    }
    else if (x0 <= 2) {
        fun = &g_2;
    }
    else {
        fun = &g_3;
    }

    x = (*fun)(x0);
    for (int i = 1; i < n && fabs(x - (*fun)(x)) > e; i++) {
        x = (*fun)(x);
    }
    return x;
}

int main(int argc, char const *argv[])
{
    double x1 = fixed_point_iteration(-5, 0, 8000000);
    double x2 = fixed_point_iteration(1.5, 0, 8000000);
    double x3 = fixed_point_iteration(6, 0, 8000000);

    printf("%lf\n", x1);
    printf("%lf\n", x2);
    printf("%lf\n", x3);
    return 0;
}

