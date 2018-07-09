	.file	"test-just-exit.c"
	.text
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
#APP
# 4 "test-just-exit.c" 1
	 movq $0,%rdi
 movq $60,%rax
 syscall
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
