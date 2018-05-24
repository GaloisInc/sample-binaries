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
	.file	"test-indirect-calls.c"
	.comm	g1,4,4
	.comm	g2,4,4
	.comm	g3,4,4
	.comm	g4,4,4
	.text
	.align	2
	.global	f2
	.syntax unified
	.arm
	.fpu softvfp
	.type	f2, %function
f2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, .L3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L4:
	.align	2
.L3:
	.word	g2
	.size	f2, .-f2
	.align	2
	.global	f1
	.syntax unified
	.arm
	.fpu softvfp
	.type	f1, %function
f1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L7
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	g1
	.size	f1, .-f1
	.align	2
	.global	_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	_start, %function
_start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L11
	str	r3, [fp, #-12]
	ldr	r3, .L11+4
	str	r3, [fp, #-16]
	ldr	r3, .L11+8
	str	r3, [fp, #-20]
	ldr	r3, .L11+12
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L10
	ldr	r3, .L11+16
	str	r3, [fp, #-8]
.L10:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	mov	r0, r2
	mov	lr, pc
	bx	r3
	mov	r2, r0
	ldr	r3, .L11
	str	r2, [r3]
	.syntax divided
@ 27 "test-indirect-calls.c" 1
	svc #0
@ 0 "" 2
	.arm
	.syntax unified
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
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
