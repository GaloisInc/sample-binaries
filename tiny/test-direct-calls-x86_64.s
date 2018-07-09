	.file	"test-direct-calls.c"
	.text
	.p2align 4,,15
	.globl	f2
	.type	f2, @function
f2:
.LFB0:
	.cfi_startproc
	movl	g2@GOTPCREL(%rip), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	f2, .-f2
	.p2align 4,,15
	.globl	f1
	.type	f1, @function
f1:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	movq	%rsi, %rbp
	leaq	(%rdx,%rdx), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	f2@PLT
	cltq
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	leaq	-100(%rbp,%rax), %rax
	subq	%rax, %rbx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	f1, .-f1
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB2:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	g1@GOTPCREL(%rip), %rbx
	movq	g3@GOTPCREL(%rip), %rdx
	movq	g2@GOTPCREL(%rip), %rsi
	movq	%rbx, %rdi
	call	f1@PLT
	movl	%eax, (%rbx)
#APP
# 25 "test-direct-calls.c" 1
	 movq $0,%rdi
 movq $60,%rax
 syscall
# 0 "" 2
#NO_APP
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE2:
	.size	_start, .-_start
	.comm	g4,4,4
	.comm	g3,4,4
	.comm	g2,4,4
	.comm	g1,4,4
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
