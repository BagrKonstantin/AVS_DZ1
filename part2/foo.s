	.file	"foo.c"
	.intel_syntax noprefix
	.text
	.local	a
	.comm	a,262144,32
	.local	b
	.comm	b,262144,32
	.globl	fill_array
	.type	fill_array, @function
fill_array:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -24[rbp], esi
	mov	DWORD PTR -28[rbp], edx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	and	eax, 1
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, b[rip]
	mov	eax, DWORD PTR -24[rbp]
	mov	DWORD PTR [rcx+rdx], eax
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rcx, 0[0+rax*4]
	lea	rdx, b[rip]
	mov	eax, DWORD PTR -20[rbp]
	mov	DWORD PTR [rcx+rdx], eax
.L4:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L5
	nop
	nop
	pop	rbp
	ret
	.size	fill_array, .-fill_array
	.globl	find_neg_sum
	.type	find_neg_sum, @function
find_neg_sum:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L7
.L9:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jns	.L8
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	add	DWORD PTR -4[rbp], eax
.L8:
	add	DWORD PTR -8[rbp], 1
.L7:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L9
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	ret
	.size	find_neg_sum, .-find_neg_sum
	.globl	find_pos_sum
	.type	find_pos_sum, @function
find_pos_sum:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	DWORD PTR -20[rbp], edi
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L12
.L14:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	jle	.L13
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	mov	eax, DWORD PTR [rdx+rax]
	add	DWORD PTR -4[rbp], eax
.L13:
	add	DWORD PTR -8[rbp], 1
.L12:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L14
	mov	eax, DWORD PTR -4[rbp]
	pop	rbp
	ret
	.size	find_pos_sum, .-find_pos_sum
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rax, -16[rbp]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L17
.L18:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, a[rip]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L17:
	mov	eax, DWORD PTR -16[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L18
	mov	eax, DWORD PTR -16[rbp]
	mov	edi, eax
	call	find_neg_sum
	mov	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	mov	edi, eax
	call	find_pos_sum
	mov	DWORD PTR -12[rbp], eax
	mov	edx, DWORD PTR -16[rbp]
	mov	ecx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, ecx
	mov	edi, eax
	call	fill_array
	mov	DWORD PTR -4[rbp], 0
	jmp	.L19
.L20:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, b[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L19:
	mov	eax, DWORD PTR -16[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L20
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
