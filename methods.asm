section .bss
    buffer resb 2

section .text
    global _start

_start:
    mov rcx, 1

loop_start:
    mov rax, rcx
    add rax, '0'
    mov [buffer], al
    mov byte [buffer+1], 10

    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 2
    syscall

    inc rcx
    cmp rcx, 4
    jne loop_start

    mov rax, 60
    xor rdi, rdi
    syscall
