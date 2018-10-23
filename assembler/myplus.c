#include <stdio.h>
int main()
{
	int a = 2;
	int b = (++a*++a);
	printf("%d\n",b);
	return 0;
}
