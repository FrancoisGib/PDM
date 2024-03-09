.data
res:
    .space 64

.text
.global mprintf
mprintf:
    pushq %rbp
    movq %rsp, %rbp
    movq $res, %rdx
    movq $0, %r8

    read:
        movb (%rdi), %cl
        cmpb $0, %cl
        je deuxieme
        movb %cl, (%rdx)
        inc %r8
        inc %rdi
        inc %rdx
        jmp read


    deuxieme:
        cmpq $1, %r15
        je print
        movq $1, %r15
        movq %rsi, %rdi
        jmp read

    print:
        movq $1, %rax
        movq $0, %rdi
        movq $res, %rsi
        movq %r8, %rdx
        syscall

    done:
        /*subq %r8, %rbp*/
        movq %rbp, %rsp
        popq %rbp
        ret

