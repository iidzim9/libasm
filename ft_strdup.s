;rdi -> used topass 1st arg to function (64 bits)
;rsi -> used topass 2nd arg to function (64 bits)
;Syscall return to rax negative value if failed and sets errno to indicate the error
section .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_strcpy
    extern _malloc

_ft_strdup:
    call _ft_strlen
    cmp rax, 0
    inc rax         ;length + 1 --> '\0' at the end of str
    push rdi        ;mov str to the stack(1st arg)
    mov rdi, rax    ;move the length of str to rdi (will be used by malloc)
    call _malloc
    cmp rax, 0      ;check return value of malloc 
    je error        ;jump if the pointer equals null
    pop rdi         
    mov rsi, rdi    ;move str to rsi(2nd arg)
    mov rdi, rax    ;move the @ of the memory allocated by malloc
    call _ft_strcpy
    ret

error:
    ret
