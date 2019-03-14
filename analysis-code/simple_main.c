/*
 * =====================================================================================
 *
 *       Filename:  simple_main.c
 *
 *    Description:  simple main fucntion used for binary analysis
 *
 *        Version:  1.0
 *        Created:  03/09/2019 10:27:54 AM
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Partha S. Ghosh (psglinux), psglinux@gmail.com
 *   Organization: 
 *
 * =====================================================================================
 */

#include <stdio.h> 

void bad_func()
{
    printf("I'm a hijacked function\n");
}
void good_func()
{
    printf("I'm a good function\n");
}

int main (int argc, char **argv)
{
    printf("I'm at main function\n");
    good_func();
    return (0);
}


