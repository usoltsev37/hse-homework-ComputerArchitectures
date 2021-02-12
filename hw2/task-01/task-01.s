    .global print_hello
    .extern puts
    .extern fputs 

    .section .rodata
.Begin_str:
    .asciz "Welcome, "
.End_str:
    .asciz ", to the assembly world!" 

    .text
print_hello:
    movq   %rdi,%rbx

    movq   stdout, %rsi
    movq   $.Begin_str, %rdi
    call   fputs

    movq   stdout, %rsi
    movq   %rbx,%rdi
    call   fputs

    movq   stdout, %rsi
    movq   $.End_str, %rdi
    call   fputs

    ret
