section .data
	text db "Hello, World!", 10, 0

; text: name of memory address
; db : define bytes
; 10 : '\n'

section .text
	global _start

; input: rax as pointer to string 
; output: print string at rax
_print:
	push rax
	mov rbx, 0

_print_loop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _print_loop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall
	ret

_start:
	mov rax, text
	call _print
; syscall: when a program requests a service from the kernel
; syscalls have an ID and take arguments
; write "hello world\n" -> sys_write
; sys_write(file_descriptor, buffer, count)
; ID = 1, file_descriptor = 1 (stdout), buffer=text, count=14
; ID = rax, file_descriptor = rdi, buffer = rsi, count = rdx

	mov rax, 60
	mov rdi, 0
	syscall
; sys_exit (ID = 60, rdi = exit code, 0 if success)
