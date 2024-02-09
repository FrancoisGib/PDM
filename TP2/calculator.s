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
    movq (%r14), %r10

read_first_number:
    movq (%r14), %r10
    cmpb space, %r10b
    je pass_space_before_second_argument
    imul $10, %r8
    subq str_to_num, %r10
    addb %r10b, %r8b
    inc %r14
    jmp read_first_number

pass_space_before_second_argument:
    inc %r14

read_second_number:
    movq (%r14), %r10
    cmpb space, %r10b
    je pass_space_before_operator
    imul $10, %r9
    subq str_to_num, %r10
    addb %r10b, %r9b
    inc %r14
    jmp read_second_number

pass_space_before_operator:
    inc %r14

handle_operator:
    movq (%r14), %r10
    cmpb 0(%r13), %r10b
    je add
    cmpb 1(%r13), %r10b
    je sub
    cmpb 2(%r13), %r10b
    je mult
    cmpb 3(%r13), %r10b
    je div

add:
    addq %r8, %r9
    jmp init_cpt

sub:
    cmpw %r9w, %r8w
    je sub_equals
    subw %r9w, %r8w /* reste stocké dans r8 et ici on doit inverser les opérandes */
    movw %r8w, %r9w
    jmp init_cpt

sub_equals:
    movq $res, %r9
    movb $'0', (%r9)
    movq $1, %r12
    inc %r9
    jmp add_space

mult:
    imul %r8, %r9
    jmp init_cpt

div:
    movq $0, %rdx
    movq %r8, %rax
    movq %r9, %rbx
    idiv %ebx /* resultat dans rax */
    movq %rax, %r9

init_cpt:
    movq %r9, %rax
    movq $0, %r13
    movq $res, %r9
    movq $buffer, %r15

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

reverse_string:
    dec %r15
    movb (%r15), %r14b
    movb %r14b, (%r9)
    inc %r9
    dec %r13
    jnz reverse_string

add_space:
    movq $10, (%r9)
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
