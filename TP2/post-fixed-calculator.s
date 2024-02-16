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

.globl addition
.type addition, @function
addition:
    push %rbp /* sauvegarde pointeur base */
    movq %rsp, %rbp
    push %rbx /* sauvegarde des registres */
    movq 16(%rbp), %r8
    movq 24(%rbp), %r9
    addq %r8, %r9
    popq %rbx /* on restaure les registres */
    movq %rbp, %rsp /* restauration pointeur base */
    popq %rbp
    ret

.globl soustraction
.type soustraction, @function
soustraction:
    push %rbp /* sauvegarde pointeur base */
    movq %rsp, %rbp
    push %rbx /* sauvegarde des registres */
    movq 16(%rbp), %r8
    movq 24(%rbp), %r9
    subq %r8, %r9 /* reste stocké dans r8 et ici on doit inverser les opérandes */
    movq %r9, %rax
    popq %rbx /* on restaure les registres */
    movq %rbp, %rsp /* restauration pointeur base */
    popq %rbp
    ret
   
.globl multiplication
.type multiplication, @function
multiplication:
    push %rbp /* sauvegarde pointeur base */
    movq %rsp, %rbp
    push %rbx /* sauvegarde des registres */
    movq 16(%rbp), %r8
    movq 24(%rbp), %r9
    imul %r8, %r9
    popq %rbx /* on restaure les registres */
    movq %rbp, %rsp /* restauration pointeur base */
    popq %rbp
    ret    

.globl division
.type division, @function
division:
    push %rbp /* sauvegarde pointeur base */
    movq %rsp, %rbp
    push %rbx /* sauvegarde des registres */
    movq 16(%rbp), %rbx
    movq 24(%rbp), %rax
    idiv %ebx /* resultat dans rax */
    movq %rax, %r9
    popq %rbx /* on restaure les registres */
    movq %rbp, %rsp /* restauration pointeur base */
    popq %rbp
    ret

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

read:
    movq $0, %r10
    movb (%r14), %r10b
    inc %r14
    cmpb $10, %r10b
    je init_cpt
    cmpb space, %r10b
    je read
    cmpb str_to_num, %r10b /* le dernier opérateur est 47 en ascii */
    jl do_operation
    movq $0, %r9
    jmp read_number

read_number:
    subq str_to_num, %r10
    imul $10, %r9
    addb %r10b, %r9b
    movq $0, %r10 /* sans le reset, la multiplication par 10 ne fonctionne pas */
    movb (%r14), %r10b
    cmpb str_to_num, %r10b /* de base je faisait que pour les espaces mais c'est mieux juste de vérifier que ce n'est pas un chiffre car on peut enlever
                            maintenant enlever les espaces */
    jl push_number
    inc %r14
    jmp read_number

push_number:
    pushq %r9
    jmp read

neg:
    movb $'-', (%r11)
    movq $1, %r8
    inc %r11
    inc %r12
    movq $4294967296, %r10
    subq $1, %r10
    subq $1, %rax
    xor %r10, %rax
    jmp init

do_operation: /* depile les deux nombres et jump */
    cmpb (%r13), %r10b
    je add
    cmpb 1(%r13), %r10b
    je sub
    cmpb 2(%r13), %r10b
    je mul
    cmpb 3(%r13), %r10b
    je div

add:
    call addition
    jmp push_number

sub:
    call soustraction
    jmp push_number

mul:
    call multiplication
    jmp push_number

div:
    call division
    jmp push_number

result_equals_zero:
    movq $'0', (%r11)
    inc %r11
    inc %r13
    movq %r13, %r12
    jmp add_space

init_cpt:
    popq %rax
    cmpq $0, %rax
    jl neg

init:
    movq $0, %r13
    movq $buffer, %r15
    cmpl $0, %eax
    je result_equals_zero
    jmp convert_result_to_string
    

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


