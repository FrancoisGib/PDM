.data

.text
.globl _start 
_start:
   movq $3, %rax
   movq $5, %rbx
   movq $0, %rcx 

loop:
   addq %rax, %rcx
   decq %rbx
   jz done
   jmp loop

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
