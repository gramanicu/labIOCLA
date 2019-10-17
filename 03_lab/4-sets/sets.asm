%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    mov ecx, eax
    or ecx, ebx
    PRINT_DEC 4, ecx
    NEWLINE

    ; TODO2: adaugarea unui element in multime
    or ecx, 768
    PRINT_DEC 4, ecx
    NEWLINE


    ; TODO3: intersectia a doua multimi
    mov ecx, eax
    and ecx, ebx
    PRINT_DEC 4, ecx
    NEWLINE

    ; TODO4: complementul unei multimi
    not eax
    PRINT_DEC 4, eax
    NEWLINE

    ; TODO5: eliminarea unui element
    and ebx, 168
    PRINT_DEC 4, ebx
    NEWLINE
    

    ; TODO6: diferenta de multimi EAX-EBX
    mov eax, 139
    mov edx, eax
    and edx, ebx
    xor eax, edx
    PRINT_DEC 4, eax
    NEWLINE
    
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    ret
