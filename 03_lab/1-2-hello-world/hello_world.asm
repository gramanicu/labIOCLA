%include "io.inc"

section .data
    myString: db "Hello, World!",0
    otherString: db "Goodbye, World!",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 1
    mov ebx, 0
    cmp eax, ebx
    jg print
    ret
print:
    sub ecx, 1
    PRINT_STRING myString
    NEWLINE
    cmp ecx, 0
    jne print

    PRINT_STRING otherString
    NEWLINE
    
    ret
