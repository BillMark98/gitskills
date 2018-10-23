#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include <pthread.h>
#include "init.h"

#define	L 4
#define M	4
#define N 4
#define MAXTHREAD 2

double** A;
double** B;
double** C;

int STEP;
void malmul(int MM, int NN, int i, int j); // defined in asm file
typedef struct para
{
	double ** matA;
	double ** matB;
	double ** matC;
	int LL;
	int MM;
	int NN;
}param;
void matrixmul(double ** matA,double ** matB, double ** matC,int Len, int Men,int Nen);

void * myfunc(void * arg)
{
	param * Matrix_parameter = (param *) arg;
	matrixmul(Matrix_parameter -> matA, Matrix_parameter -> matB,
						Matrix_parameter -> matC, Matrix_parameter -> LL,
						Matrix_parameter -> MM,Matrix_parameter -> NN);
}
void * myfunc2(void * arg)
{
	int calstep = *(int *) arg;
	int i,j,k;
	int start = calstep * STEP;
	int end = (calstep + 1) * STEP;
	double sum;
	for(i = start; i < end; i++)
	{
		for(j = 0; j < N; j++)
		{
			sum = 0;
			for(k = 0; k < M; k++)
			{
				sum += A[i][k]*B[k][j];
			}
			C[i][j] = sum;
		}
	}
	return 0;
}
void * myfunc3(void * arg)
{
	int calstep = *(int *) arg;
	int i,j;
	int start = calstep * STEP;
	int end = (calstep + 1) * STEP;
	for(i = start; i < end; i++)
	{
		for(j = 0; j < N; j++)
		{
			malmul(M,N,i,j);
		}
	}
}
int main(int argc, char* argv[])
{
	unsigned int i, j, k;
	int ret;
	struct timeval start, end;
	int index,step;
	pthread_t threads[MAXTHREAD];
	//param thr_arg[MAXTHREAD];
	int thr_arg2[MAXTHREAD];
	// init random number generator
	srand((unsigned) time(NULL));

	printf("\nInitialize matrices...\n");
	ret = generate_random_matrix(&A, L, M);
	if (ret != 0)
		return ret;
	ret = generate_random_matrix(&B, M, N);
	if (ret != 0)
		return ret;
	ret = generate_empty_matrix(&C, L, N);
	if (ret != 0)
		return ret;

	printf("Start multiplication...\n");

	gettimeofday(&start, NULL);

	/*
   * TODO: Hier den eigenen Code einfügen!
   */
	 STEP = (int) L/MAXTHREAD;
	 step = (int) L/MAXTHREAD;
	/* for(index = 0; index < MAXTHREAD; index++)
	 {
		 thr_arg[index].matA = A + index*step;
		 thr_arg[index].matB = B;
		 thr_arg[index].matC = C + index*step;
		 thr_arg[index].LL = step;
		 thr_arg[index].MM = M;
		 thr_arg[index].NN = N;
		 pthread_create(&(threads[index]),NULL,myfunc,&(thr_arg[index]));
	 }
	 for(index = 0; index < MAXTHREAD; index ++)
	 {
		 pthread_join(threads[index],NULL);
	 }
*/
	for(index = 0; index < MAXTHREAD; index++)
	{
			thr_arg2[index] = index;
			pthread_create(&threads[index],NULL,myfunc3,&(thr_arg2[index]));
	}
	for(index = 0; index < MAXTHREAD; index++)
	{
			pthread_join(threads[index],NULL);
	}

//	matrixmul(A,B,C,L,M,N);
	gettimeofday(&end, NULL);

	if ((N<=8) && (L<=8) && (M<=8)){
		printf("Matrix A\n");
		  output_matrix(&A,L,M);
		printf("Matrix B\n");
		  output_matrix(&B,M,N);
		printf("Matrix C\n");
  		  output_matrix(&C,L,N);
	}
	printf("Time : %lf sec\n",  (double) (end.tv_sec - start.tv_sec)
		+ (double)(end.tv_usec - start.tv_usec) / 1000000.0);

	// frees the allocated memory
	clean_matrix(&C);
	clean_matrix(&B);
	clean_matrix(&A);

	return 0;
}
void matrixmul(double ** A,double ** B, double ** C,int Len, int Men,int Nen)
{
	int i,j,k;
	// double sum = 0;
	for(i = 0; i < Len; i++)
	{
		for(j = 0; j < Nen; j ++)
		{
			C[i][j] = 0;
			for(k = 0;k < Men; k++)
			{
				C[i][j] += A[i][k]*B[k][j];
			}
		}
	}

}
