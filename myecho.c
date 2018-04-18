#include <stdio.h>
int main(int argc, char *argv[],char * envp[])
{
	int count;
	for(count = 1; count < argc; count++)
	{
		printf("%s ",argv[count]);
	}
	printf("\n");
	return 0;
}
