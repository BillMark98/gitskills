#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[],char * envp[])
{
	// int count;
	// for(count = 1; count < argc; count++)
	// {
	// 	printf("%s ",argv[count]);
	// }
	// printf("\n");
	// count = 0;
	// giving out the environment variable
	// while(*envp)
	// {
	//     count++;
	// 	printf("%s\n",*envp++);
	// }	
	// printf("There are in all %d environment variables.\n",count);
    char * p;
    int x = getenv(argv[1]);
    printf("The value of x: %x\n", x);
    p = x;
    if(p != NULL)
    {
        printf("The env variable %s has value: %s\n", argv[1],p);
    }
    else{
        printf("The env variable is unset.\n");
    }
    p = "Hello";


	return 0;

//     	if(argc == 3)
//     {
//         if(strcmp(argv[2], "-v") == 0)
//         {
// 		    printf("The value of the env variable %s is %s\n",
// 			argv[1],getenv(argv[1]));
// 		}
//         if(getenv(argv[1]) != NULL)
//             return 0; // the env variable is set.
//         else
//             return 0; // the env variable is unset.
// 	}
// 	else if(argc == 2)
// 	{
// 		if(getenv(argv[1]) != NULL)
// 			return 0; // the env variable is set.
// 		else
// 			return 0; // the env variable is unset.
// 	}
//     else  //format of input is incorrect
// 	{
// 		printf("The usage: give an env name and \'-v\' if you\ 
// want to know the value of that variable.\n");
// 	}
// 	return 2; // error





}
