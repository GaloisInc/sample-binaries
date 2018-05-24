	.file	"test-fp.c"
	.text
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB23:
	.cfi_startproc
#APP
# 90 "test-fp.c" 1
	movq $60,%rax
movq $0,%rdi
syscall
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE23:
	.size	_start, .-_start
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
