%include "linux64.inc.asm"

section .data
	filename db "myfile.txt", 0
	content db "This is the file's content", 10

section .text
	global _start

_start:
	; open the file
	mov rax, SYS_OPEN
	mov rdi, filename
	mov rsi, O_CREAT+O_WRONLY ; mode
	mov rdx, 0644o ; permissions (o at the end: octal)
	syscall

	; write to the file
	push rax ; rax contains the file descriptor
	; push it to the stack, we will pop it when closing the file
	mov rdi, rax ; instead of stdin, stdout or stderr, we use the fd in rax
	mov rax, SYS_WRITE
	mov rsi, content
	mov rdx, 27
	syscall

	; close the file
	mov rax, SYS_CLOSE
	pop rdi
	syscall

	exit
