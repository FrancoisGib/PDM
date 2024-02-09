.data
str:
    .string "5"
str_to_num:
    .byte 48

.text
.globl _start 
_start:
    movq $str, %r8
    movq $str_to_num, %r10
    subq %r10, (%r8)
    addq $3, (%r8)
    addq $str_to_num, (%r8)
    movq $1, %rax
    movq $0, %rdi
    movq %r8, %rsi
    movq $1, %rdx
    syscall

    

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
