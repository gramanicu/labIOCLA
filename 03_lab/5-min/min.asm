%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 6
    mov ebx, 7
    
    cmp eax, ebx
    jl print
    xchg eax, ebx
    
print:
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE

    ret