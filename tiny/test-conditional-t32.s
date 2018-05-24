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
	.file	"test-conditional.c"
	.global	g
	.data
	.align	2
	.type	g, %object
	.size	g, 4
g:
	.word	-11
	.text
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
	@ link register save eliminated.
	push	{r7}
	add	r7, sp, #0
	ldr	r3, .L3
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L2
	ldr	r3, .L3
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L3
	str	r3, [r2]
.L2:
	.syntax unified
@ 10 "test-conditional.c" 1
	svc #0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7}
	bx	lr
.L4:
	.align	2
.L3:
	.word	g
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
