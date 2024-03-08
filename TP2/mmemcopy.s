.data
src:
    .string "mmemcopy"

dest:
    .space 8

.text
.globl _start 
_start:
    movq $8, %r10
    movq $dest, %r12
    movq $src, %r11

copy:
    movq (%r11), %r12
    dec %r10
    jz done
    inc %r11
    inc %r12
    jmp copy

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
