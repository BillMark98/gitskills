#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#define NUMTHRDS 4
#define VECLEN 10000
typedef struct{
    double *a;
    double *b;
    int veclen;
    double sum;
}DOTDATA;

typedef struct
{
    int start;
    int end;
    double mysum;
}THRDDATA;

DOTDATA dotstr;
pthread_t Mythrd[NUMTHRDS];
pthread_mutex_t mutexsum;

void * func(void * index)
{
    long len = (long) index;
    int start = (int)len * VECLEN;
    int end = (int)start + VECLEN;
    int i;
    double mysum = 0;
    for( i = start; i < end; i++)
    {
        mysum += dotstr.a[i]*dotstr.b[i];
    }

    pthread_mutex_lock(&mutexsum);
    dotstr.sum += mysum;
    printf("Thread %ld starts from %d to %d calculats the sum %f\n",
    len,start,end, mysum);
    pthread_mutex_unlock(&mutexsum);
    pthread_exit(NULL);
}

int main()
{
    long i;
    int Ret[NUMTHRDS];
    dotstr.a = (double *) malloc(NUMTHRDS * VECLEN * sizeof(double));
    dotstr.b = (double *) malloc(NUMTHRDS * VECLEN * sizeof(double));
    for(i = 0; i < NUMTHRDS * VECLEN; i++)
    {
        dotstr.a[i] = 1;
        dotstr.b[i] = 1;
    }
    pthread_mutex_init(&mutexsum,NULL);
    for(i = 0; i < NUMTHRDS; i++)
    {
        Ret[i] = pthread_create(&(Mythrd[i]),NULL,func,(void *) i);
        if(Ret[i])
        {
            printf("Thread %ld failed to create.\n",i);
            exit(1);
        }
        pthread_join(Mythrd[i],NULL);
    }
    free(dotstr.a);
    free(dotstr.b);
    pthread_mutex_destroy(&mutexsum);
    printf("The sum is %f\n", dotstr.sum);
    pthread_exit(NULL);

}
