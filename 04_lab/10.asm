%include "io.inc"

%define ARRAY_SIZE      10

section .data
    byte_array db 8, 19, 12, 3, 6, 200, 128, 19, 78, 102
    print_format db "Array sum is ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    leave
    ret
