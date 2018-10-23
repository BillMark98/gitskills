#include <stdio.h>
typedef unsigned char * byte_pointer;
void show_byte(byte_pointer bp, int len)
{
    int index;
    for(index = 0; index < len; index++)
    {
        printf("%.2x", bp[index]);
    }
    printf("\n");
}

void show_int(int x)
{
    show_byte((byte_pointer)(&x),(int) sizeof(int));
}
void show_float(int x)
{
    show_byte((byte_pointer)(&x), (int) sizeof(float));
}
void show_pointer(void * x)
{
    show_byte((byte_pointer)(&x), (int) sizeof(void *));
}
int main()
{
    // int ivar = 12345;
    // float fvar = (float)ivar;
    // show_int(ivar);
    // show_float(fvar);
    // show_pointer(&ivar);
    // printf("the size of pointer is %d\n", (int) sizeof(void *));
    int val = 0x87654321;
    byte_pointer valp = (byte_pointer) &(val);
    show_byte(valp,1);
    show_byte(valp, 2);
    show_byte(valp, 3);
    show_byte("12345",6);
    return 0;
}