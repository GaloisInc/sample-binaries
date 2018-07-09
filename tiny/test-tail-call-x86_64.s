	.file	"test-tail-call.c"
	.text
	.p2align 4,,15
	.globl	callee2
	.type	callee2, @function
callee2:
.LFB0:
	.cfi_startproc
	movq	g@GOTPCREL(%rip), %rax
	addl	%edi, (%rax)
	ret
	.cfi_endproc
.LFE0:
	.size	callee2, .-callee2
	.p2align 4,,15
	.globl	callee1
	.type	callee1, @function
callee1:
.LFB1:
	.cfi_startproc
	movq	g@GOTPCREL(%rip), %rax
	leal	(%rdi,%rdi), %edx
	addl	%edx, (%rax)
	jmp	callee2@PLT
	.cfi_endproc
.LFE1:
	.size	callee1, .-callee1
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB2:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	g@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	call	callee1@PLT
#APP
# 28 "test-tail-call.c" 1
	 movq $0,%rdi
 movq $60,%rax
 syscall
# 0 "" 2
#NO_APP
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
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
