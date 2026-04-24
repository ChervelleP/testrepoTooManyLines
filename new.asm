section .data
    msg db "This will fail at link stage", 10
    len equ $ - msg

section .text
    global _start

_start:

    ; print message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; jump to label that does NOT exist
    jmp missing_label

    ; normal exit (never reached)
    mov rax, 60
    xor rdi, rdi
    syscall

    ; padding to exceed 60 lines
    nop
