.data
res:
    .space 1

.text
.globl _start 
_start:

read_keyboard:
    movq $0, %rax
    movq $0, %rdi
    movq $res, %rsi 
    movq $1, %rdx
    syscall

print:
    movq $1, %rax
    movq $1, %rdi
    syscall

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
