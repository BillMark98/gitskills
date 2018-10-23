#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>
#define NUMTHRDS 4
#define STEP 100000000
pthread_mutex_t mutexsum;
double sum;

void * picalc(void * arg)
{
    long index = (long) arg;
    long intervall = (long) STEP/NUMTHRDS;
    long start = intervall * index;
    long end = intervall + start;
    double mysum = 0;
    long i;
    double x,temp;
    for(i = start; i < end; i++)
    {
        x = (i+0.5f)/STEP;
        temp = 1 + x * x;
        mysum += 4.0/temp * 1/STEP;
    }
    pthread_mutex_lock(&mutexsum);
    sum += mysum;
    pthread_mutex_unlock(&mutexsum);
    pthread_exit(NULL);
}
int main()
{
    pthread_t Mythrd[NUMTHRDS];
    long i;
    int ret;
    double duration;
    clock_t start, finish;
    start = clock();
    pthread_mutex_init(&mutexsum,NULL);
    for( i = 0; i < NUMTHRDS; i++)
    {
       ret = pthread_create(&(Mythrd[i]),NULL,picalc,(void *) i);
       if(ret)
       {
           printf("Thread %ld failed to create.\n", i);
           exit(1);
       }
    }
    for(i = 0; i < NUMTHRDS; i++)
    {
        pthread_join(Mythrd[i],NULL);
    }
    finish = clock();
    duration = (double) (finish - start)/CLOCKS_PER_SEC;
    printf("The sum is %f and the duration is %f secs\n", sum,duration);
    pthread_mutex_destroy(&mutexsum);
    pthread_exit(NULL);
    return 0;
}