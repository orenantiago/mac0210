/* 
Nome: Renan Tiago dos Santos Silva
NUSP: 9793606
Parte 2: Método de Newton
*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <complex.h>


complex double evalf(complex double x) {
    return x*x*x*x + x*x + 3.0;
}

complex double evalDf(complex double x) {
    return 4.0 * x*x*x + 2.0 * x;
}

complex double newton_iteration(complex double xk) {
    return xk - evalf(xk)/evalDf(xk);
}

complex double newton(complex double x0, double e, int n) {
    complex double x;
    int i;
    x = newton_iteration(x0);
    for (i = 1; i < n && cabsf(x - newton_iteration(x)) > e; i++) {
        x = newton_iteration(x);
    }
    // se não convergir, retorne NAN
    if (i == n) {
        return NAN;
    }
    return x;
}

// função que retorna um valor rgb para cada uma das raízes.
char* color_value(complex double x) {
    if(isnan(creal(x))) {
        return "[0,0,0]";
    }
    if (creal(x) > 0 && cimag(x) > 0) {
        return "[255,0,0]";
    }
    if (creal(x) < 0 && cimag(x) > 0) {
        return "[0,255,0]";
    }
    if (creal(x) < 0 && cimag(x) < 0) {
        return "[0,0,255]";
    }
    if (creal(x) > 0 && cimag(x) < 0) {
        return "[175,175,175]";
    }

}

int newton_basins(double l, double u, double p) {
    FILE *file;
    complex double result;

    file = fopen("output.txt", "w+");
    if (file == NULL) {
        printf("Erro ao criar arquivo");
        exit(1);
    }

    fprintf(file, "%lf,%lf\n", l, u);

    for (double i = l; i <= u; i+= p) {
        for (double j = l; j <= u; j += p) {
            result = newton(i + j*I, 0, 10000);
            fprintf(file, "%s", color_value(result));
            if (j < u - p) {
                fprintf(file, ";");
            }
        }
        fprintf(file, "\n");
    }
    fclose(file);
}

int main(int argc, char const *argv[])
{
    newton_basins(-2.0, 2.0, 0.01);
    return 0;
}
