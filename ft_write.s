;In unsigned mode, the carry flag (CF) is set at 1 if the last operation or the last syscall failed.
;So the solution was to do : JC _error (jump to error if carry flag is set on 1).

section .text
	global _ft_write
	extern ___error

_ft_write:
	mov rax, 0x02000004
	syscall
	jc error
	ret

error: 
	push rax
	call ___error
	pop rdi
	mov [rax], rdi
	mov rax, -1
	ret
