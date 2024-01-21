.data
aster:
    .byte '*'
space:
    .byte ' '
jump:
    .byte '\n'

.text
.globl _start 
_start:
    movb $1, %al
    movb $1, %DIL
    movb $1, %dl
    movb $5, %BL
    movb $100, %r13b
    movb $100, %r15b

init_aster_loop:
    movq $aster, %rsi
    movb $100, %r13b
    sub %r15b, %r13b
    add $1, %r13b

aster_loop:
    syscall
    dec %r13b
    jnz aster_loop

    movq $jump, %rsi
    syscall
    dec %r15b
    jnz init_aster_loop

done:   
    movb $60,%AL 
    xor %rdi,%rdi     
    syscall    
 