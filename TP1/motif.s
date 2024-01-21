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
    movb $5, %r13b

init_aster_loop:
    movq $aster, %rsi
    sub $2, %r13b 
    movb $5, %r14b
    sub %r13b, %r14b
aster_loop:
    syscall
    dec %r13b
    jnz aster_loop

init_space_loop:
    movq $space, %rsi
space_loop:
    syscall
    dec %r14b
    jnz space_loop

done:   
    movb $60,%AL 
    xor %rdi,%rdi     
    syscall    
 