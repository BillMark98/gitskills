#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h> // exec-family, fork
int main(int argc, char * argv[], char * envp[])
{
	//usage: default path is /bin. if user wants to use programm which he 
 	// has written, he has to give the absolute path of the programm
	pid_t fpid;
	fpid = fork();
	if(fpid < 0)
		printf("error in fork!\n");
	else if(fpid == 0)
	{
		printf("I am the child process, my process id:%d\n",getpid());
	}
	else
	{
		printf("I am the parent process, my process id:%d\n",getpid());
	}
	if(argc == 2)
	{
		char * path = "/bin/";
		int length = (int)strlen(path)+strlen(argv[1])+1;
		char path1[length];
		strcpy(path1,path);
		//if(argv[1][0] == '.')
		//	strcat(path1,argv[1]+1);
		//else
			strcat(path1,argv[1]);
		printf("The path is : %s\n",path1);
		execv(path1,argv+1);
	}
	else if(argc == 3)
	{
		char * path = "/Users/bill/gitstuty/gitskills";
		printf("In the 3.\n");
		printf("The path is : %s\n",argv[2]);
		printf("%s\n",argv[1]);
		execv(argv[2],argv+1);
		
	}
	printf("This line should not be printed.\n");
	printf("command ls is not found, error code: %d(%s)\n", errno,
	 strerror(errno));

	return 0;
}

