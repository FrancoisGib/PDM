.data
str:
    .string "4321"
res:
    .int 0

.text
.globl _start 
_start:
    movq $res, %r8
    movq $str, %r10

convert:
    cmp $0, (%r10)
    je store
    imul $10, %r9
    subq $48, (%r10)
    addb (%r10), %r9b
    inc %r10
    jmp convert

store:
    movq %r9, (%r8)

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
