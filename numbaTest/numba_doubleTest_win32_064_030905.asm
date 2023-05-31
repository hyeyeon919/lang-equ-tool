	.text
	.file	"<string>"
	.globl	_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx
	.p2align	4, 0x90
	.type	_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx,@function
_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx:
	addq	%r9, %r8
	addq	%r8, %r8
	movq	%r8, (%rcx)
	xorl	%eax, %eax
	retq
.Lfunc_end0:
	.size	_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, .Lfunc_end0-_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx

	.globl	_ZN7cpython8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx
	.p2align	4, 0x90
	.type	_ZN7cpython8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx,@function
_ZN7cpython8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rsi
	.cfi_def_cfa_offset 40
	pushq	%rdi
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %rdi, -48
	.cfi_offset %rsi, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdx, %rcx
	leaq	56(%rsp), %rax
	movq	%rax, 40(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 32(%rsp)
	movabsq	$.const.doubleTest, %rdx
	movabsq	$PyArg_UnpackTuple, %rax
	movl	$2, %r8d
	movl	$2, %r9d
	callq	*%rax
	testl	%eax, %eax
	je	.LBB1_1
	movabsq	$_ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, %rax
	cmpq	$0, (%rax)
	je	.LBB1_4
	movq	64(%rsp), %rcx
	movabsq	$PyNumber_Long, %rbx
	callq	*%rbx
	movabsq	$PyLong_AsLongLong, %r15
	movabsq	$Py_DecRef, %r14
	testq	%rax, %rax
	je	.LBB1_6
	movq	%rax, %rdi
	movq	%rax, %rcx
	callq	*%r15
	movq	%rax, %r12
	movq	%rdi, %rcx
	callq	*%r14
	movabsq	$PyErr_Occurred, %rsi
	callq	*%rsi
	testq	%rax, %rax
	jne	.LBB1_1
.LBB1_9:
	movq	56(%rsp), %rcx
	callq	*%rbx
	testq	%rax, %rax
	je	.LBB1_10
	movq	%rax, %rbx
	movq	%rax, %rcx
	callq	*%r15
	movq	%rax, %rdi
	movq	%rbx, %rcx
	callq	*%r14
	callq	*%rsi
	testq	%rax, %rax
	jne	.LBB1_1
.LBB1_13:
	movabsq	$PyEval_SaveThread, %rax
	callq	*%rax
	movq	%rax, %rbx
	movq	$0, 48(%rsp)
	movabsq	$_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, %rax
	leaq	48(%rsp), %rcx
	movq	%r12, %r8
	movq	%rdi, %r9
	callq	*%rax
	movq	48(%rsp), %rsi
	movabsq	$PyEval_RestoreThread, %rax
	movq	%rbx, %rcx
	callq	*%rax
	movabsq	$PyLong_FromLongLong, %rax
	movq	%rsi, %rcx
	callq	*%rax
.LBB1_2:
	addq	$72, %rsp
	popq	%rbx
	popq	%rdi
	popq	%rsi
	popq	%r12
	popq	%r14
	popq	%r15
	retq
.LBB1_4:
	movabsq	$PyExc_RuntimeError, %rcx
	movabsq	$".const.missing Environment: _ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx", %rdx
	movabsq	$PyErr_SetString, %rax
	callq	*%rax
.LBB1_1:
	xorl	%eax, %eax
	jmp	.LBB1_2
.LBB1_6:
	xorl	%r12d, %r12d
	movabsq	$PyErr_Occurred, %rsi
	callq	*%rsi
	testq	%rax, %rax
	je	.LBB1_9
	jmp	.LBB1_1
.LBB1_10:
	xorl	%edi, %edi
	callq	*%rsi
	testq	%rax, %rax
	je	.LBB1_13
	jmp	.LBB1_1
.Lfunc_end1:
	.size	_ZN7cpython8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, .Lfunc_end1-_ZN7cpython8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx
	.cfi_endproc

	.globl	cfunc._ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx
	.p2align	4, 0x90
	.type	cfunc._ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx,@function
cfunc._ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx:
	subq	$40, %rsp
	movq	%rcx, %r8
	movq	$0, 32(%rsp)
	movabsq	$_ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, %rax
	leaq	32(%rsp), %rcx
	movq	%rdx, %r9
	callq	*%rax
	movq	32(%rsp), %rax
	addq	$40, %rsp
	retq
.Lfunc_end2:
	.size	cfunc._ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx, .Lfunc_end2-cfunc._ZN8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx

	.type	.const.doubleTest,@object
	.section	.rodata,"a",@progbits
.const.doubleTest:
	.asciz	"doubleTest"
	.size	.const.doubleTest, 11

	.type	_ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx,@object
	.comm	_ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx,8,8
	.type	".const.missing Environment: _ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx",@object
	.p2align	4
".const.missing Environment: _ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx":
	.asciz	"missing Environment: _ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx"
	.size	".const.missing Environment: _ZN08NumbaEnv8__main__10doubleTestB2v1B40c8tJTIcFKzyF2ILShI4CrgQElQb6HcpCSitgEU0AExx", 106

	.section	".note.GNU-stack","",@progbits
