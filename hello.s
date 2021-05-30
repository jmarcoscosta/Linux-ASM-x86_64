section .data
	text db "Hello, World!", 10

; text: name of memory address
; db : define bytes
; 10 : '\n'

section .text
	global _start

_start:
	mov rax, 1
	mov rdi, 1
	mov rsi, text
	mov rdx, 13
	syscall
; syscall: when a program requests a service from the kernel
; syscalls have an ID and take arguments
; write "hello world\n" -> sys_write
; sys_write(file_descriptor, buffer, count)
; ID = 1, file_descriptor = 1 (stdout), buffer=text, count=14
; ID = rax, file_descriptor = rdi, buffer = rsi, count = rdx

	mov rax, 60
	mov rdi, 0
	syscall
