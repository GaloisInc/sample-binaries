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
	.file	"test-tail-call.c"
	.global	g
	.data
	.align	2
	.type	g, %object
	.size	g, 4
g:
	.word	-11
	.text
	.align	1
	.global	callee2
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	callee2, %function
callee2:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L2
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	ldr	r2, .L2
	str	r3, [r2]
	nop
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L3:
	.align	2
.L2:
	.word	g
	.size	callee2, .-callee2
	.align	1
	.global	callee1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	callee1, %function
callee1:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	lsls	r2, r3, #1
	ldr	r3, .L5
	ldr	r3, [r3]
	add	r3, r3, r2
	ldr	r2, .L5
	str	r3, [r2]
	ldr	r0, [r7, #4]
	bl	callee2
	nop
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	g
	.size	callee1, .-callee1
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
	ldr	r3, .L8
	ldr	r3, [r3]
	mov	r0, r3
	bl	callee1
	.syntax unified
@ 28 "test-tail-call.c" 1
	svc #0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	g
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
