.data
msg:
    .byte '*'
space:
    .byte '\n'

.text
.globl _start 
_start:
    movq $1, %rax
    movq $1, %rdi
    movq $msg, %rsi
    movq $1, %rdx
    movq $5, %r13

init_r14:
    movq $5, %r14

print_line:
    syscall
    dec %r14
    jnz print_line

print_space:
    movq $space, %rsi
    syscall
    movq $msg, %rsi
    dec %r13
    jnz init_r14

done:   
    mov $60,%rax 
    xor %rdi,%rdi     
    syscall    
 
 /* rsi valeur, rax à 1 write, taille -> rdi, stdout */
