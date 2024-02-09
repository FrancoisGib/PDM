.data
str:
    .string "52"
str_to_num:
    .byte 48
end:
    .byte 0
res:
    .byte 0

.text
.globl _start 
_start:
    movq $str, %r8
    movq $res, %r9

convert:
    sub $end, (%r8)
    jz done
    add $end, (%r8)
    sub $str_to_num, (%r8)
    add %r8, %r9
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
