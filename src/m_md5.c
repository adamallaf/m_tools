#include "m_md5.h"


char *m_MD5(const char **str){
    unsigned int i = 0;
    char *mdString = (char *) malloc(34);
    unsigned char digest[MD5_DIGEST_LENGTH];
    MD5_CTX ctx;
    MD5_Init(&ctx);
    MD5_Update(&ctx, *str, strlen(*str));
    MD5_Final(digest, &ctx);
    for(; i < MD5_DIGEST_LENGTH; i++)
        sprintf(&mdString[i*2], "%02x", (unsigned int) digest[i]);
    return mdString;
}
