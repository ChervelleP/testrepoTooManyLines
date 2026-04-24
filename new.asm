section .data
    msg db 'Hello, World!', 0xa
    len equ $ - msg

section .text
    global _start

_start:
    ; Write the message to stdout
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, msg        ; pointer to message
    mov rdx, len        ; message length
    syscall

    ; Exit the program
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit code 0
    syscall