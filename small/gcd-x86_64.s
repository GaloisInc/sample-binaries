	.file	"gcd.c"
	.text
	.p2align 4,,15
	.globl	gcd
	.type	gcd, @function
gcd:
.LFB0:
	.cfi_startproc
.L8:
	cmpl	%esi, %edi
	je	.L2
.L10:
	cmpl	%edi, %esi
	jnb	.L3
	subl	%esi, %edi
	shrl	%edi
	cmpl	%esi, %edi
	jne	.L10
.L2:
	leal	(%rdi,%rdi), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	subl	%edi, %esi
	shrl	%esi
	jmp	.L8
	.cfi_endproc
.LFE0:
	.size	gcd, .-gcd
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	movl	$291, %esi
	movl	$938, %edi
	jmp	gcd@PLT
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
