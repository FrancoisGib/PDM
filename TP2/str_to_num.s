.data
str:
    .string "523\n"
newline:
    .byte '\n'
number:
    .space 1
str_to_num:
    .long 0

.text
.globl _start 
_start:
    movq $str, %r8
    movq $number, %r9
    movq $str_to_num, %r12
    movq $0, %r10
    movw $10, %ax

convert_to_number:
    movq (%r8), %r9
    sub $48, %r9
    /* movq %r11, %r9 */
    /* inc %r10 */
    /* mul (%r9) */
    /* inc %r8 */
    movq %r10, %r13
    /* subq $newline, %r13 */
    /* jnz convert_to_number */
    
print:
    mul %r9
    movw %ax, %r9w
    /* add $4, %r9 */
    /* inc %r9 */
    /* add $48, %r9 */
    /* movq $number, %r10 */
    /* str %r9, %r10 */
    movq %r9, %rsi
    movq $1, %rax
    movq $1, %rdi
    movq $1, %rdx
    syscall

done:
    movq $60,%rax 
    xor %rdi,%rdi     
    syscall     
