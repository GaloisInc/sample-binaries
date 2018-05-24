	.arch armv7-m
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
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
	.align	1
	.global	callee
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	callee, %function
callee:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	lsls	r3, r3, #1
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
	.size	callee, .-callee
	.align	1
	.global	_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L4
	ldr	r2, .L4+4
	str	r2, [r3]
	ldr	r3, .L4
	ldr	r3, [r3]
	ldr	r2, .L4+8
	ldr	r2, [r2]
	mov	r0, r2
	blx	r3
	mov	r2, r0
	ldr	r3, .L4+8
	str	r2, [r3]
	.syntax unified
@ 15 "test-indirect-call.c" 1
	svc #0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	fptr
	.word	callee
	.word	g
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
