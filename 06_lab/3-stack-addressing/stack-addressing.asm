%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ; pushing a string on the stack
    sub esp, 4
    mov byte [esp], 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp], "are "
    sub esp, 4
    mov dword [esp], "Ana "
    
    PRINT_STRING [esp]
    NEWLINE
    NEWLINE
    

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
    lea eax, [ebp]
    
start:
    cmp eax, esp
    jl end
    
    PRINT_STRING "0x"
    PRINT_HEX 4, eax
    PRINT_STRING ": "
    PRINT_HEX 1, [eax]
    NEWLINE
    
    sub eax, 1
    jmp start
end:
    
    
    ; TODO 3: print the string byte by byte
    lea ecx, [esp]
    NEWLINE
    
start_string:
    cmp byte [ecx], 0
    je end_string
    
    PRINT_CHAR [ecx]
    PRINT_STRING " "
    inc ecx
    jmp start_string

end_string:
    ; TODO 4: print the array element by element
    NEWLINE
    mov eax, ecx
    mov ecx, NUM
    
start_array:
    PRINT_DEC 4, [eax]
    add eax, 4
    
    loop start_array

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
