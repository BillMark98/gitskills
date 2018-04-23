#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h> // exec-family, fork
int main(int argc, char * argv[], char * envp[])
{
    //usage: default path is /bin. if user wants to use programm which he
    // has written, he has to give the absolute path of the programm
    char * mypath;
    int command = 0;
    pid_t fpid;
    fpid = fork();
    if(fpid < 0)
        printf("error in fork!\n");
    else if(fpid == 0)
    {
        printf("I am the child process, my process id:%d\n",getpid());
        if(argc == 2)
        {
	    mypath = getenv("MYPATH");
            printf("the mypath: %s\n",mypath);
            if(mypath == NULL)
            {
                mypath = "/bin/";//default setting
                command = 1; // the input name should be a command, e.g ls
            }
            
            int length = (int)(strlen(mypath)+strlen(argv[1])+1);
            char path1[length];
            strcpy(path1,mypath);
            if(command == 1)
            {
                strcat(path1,argv[1]);
            }
            else
            {
                strcat(path1,argv[1]+1); // for example input is ./myexecv ./hello_world then the path should be set to /user/hello_world
            }
            //if(argv[1][0] == '.')
            //	strcat(path1,argv[1]+1);
            //else
            
            printf("The path is : %s\n",path1);
            execv(path1,argv+1);
	    exit(1);
        }
        else if(argc == 3)
        {
            printf("The path is : %s\n",argv[2]);
           // execv(argv[2],argv+1);
	      const char * arg1 = argv[1];
            const char * arg[] = {arg1,NULL};
            execv(argv[2],(char * const *)arg);
	   // execv("/bin/ls",argv+1);
	}
        printf("This line should not be printed.\n");
        printf("command ls is not found, error code: %d(%s)\n", errno,
           strerror(errno));
    }
    else
    {
        printf("I am the parent process, my process id:%d\n",getpid());
   	wait(NULL);
    }
    
    return 0;
}
