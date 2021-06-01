#include <stdlib.h>

typedef void (*func_ptr) (void);

void setfortranenv() {
  putenv("GFORTRAN_UNBUFFERED_PRECONNECTED=y");
}

static func_ptr __extra_init_array_entry[]
  __attribute__ ((__used__, section(".init_array"), aligned(sizeof(func_ptr))))
  = { setfortranenv };

#if defined(__init_argc) && defined(__init_argv)
int   _argc   = __init_argc;
char* _argv[] = { __init_argv , NULL};
#endif
