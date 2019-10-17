%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 5
    
    cmp eax, ebx
    jnge print
    xchg eax, ebx
    
print:
    PRINT_DEC 4, eax ; afiseaza minimul
    NEWLINE

    ret