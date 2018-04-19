#include <stdio.h>
int main(int argc, char *argv[],char * envp[])
{
	int count;
	for(count = 1; count < argc; count++)
	{
		printf("%s ",argv[count]);
	}
	printf("\n");
	count = 0;
	while(*envp)
       		 {
			count++;
			printf("%s\n",*envp++);
		 }	
	printf("There are in all %d environment variables.\n",count);
	return 0;
}
