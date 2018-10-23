#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main()
{
  char a[10];
  char * ptr = "hi there";
  char * ptr2 = (char *) malloc(4*sizeof(char));
  strcpy(a,ptr);
  printf("Hello world. %s\n",a);
  printf("One hi.\n");
  free(ptr2);
  return 0;
}
