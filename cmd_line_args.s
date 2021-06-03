%include "linux64.inc.asm"

section .data
	newline db 10,0

section .text
	global _start

_start:
	pop rax
	printVal rax
	print newline
	pop rax
	print rax
	print newline
	exit
