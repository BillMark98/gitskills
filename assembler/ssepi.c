#include <stdio.h>
#include <stdlib.h>
double step, sum;
int num_steps = 100;
double four[] __attribute__((aligned(16))) = {4.0,4.0};
double two[] __attribute__((aligned(16))) = {2.0,2.0};
double one[] __attribute__((aligned(16))) = {1.0,1.0};
double ofs[] __attribute__((aligned(16))) = {0.5,1.5};

void calcPi_SSE(void);
int main()
{
    sum = 0.0f;
    step = 1.0f/(float) num_steps;
    calcPi_SSE();
    printf("PI = %f (SSE) \n",sum*step);
    return 0;
}