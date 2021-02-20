    .global write_to_file
    .extern strlen

    .text
fail_not_close_file: 
    movq %r8, %rdi
    movq $0, %rax 
    ret 

write_to_file: 
    movq %rsi, %r8

    movq $0644, %rdx 
    movq $2, %rax 
    movq $01101, %rsi 
    syscall 
 
    cmp $0, %rax 
    jl fail_not_close_file 

    movq %r8, %rdi
    pushq %rdi 
    pushq %rax 
    call strlen 

    movq %rax, %rdx
    movq $1, %rax
    popq %rdi
    popq %rsi 
    syscall 

    cmp %rax, %rdx
    je write_success 
    jmp write_fail 

write_success:
    movq $3, %rax
    syscall
    pushq $1

    cmp $0, %rax
    je сlose_success
    jmp сlose_fail

write_fail:
    movq $3, %rax
    syscall
    pushq $0

    cmp $0, %rax
    je сlose_success
    jmp сlose_fail

сlose_success:
    popq %rax 
    ret

сlose_fail:
    movq $0, %rax 
    popq %r8
    ret
