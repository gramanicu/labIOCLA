%include "io.inc"

section .data
    wrong: db 'Not today, son.',0
    right: db 'Well done!',0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov eax, 0x1
    mov ebx, 0x4
    mov ecx, 0x5
    cmp eax, ebx
    jns bad         ; Go bad if eax > ebx
    cmp ecx, ebx
    jb bad          ; Go bad if ebx > ecx
    add eax, ebx
    xor eax, ecx
    jnz bad         ; Go bad if eax + ebx != ecx
good:
    PRINT_STRING right
    NEWLINE
    ret             ; To stop here if it's good ^_^
bad:
    PRINT_STRING wrong
    NEWLINE
    ret
