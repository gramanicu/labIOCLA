%include "io.inc"

%define ARRAY_SIZE      10

section .data
    byte_array db 8, -19, -12, 3, -6, 200, -128, 19, -78, 102
    print_format db "Array sum is ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    
lop:
    mov dl, byte [byte_array + ecx - 1]
    cmp dl, 0
    jg neg
poz:
    
neg:
    loop lop

    PRINT_STRING print_format
    PRINT_UDEC 4, eax
    NEWLINE

    mov ecx, ARRAY_SIZE
    xor eax, eax
    xor edx, edx

    leave
    ret
