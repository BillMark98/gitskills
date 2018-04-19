#include <stdio.h>
#include <string.h> // strcmp
#include <stdlib.h> // getenv
int main(int argc,char * argv[],char * envp[])
{
	if(argc == 3)
        {
                if(strcmp(argv[2], "-v") == 0)
                {
		printf("The value of the env variable %s is %s\n",
			argv[1],getenv(argv[1]));
		}
                if(getenv(argv[1]) != NULL)
                        return 0; // the env variable is set.
                else
                        return 0; // the env variable is unset.
	}
	else if(argc == 2)
	{
		if(getenv(argv[1]) != NULL)
			return 0; // the env variable is set.
		else
			return 0; // the env variable is unset.
	}
        else
	{
		printf("The usage: give an env name and \'-v\' if you\ 
want to know the value of that variable.\n");
	}
	return 2; // error
}
