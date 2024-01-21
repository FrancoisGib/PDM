.data
msg:
    .byte '*'
space:
    .byte '\n'

.text
.globl _start 
_start:
    movb $1, %al
    movb $1, %DIL
    movq $msg, %rsi
    movb $1, %dl
    movb $5, %BL

init_r14:
    movb $5, %r14b

print_line:
    syscall
    dec %r14b
    jnz print_line

print_space:
    movq $space, %rsi
    syscall
    movq $msg, %rsi
    dec %BL
    jnz init_r14

done:   
    movb $60,%AL 
    xor %rdi,%rdi     
    syscall    
 
 /* rsi valeur, rax à 1 write, taille -> rdi, stdout */
