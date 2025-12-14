EXPECTED_MINUTES_IN_OVEN equ 40

section .text

global expected_minutes_in_oven
expected_minutes_in_oven:
    mov rax, EXPECTED_MINUTES_IN_OVEN
    ret

global remaining_minutes_in_oven
remaining_minutes_in_oven:
    call expected_minutes_in_oven
    sub rax, rdi
    ret

global preparation_time_in_minutes
preparation_time_in_minutes:
    lea rax, [rdi * 2]
    ret

global elapsed_time_in_minutes
elapsed_time_in_minutes:
    call preparation_time_in_minutes
    add rax, rsi
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
