#include <stdio.h>

extern int fib(int);

int main(int argc, char const *argv[]) {
  int i=4;
  int result;
  result=fib(i);
  printf("%d\n",result);
  return 0;
}
