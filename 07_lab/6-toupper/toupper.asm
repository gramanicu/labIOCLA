%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "A2Cd4f6h8j", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp+8]
sStart:
    mov bl, byte [eax]
    test bl, bl ; check string end
    jz sEnd
    
    mov bh, 97
    cmp bh, bl ; check if char >= 'a'
    jg prepare_loop
    
    mov bh, 122
    cmp bh, bl ; check if char <= 'z'
    jl prepare_loop
    
    sub bl, 0x20
    mov byte [eax], bl
    
prepare_loop:   
    inc eax
    jmp sStart
    
sEnd:
    leave
    ret

CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
