section .data
    msg db "Loop demo", 10
    len equ $ - msg

section .bss
    buffer resb 2

section .text
    global _start

_start:
    ; print message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rcx, 1
