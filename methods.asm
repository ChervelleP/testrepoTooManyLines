section .text
    global _start

_start:
    mov rax, 60
    mov rdi, 5   ; exit code 5
    syscall
