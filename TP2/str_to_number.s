.data
number:
    .string "523\n"
newline:
    .byte '\n'

.text
.globl _start 
_start:
    movq $number, %rbx
    movq $1, %rax
    movq $1, %rdi
    movq $1, %rdx
    movq $newline, %r8

loop:
    movq (%rbx), %rsi
    sub (%rsi), %r8
    jz done

next:
    add (%rsi), %r8
    inc %rsi
    jmp loop

done:
    movq $4, %r9
    sub %, %r9
    movq %r9, %rsi
    syscall
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
