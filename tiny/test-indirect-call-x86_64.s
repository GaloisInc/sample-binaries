	.file	"test-indirect-call.c"
	.text
	.p2align 4,,15
	.globl	callee
	.type	callee, @function
callee:
.LFB0:
	.cfi_startproc
	leal	(%rdi,%rdi), %eax
	ret
	.cfi_endproc
.LFE0:
	.size	callee, .-callee
	.p2align 4,,15
	.globl	_start
	.type	_start, @function
_start:
.LFB1:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	g@GOTPCREL(%rip), %rbx
	movq	callee@GOTPCREL(%rip), %rdx
	movq	fptr@GOTPCREL(%rip), %rax
	movl	(%rbx), %edi
	movq	%rdx, (%rax)
	call	callee@PLT
	movl	%eax, (%rbx)
#APP
# 15 "test-indirect-call.c" 1
	movq $60,%rax
movq $0,%rdi
syscall
# 0 "" 2
#NO_APP
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	_start, .-_start
	.comm	fptr,8,8
	.globl	g
	.data
	.align 4
	.type	g, @object
	.size	g, 4
g:
	.long	-11
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
