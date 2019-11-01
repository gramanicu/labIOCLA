%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
    L:
    PRINT_DEC 4, ebx
    NEWLINE
    add ebx, ebx
    cmp eax, ebx
    jge L
    

    leave
    ret
