%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx, 0
    mov ecx, 1

    cmp eax, 0
    je finish

start:
    sub eax, 1
    xchg ebx, ecx
    add ecx, ebx 
    
    cmp eax, 0
    jg start
    
finish:
    PRINT_DEC 4, ebx
    NEWLINE
    
    ret