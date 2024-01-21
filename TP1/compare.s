.data
false:
    .byte '0'
true:
    .byte '1'

.text
.globl _start 
_start:
    movb $1, %al
    movb $1, %DIL
    movb $1, %dl
    movq $false, %r13
    movq $true, %r14
    cmp %r13b, %r13b
    je print_true

print_false:
    movq $false, %rsi
    jmp print

print_true:
    movq $true, %rsi

print:
    syscall

done:   
    movb $60,%AL 
    xor %rdi,%rdi     
    syscall    
 
