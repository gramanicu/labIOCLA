%include "io.inc"

section .data
    string db "Lorem ipsum dolor siit amet.ii", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'i'

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
    cld
    xor al, al
    mov edi, string
    repne scasb
    
    sub edi, string
    dec edi
        
    ; TODO1: save the result in at address length
    mov [length], edi

    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE

    ; TODO2: compute the number of occurences
    mov al, [char]
    mov edi, string
    xor ebx, ebx
    mov ecx, [length]
    inc ecx
    cld
start:
    repne scasb
    test ecx, ecx
    je not_found
    inc ebx
    test ecx, ecx
    jne start
not_found:
    
    ; TODO2: save the result in at address occurences
    mov [occurences], ebx
    
    ; print the number of occurences of the char
    PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE

    xor eax, eax
    leave
    ret
