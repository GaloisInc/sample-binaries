	.file	"test-conditional.c"
	.text
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
	movq	g@GOTPCREL(%rip), %rdx
	movl	(%rdx), %eax
	testl	%eax, %eax
	jle	.L2
	addl	$1, %eax
	movl	%eax, (%rdx)
.L2:
#APP
# 10 "test-conditional.c" 1
	movq $60,%rax
movq $0,%rdi
syscall
# 0 "" 2
#NO_APP
	ret
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.globl	g
	.data
	.align 4
	.type	g, @object
	.size	g, 4
g:
	.long	-11
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
