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
	.file	"test-fp.c"
	.text
	.align	1
	.global	_start
	.syntax unified
	.thumb
	.thumb_func
	.fpu softvfp
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 152
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r7}
	sub	sp, sp, #152
	add	r7, sp, #0
	ldr	r3, .L2+16
	str	r3, [r7, #148]	@ float
	ldr	r3, .L2+20
	str	r3, [r7, #144]	@ float
	mov	r3, #0
	str	r3, [r7, #140]	@ float
	add	r3, r7, #64
	str	r3, [r7, #136]
	adr	r4, .L2
	ldrd	r3, [r4]
	strd	r3, [r7, #128]
	adr	r4, .L2+8
	ldrd	r3, [r4]
	strd	r3, [r7, #120]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #112]
	mov	r3, r7
	str	r3, [r7, #108]
	movs	r3, #4
	str	r3, [r7, #104]
	movs	r3, #0
	str	r3, [r7, #100]
	movs	r3, #8
	str	r3, [r7, #96]
	mov	r3, #0
	str	r3, [r7, #64]	@ float
	mov	r3, #0
	str	r3, [r7, #68]	@ float
	mov	r3, #0
	str	r3, [r7, #72]	@ float
	mov	r3, #0
	str	r3, [r7, #76]	@ float
	mov	r3, #0
	str	r3, [r7, #80]	@ float
	mov	r3, #0
	str	r3, [r7, #84]	@ float
	mov	r3, #0
	str	r3, [r7, #88]	@ float
	mov	r3, #0
	str	r3, [r7, #92]	@ float
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #8]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #16]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #24]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #32]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #40]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #48]
	mov	r3, #0
	mov	r4, #0
	strd	r3, [r7, #56]
	.syntax unified
@ 90 "test-fp.c" 1
	svc #0
@ 0 "" 2
	.thumb
	.syntax unified
	nop
	adds	r7, r7, #152
	mov	sp, r7
	@ sp needed
	pop	{r4, r7}
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
