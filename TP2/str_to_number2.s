.data
str:
    .string "82\0"
res:
    .byte 0

.text
.globl _start 
_start:
    movq $str, %r8
    movq $res, %r9

convert:
    movq $0, %r11
    cmp %r11, (%r8)
    je done
    sub $48, (%r8)
    movq (%r8), %r10
    movq (%r9), %r11
    imul $10, %r11
    movq %r11, (%r9)
    add %r10, (%r9)
    inc %r8
    jmp convert


/*
print_r8:
    inc %r11
    sub %r11, %r8
    movq $1, %rax
    movq $0, %rdi
    movq %r8, %rsi
    movq %r11, %rdx
    syscall
*/

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
