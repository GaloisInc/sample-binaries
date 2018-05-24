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
	.file	"test-fp.c"
	.text
	.align	2
	.global	_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	_start, %function
_start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, fp}
	add	fp, sp, #4
	sub	sp, sp, #152
	ldr	r3, .L2+16
	str	r3, [fp, #-8]	@ float
	ldr	r3, .L2+20
	str	r3, [fp, #-12]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]	@ float
	sub	r3, fp, #92
	str	r3, [fp, #-20]
	adr	r4, .L2
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-28]
	str	r4, [fp, #-24]
	adr	r4, .L2+8
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
	sub	r3, fp, #156
	str	r3, [fp, #-48]
	mov	r3, #4
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-56]
	mov	r3, #8
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-92]	@ float
	mov	r3, #0
	str	r3, [fp, #-88]	@ float
	mov	r3, #0
	str	r3, [fp, #-84]	@ float
	mov	r3, #0
	str	r3, [fp, #-80]	@ float
	mov	r3, #0
	str	r3, [fp, #-76]	@ float
	mov	r3, #0
	str	r3, [fp, #-72]	@ float
	mov	r3, #0
	str	r3, [fp, #-68]	@ float
	mov	r3, #0
	str	r3, [fp, #-64]	@ float
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-156]
	str	r4, [fp, #-152]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-148]
	str	r4, [fp, #-144]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-140]
	str	r4, [fp, #-136]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-132]
	str	r4, [fp, #-128]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-124]
	str	r4, [fp, #-120]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-116]
	str	r4, [fp, #-112]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-108]
	str	r4, [fp, #-104]
	mov	r3, #0
	mov	r4, #0
	str	r3, [fp, #-100]
	str	r4, [fp, #-96]
	.syntax divided
@ 90 "test-fp.c" 1
	svc #0
@ 0 "" 2
	.arm
	.syntax unified
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{r4, fp}
	bx	lr
.L3:
	.align	3
.L2:
	.word	3126736191
	.word	1078238281
	.word	1760592994
	.word	1076246755
	.word	1110808986
	.word	1066192077
	.size	_start, .-_start
	.ident	"GCC: (GNU Tools for ARM Embedded Processors 6-2017-q2-update) 6.3.1 20170620 (release) [ARM/embedded-6-branch revision 249437]"
