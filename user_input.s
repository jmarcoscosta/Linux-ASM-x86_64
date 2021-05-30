section .data
	text1 db "What is your name?", 10 ;lenght = 19 
	text2 db "Hello, " ;length = 7

; text: name of memory address
; db : define bytes
; 10 : '\n'

; .bss used to reserve data for future use
section .bss
	user_name resb 16
; resb 16: reserve 16 bytes

section .text
	global _start

_print_text_1:
	mov rax, 1
	mov rdi, 1
	mov rsi, text1
	mov rdx, 19
	syscall
	ret

_print_text_2:
	mov rax, 1
	mov rdi, 1
	mov rsi, text2
	mov rdx, 7
	syscall
	ret

_print_name:
	mov rax, 1
	mov rdi, 1
	mov rsi, user_name
	mov rdx, 16
	syscall
	ret

_get_name:
	mov rax, 0
	mov rdi, 0
	mov rsi, user_name
	mov rdx, 16
	syscall
	ret
_start:
	call _print_text_1
	call _get_name
	call _print_text_2
	call _print_name
	call _exit

_exit:
	mov rax, 60
	mov rdi, 0
	syscall
; sys_exit (ID = 60, rdi = exit code, 0 if success)
