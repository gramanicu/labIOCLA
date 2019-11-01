%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    mov eax, 0
    mov ebx, 1

    mov ecx, [N]
    cmp ecx, 0
    je finish

start:
    xchg eax, ebx
    add ebx, eax 
    
    loop start
    
finish:

    xchg eax, ebx
    sub eax, 1     ; Sum of the first N fibonnaci numbers is the n+2 number - 1
    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, eax

    xor eax, eax
    leave
	ret
