.data
N:
    .byte 4
res:
    .space 5

.text
.globl _start 
_start:

read_keyboard:
    movq $0, %rax
    movq $0, %rdi
    movq $res, %rsi 
    movq N, %rdx
    syscall

print:
    movq $res, %r8
    movq $4, %r10
    add %r10, %r8
    movq $10, (%r8)
    sub %r10, %r8
    movq %r8, %rsi
    movq $1, %rax
    movq $1, %rdi
    inc %rdx
    syscall

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
