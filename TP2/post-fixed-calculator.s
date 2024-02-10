.data
str:
    .space 32
res:
    .space 16
buffer:
    .space 16
operators:
    .byte '+'
    .byte '-'
    .byte '*'
    .byte '/'
space:
    .byte ' '
str_to_num:
    .byte 48
.text
.globl _start 
_start: 
    movq $0, %rax
    movq $0, %rdi
    movq $str, %rsi 
    movq $32, %rdx
    syscall
    movq $str, %r14
    movq $operators, %r13
    movq $res, %r11
    movq $0, %rdx

# cas 1 nombre
# cas 2 operateur
# cas 3 fin

read:
    movq $0, %r10
    movb (%r14), %r10b
    inc %r14
    cmpb $10, %r10b
    je init_cpt
    cmpb $32, %r10b
    je read
    cmpb str_to_num, %r10b /* le dernier opérateur est 47 en ascii */
    jl do_operation
    movq $0, %r9
    jmp read_number

read_number:
    cmpb space, %r10b
    je push
    subq str_to_num, %r10
    imul $10, %r9
    addb %r10b, %r9b
    movb (%r14), %r10b
    inc %r14
    jmp read_number

push:
    pushq %r9
    jmp read

do_operation: /* depile les deux nombres et jump */
    popq %r9
    popq %r8
    cmpb (%r13), %r10b
    je add
    cmpb 1(%r13), %r10b
    je sub
    cmpb 2(%r13), %r10b
    je mult
    cmpb 3(%r13), %r10b
    je div

add:
    addq %r8, %r9
    jmp push

sub:
    cmpq %r8, %r9
    je sub_equals
    jg sub_negative
    subw %r9w, %r8w /* reste stocké dans r8 et ici on doit inverser les opérandes */
    movw %r8w, %r9w
    jmp push

sub_equals:
    movq $0, %r9
    jmp push

sub_negative:
    subw %r8w, %r9w /* reste stocké dans r8 et ici on doit inverser les opérandes */
    movb $'-', (%r11)
    inc %r11
    inc %rdx
    jmp push

mult:
    imul %r8, %r9
    jmp push

div:
    movq $0, %rdx
    movq %r8, %rax
    movq %r9, %rbx
    idiv %ebx /* resultat dans rax */
    movq %rax, %r9
    jmp push

result_equals_zero:
    movq $'0', (%r11)
    inc %r11
    inc %r13
    movq %r13, %r12
    jmp add_space

init_cpt:
    popq %rax
    movq $0, %r13
    movq $buffer, %r15
    cmpl $0, %eax
    je result_equals_zero

convert_result_to_string:
    movl $10, %ebx
    cmpl $0, %eax
    je length
    movq $0, %rdx
    idiv %ebx
    movq %rdx, %r14
    addq $48, %r14
    movq %r14, (%r15)
    inc %r15
    inc %r13
    jmp convert_result_to_string

length:
    movq %r13, %r12
    addq %rdx, %r12

reverse_string:
    dec %r15
    movb (%r15), %r14b
    movb %r14b, (%r11)
    inc %r11
    dec %r13
    jnz reverse_string

add_space:
    movq $10, (%r11)
    inc %r12

print_res:
    movq $1, %rax
    movq $0, %rdi
    movq $res, %rsi
    movq %r12, %rdx
    syscall

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
