    .global checkPrime
    .global product_of_min_and_max_primes
    .global mySqrt
    .extern puts

    .text
False:
    mov $0, %rax
    jmp return

True:
    mov $1, %rax
    jmp return


checkPrime:
    cmp $0, %rdi
    je False
    cmp $1, %rdi
    je False
    cmp $2, %rdi
    je True
    cmp $3, %rdi
    je True

    call mySqrt
    mov %rax, %r10
    add $1, %r10
forPrime:
    sub $1, %r10

    cmp $1, %r10
    je True

    mov $0, %rdx
    mov %rdi, %rax
    div %r10

    cmp $0, %rdx
    je False

    jmp forPrime


product_of_min_and_max_primes:
    push %r8
    mov  %rdi, %r10
    mov $0, %r8
    mov $4294967294, %r15
forProduct:
    cmp $0, %rsi
    je sizeZero

    push %r10 
    mov (%r10), %edi
    call checkPrime
    pop %r10

    cmp $0, %rax
    je continue

    cmp %rdi, %r8
    jge nxt
    mov %rdi, %r8
nxt:
    cmp %rdi, %r15
    jle continue
    mov %rdi, %r15
continue:
    add $4, %r10
    sub $1, %rsi
    jmp forProduct

sizeZero:
    mov %r15, %rax
    mul %r8
    pop %r8
    jmp return


mySqrt:
    mov $0, %rax
forSqrt:
    push %rax
    mov %rax, %rdx
    mul %rdx
    mov %rax, %rdx
    pop %rax

    cmp %rdi, %rdx
    jge return

    add $1, %rax
    jmp forSqrt

return:
    ret

 