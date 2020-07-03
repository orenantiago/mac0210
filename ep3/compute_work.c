/* 
Nome: Renan Tiago dos Santos Silva
NUSP: 9793606
Parte 1: Computando trabalho
*/

#include <stdio.h>
#include <stdlib.h>

#define N 10

// calcula os polinomios de lagrange
double L(int i, double x[7], double val) {
    double result = 1;
    for(int j = 0; j < 7; j++) {
        if(i != j) {
            result = result* (val - x[j])/(x[i] - x[j]);
        }
    }
    return result;
}

// interpola
int interpolate(int n, double x_i[n], double f_i[n], double x[7], double f[7]) {
    double val;
    for (int i = 0; i < n; i++) {
        val = 0;
        for (int j = 0; j < 7; j++) {
            val += L(j, x, x_i[i]) * f[j];
        }
        f_i[i] = val;
    }
    return 0;
}

double composite_trapezoidal_integration(int n, double f_i[n]) {
    double h, integral;
    h = 30.0/n;
    double result = (f_i[0] + f_i[n-1])/2.0;
    
    for (int i = 1; i < n-1; i++) {
        result += f_i[i];
    }

    return h*result;
}

int main(int argc, char const *argv[])
{

    double x [7] = {0, 5, 10, 15, 20, 25, 30};
    double f [7] = {0, 9, 13, 14, 20.5, 12, 5};
    double theta [7] = {.5, 1.4, .75, .9, 1.3, 1.48, 1.5};
    double f_cos_theta[7] = {0, 1.5297, 9.5120, 8.7025, 2.8087, 1.0881, 0.3537};

    double x_i [7 + 6*N];
    double f_i [7 + 6*N];
    double delta = 5.0/(N+1);

    for(int i = 0; i < 6;i++) {
        x_i[i+i*N] = x[i];
        for (int j = i+i*N + 1; j < (i+1)+(i+1)*N; j++) {
            x_i[j] = x_i[j-1] + delta;
        }
    }
    x_i[6 + 6*N] = 30;
    interpolate(6 + 6*N, x_i, f_i, x, f_cos_theta);
    double  comp_t_I = composite_trapezoidal_integration(6 + 6*N, f_i);

    printf("%f\n", comp_t_I);
    // for (int i = 0; i < 7 + 6*N; i++) {
    //     printf("%f\n", x_i[i]);
    // }
    // fclose(file);

    return 0;
}
