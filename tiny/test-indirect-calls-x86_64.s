	.file	"test-indirect-calls.c"
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
	movq	g1@GOTPCREL(%rip), %rax
	addq	%rdi, %rax
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
	movq	g2@GOTPCREL(%rip), %rdi
	movq	g1@GOTPCREL(%rip), %rbx
	cmpq	%rbx, %rdi
	jge	.L6
	movq	f2@GOTPCREL(%rip), %rax
.L5:
	addq	g3@GOTPCREL(%rip), %rdi
	call	*%rax
	movl	%eax, (%rbx)
#APP
# 27 "test-indirect-calls.c" 1
	movq $60,%rax
movq $0,%rdi
syscall
# 0 "" 2
#NO_APP
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movq	f1@GOTPCREL(%rip), %rax
	jmp	.L5
	.cfi_endproc
.LFE2:
	.size	_start, .-_start
	.comm	g4,4,4
	.comm	g3,4,4
	.comm	g2,4,4
	.comm	g1,4,4
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
