#include "m_md4.h"


char *m_MD4(const char **str){
    unsigned int i = 0;
    char *mdString = (char *) malloc(34);
    unsigned char digest[MD4_DIGEST_LENGTH];
    MD4_CTX ctx;
    MD4_Init(&ctx);
    MD4_Update(&ctx, *str, strlen(*str));
    MD4_Final(digest, &ctx);
    for(; i < MD4_DIGEST_LENGTH; i++)
        sprintf(&mdString[i*2], "%02x", (unsigned int) digest[i]);
    return mdString;
}
