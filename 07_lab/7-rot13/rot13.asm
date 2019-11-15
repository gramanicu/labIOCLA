%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "ANA are m3r3", 0

section .text
global CMAIN

rot13:
    push ebp
    mov ebp, esp

    mov eax, dword [ebp+8]
sStart:
    mov bl, byte [eax]
    test bl, bl ; check string end
    jz sEnd
    
    ;check if we have a valid letter
    mov bh, 65
    cmp bl, bh ; check if char >= 'A'
    jl prepare_loop
    
    mov bh, 90
    cmp bl, bh ; check if char <= 'Z'
    jl is_good
    
    mov bh, 97
    cmp bl, bh ; check if char >= 'a'
    jl prepare_loop
    
    mov bh, 122
    cmp bl, bh ; check if char <= 'z'
    jg prepare_loop
    
is_good:
    add bl, 13 ; rotate
    xor edx, edx
    mov dl, bl
    
    ;check if we went over the interval
    mov bh, 122 ; check if char <= 'z'
    cmp bl, bh
    jg rotLW
    
    mov bh, 90 ; check if char <= 'Z'
    cmp bl, bh
    jg set_byte
    
rotUP:
    mov cl, 65
    sub bl, bh
    add cl, bl
    dec cl
    xchg cl, bl
    jmp set_byte
    
rotLW:
    mov cl, 97
    sub bl, bh
    add cl, bl
    dec cl
    xchg cl, bl
    jmp set_byte
    
set_byte:
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
    call rot13
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
