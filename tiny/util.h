#if defined(__arm__) || defined(__thumb__)
#define EXIT()                                  \
    asm("svc #0")
#endif

#ifdef __powerpc__
#define EXIT() \
  asm("li 0,1\n"              \
      "sc")
#endif

#ifdef __i686__
#define EXIT() \
  asm("movq $60,%rax\n"              \
      "movq $0,%rdi\n"               \
      "syscall")
#endif
