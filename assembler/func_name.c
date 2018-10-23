#include <stdio.h>
#include <pthread.h>
void *thread_func(void *p_arg)
{
        pid_t pid = getpid();
        pthread_t tid = pthread_self();
        printf("I am tid: %u pid : %u\n",(unsigned int) pid,
                (unsigned int) tid);
}
int main(void)
{
        pthread_t t1, t2;

        pthread_create(&t1, NULL, thread_func, "Thread 1");
        pthread_create(&t2, NULL, thread_func, "Thread 2");

      //  sleep(10);
        return 0;
}
