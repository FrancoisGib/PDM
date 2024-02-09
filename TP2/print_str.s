.data
str:
    .string "ça marche !\n"
space:
    .byte '\0'
res:
    .space 16

.text
.globl _start 
_start:
    movq $str, %r8
    movq $0, %r11

inc_r8:
    inc %r11
    inc %r8
    movq $space, %r10
    movq %r8, %r9
    sub %r10, %r9
    jnz inc_r8

print_r8:
    inc %r11
    sub %r11, %r8
    movq $1, %rax
    movq $0, %rdi
    movq %r8, %rsi
    movq %r11, %rdx
    syscall

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
