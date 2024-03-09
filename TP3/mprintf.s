.data
res:
    .space 64
.text
.global read_arg
read_arg:
   popq %rdi
   popq %r11
   pushq %rdi
   pushq %rbp
   movq %rsp, %rbp

   read:
      movb (%r11), %r10b
      cmpb $0, %r10b
      jle read_done
      cmpb $30, %r10b
      je read_done
      cmpb $208, %r10b
      je read_done
      cmpb $4, %r10b
      je read_done
      movb %r10b, (%rax)
      inc %r12
      inc %r11
      inc %rax
      jmp read

   read_done:
      movq %rbp, %rsp
      popq %rbp
      ret

.global mprintf
mprintf:
   pushq %rbp
   pushq %r12
   movq %rsp, %rbp
   movq $res, %rax
   movq $0, %r12

   first:
      pushq %rdi
      call read_arg
      jmp second

   second:
      pushq %rsi
      call read_arg
      jmp third

   third:
      pushq %rdx
      call read_arg
      jmp fourth

   fourth:
      pushq %rcx
      call read_arg
      jmp fifth

   fifth:
      pushq %r8
      call read_arg

   sixth:
      pushq %r9
      call read_arg

    print:
        movq $1, %rax
        movq $0, %rdi
        movq $res, %rsi
        movq %r12, %rdx
        syscall

    done:
        movq %rbp, %rsp
        popq %r12
        popq %rbp
        ret

