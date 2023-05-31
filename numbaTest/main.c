#include <dlfcn.h>
#include <stdio.h>

//#define SYMBOL_SIX "_ZN8__main__7six$241E"
#define SYMBOL_SIX "cfunc._ZN8__main__7six$241E"


typedef int (*SixFuncPtr)();


int main()
{
    void *pMod = dlopen("./libnumba_six_linux.so", RTLD_LAZY);
    if (!pMod) {
        printf("Error (%s) loading module\n", dlerror());
        return -1;
    }
    SixFuncPtr pSixFunc = dlsym(pMod, SYMBOL_SIX);
    if (!pSixFunc) {
        printf("Error (%s) loading function\n", dlerror());
        dlclose(pMod);
        return -2;
    }
    printf("six() returned: %d\n", (*pSixFunc)());
    dlclose(pMod);
    return 0;
}