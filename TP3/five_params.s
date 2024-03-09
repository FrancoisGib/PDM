.data
res:
    .space 64

.text
.global five_params
five_params:
    pushq %rbp
    movq %rsp, %rbp
    movq $res, %rax
    movq $0, %r9

    first:
        movb (%rdi), %r10b
        cmpb $0, %r10b
        je second
        movb %r10b, (%rax)
        inc %r9
        inc %rdi
        inc %rax
        jmp first

    second:
        movb (%rsi), %r10b
        cmpb $0, %r10b
        je third
        movb %r10b, (%rax)
        inc %r9
        inc %rsi
        inc %rax
        jmp second

    third:
        movb (%rdx), %r10b
        cmpb $0, %r10b
        je fourth
        movb %r10b, (%rax)
        inc %r9
        inc %rdx
        inc %rax
        jmp third

    fourth:
        movb (%rcx), %r10b
        cmpb $0, %r10b
        je fifth
        movb %r10b, (%rax)
        inc %r9
        inc %rcx
        inc %rax
        jmp fourth

    fifth:
        movb (%r8), %r10b
        cmpb $0, %r10b
        je print
        movb %r10b, (%rax)
        inc %r9
        inc %r8
        inc %rax
        jmp fifth

    print:
        movq $1, %rax
        movq $0, %rdi
        movq $res, %rsi
        movq %r9, %rdx
        syscall

    done:
        movq %rbp, %rsp
        popq %rbp
        ret

