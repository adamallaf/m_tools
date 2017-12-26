#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
#include "m_md4.h"


char *str = 0;


void handSig(){
    puts("\rExit!");
    exit(0);
}


void cleanUp(){
    free(str);
}


int main(int argc, char *argv[])
{
    atexit(cleanUp);
    signal(SIGINT, handSig);
    signal(SIGTERM, handSig);
    unsigned int input_len = 0;
    char *md_str = 0;
    size_t len = 0;
    while(getline(&str, &len, stdin) != -1)
    {
        input_len = strlen(str);
        if(str[input_len - 1] == '\n')
        {
            str[input_len - 1] = '\0';
            input_len--;
        }
        md_str = m_MD4((const char **)&str);
        fprintf(stdout, "%s\n", md_str);
        free(md_str);
    }
    return 0;
}
