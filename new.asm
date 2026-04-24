; This is a simple assembly program for x86-64 Linux
; It demonstrates basic syscall usage
; The program prints "Hello, World!" to stdout and then exits

section .data
    ; Define the message to print
    msg db 'Hello, World!', 0xa
    ; Calculate the length of the message
    len equ $ - msg

    ; Additional data for demonstration
    newline db 0xa
    newline_len equ $ - newline

    ; Another message
    msg2 db 'This is another message.', 0xa
    len2 equ $ - msg2

    ; Yet another message
    msg3 db 'Assembly programming is fun!', 0xa
    len3 equ $ - msg3

    ; Counter for loop
    counter db 3

section .text
    ; Entry point
    global _start

_start:
    ; Initialize registers
    ; This is the start of the program

    ; Print the first message
    mov rax, 1          ; syscall number for write
    mov rdi, 1          ; file descriptor 1 (stdout)
    mov rsi, msg        ; pointer to message
    mov rdx, len        ; message length
    syscall

    ; Print a newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    ; Print the second message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    ; Print another newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    ; Print the third message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg3
    mov rdx, len3
    syscall

    ; Print one more newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    ; Now, let's add a simple loop to print numbers or something
    ; But to keep it simple, just repeat the first message a few times

    ; Load counter
    movzx rbx, byte [counter]  ; rbx = 3

loop_start:
    ; Check if counter is zero
    cmp rbx, 0
    je loop_end

    ; Print the message again
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; Decrement counter
    dec rbx
    jmp loop_start

loop_end:
    ; After the loop, print a final message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, len2
    syscall

    ; Exit the program
    mov rax, 60         ; syscall number for exit
    xor rdi, rdi        ; exit code 0
    syscall

; End of the program
; This should be over 40 lines now

