#include <stdio.h>
void f(void);
int x = 1444;
int y = 1234;
#define XX 1

int main()
{
    f();
    int a = XX;
    
    printf("x = 0x%x, y = 0x%x\n",x,y);
    return 0;
}