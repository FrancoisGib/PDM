.data
res:
    .space 64

.text
.global mprintf
mprintf:
    pushq %rbp
    movq %rsp, %rbp
    pushq %rbx
    movq 16(%rbp), %rax
    movq 24(%rbp), %rbx
    movq $0, %r8
    movq $res, %rdx
    read:
        movb (%rax), %cl
        cmpb $'%', %cl
        je percent
        cmpb $0, %cl
        je print
        movb %cl, (%rdx)
        inc %rdx
        inc %r8
        inc %rax
        jmp read

    percent:
        inc %rax
        movb (%rax), %cl
        cmpb $'s', %cl
        inc %rax
        je string

    string:
        movb (%rbx), %cl
        inc %rbx
        cmpb $0, %cl
        je read
        inc %r8
        movb %cl, (%rdx)
        inc %rdx
        inc %r8
        jmp string

    print:
        movq $1, %rax
        movq $0, %rdi
        movq $res, %rsi
        movq %r8, %rdx
        syscall

    done:
        popq %rbx
        movq %rbp, %rsp
        popq %rbp
        ret

