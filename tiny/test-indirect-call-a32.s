	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"test-indirect-call.c"
	.global	g
	.data
	.align	2
	.type	g, %object
	.size	g, 4
g:
	.word	-11
	.comm	fptr,4,4
	.text
	.align	2
	.global	callee
	.syntax unified
	.arm
	.fpu softvfp
	.type	callee, %function
callee:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	callee, .-callee
	.align	2
	.global	_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	_start, %function
_start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L4
	ldr	r2, .L4+4
	str	r2, [r3]
	ldr	r3, .L4
	ldr	r3, [r3]
	ldr	r2, .L4+8
	ldr	r2, [r2]
	mov	r0, r2
	mov	lr, pc
	bx	r3
	mov	r2, r0
	ldr	r3, .L4+8
	str	r2, [r3]
	.syntax divided
@ 15 "test-indirect-call.c" 1
	svc #0
@ 0 "" 2
	.arm
	.syntax unified
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	fptr
	.word	callee
	.word	g
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
