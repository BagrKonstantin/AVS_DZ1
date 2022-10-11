	.file	"code.c"
	.text
	.local	a
	.comm	a,262144,32
	.local	b
	.comm	b,262144,32
	.section	.rodata
.LC0:
	.string	"%d"
.LC1:
	.string	"%d "
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -16(%rbp)
	movl	$0, -12(%rbp)
	leaq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -20(%rbp)
.L2:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L3
	movl	$0, -20(%rbp)
	jmp	.L4
.L7:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	testl	%eax, %eax
	jns	.L5
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	%eax, -16(%rbp)
	jmp	.L6
.L5:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	a(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	%eax, -12(%rbp)
.L6:
	addl	$1, -20(%rbp)
.L4:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L7
	movl	$0, -20(%rbp)
	jmp	.L8
.L11:
	movl	-20(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L9
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	jmp	.L10
.L9:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	b(%rip), %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
.L10:
	addl	$1, -20(%rbp)
.L8:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L11
	movl	$0, -20(%rbp)
	jmp	.L12
.L13:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	b(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -20(%rbp)
.L12:
	movl	-24(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L13
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
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
