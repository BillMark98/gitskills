#include <stdio.h>
extern  int fib(int x);
int main()
{
  int n = 8;
  int result = fib(8);
  printf("In main, the result: %d\n",result);
  return 0;
}
