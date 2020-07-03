#include <stdio.h>

#define N 9

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

// int check_input(int argc, char const *argv[]) {
//     char *message = "execute o programa da seguinte forma:\n"
//                     "./programa metodo n\n"
//                     "metodo => metodo de interpolação a ser usado, onde 1 = newton e 2 = lagrange\n"
//                     "n => número maior que 7 de pontos que serão usados entre x = 1 e x = 30 após a interpolação\n";
//     if (argc != N_ARGS) {
//         printf("%s", message);
//         return -1;
//     }
//     else if ((int) *argv[1] != 1 || (int) *argv[1] != 2) {
//         printf("%s", message);
//         return -1;
//     }
//     else if ((int) *argv[2] <= 7) {
//         printf("%s", message);
//         return -1;
//     }
//     return 0;
// }

// double * lagrange_polynomial (double x[], double f[]) {
//     double p[7] = {};

//     return p;
// }

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
    for (int i = 0; i < 7 + 6*N; i++) {
        printf("%f => %f\n", x_i[i], f_i[i]);
    }

    return 0;
}
