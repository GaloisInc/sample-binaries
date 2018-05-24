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
	.file	"test-indirect-calls.c"
	.comm	g1,4,4
	.comm	g2,4,4
	.comm	g3,4,4
	.comm	g4,4,4
	.text
	.align	1
	.global	f2
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	f2, %function
f2:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L3
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L4:
	.align	2
.L3:
	.word	g2
	.size	f2, .-f2
	.align	1
	.global	f1
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	f1, %function
f1:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L7
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L8:
	.align	2
.L7:
	.word	g1
	.size	f1, .-f1
	.align	1
	.global	_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	ldr	r3, .L11
	str	r3, [r7, #8]
	ldr	r3, .L11+4
	str	r3, [r7, #4]
	ldr	r3, .L11+8
	str	r3, [r7]
	ldr	r3, .L11+12
	str	r3, [r7, #12]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	ble	.L10
	ldr	r3, .L11+16
	str	r3, [r7, #12]
.L10:
	ldr	r2, [r7]
	ldr	r3, [r7, #4]
	add	r2, r2, r3
	ldr	r3, [r7, #12]
	mov	r0, r2
	blx	r3
	mov	r2, r0
	ldr	r3, .L11
	str	r2, [r3]
	.syntax unified
@ 27 "test-indirect-calls.c" 1
	svc #0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	g1
	.word	g2
	.word	g3
	.word	f1
	.word	f2
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
