.data

.text
.global length
length:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    movq 24(%rbp), %rax
    movq $0, %rbx
    read:
        movb (%rax), %cl
        inc %rax
        cmpb $0, %cl
        je done
        inc %rbx
        jmp read
    done:
        movq $1, %rax
        movq $0, %rdi
        movq 24(%rbp), %rsi
        movq %rbx, %rdx
        syscall
        movq %rbx, %rax
        popq %rbx
        movq %rbp, %rsp
        popq %rbp
        ret

