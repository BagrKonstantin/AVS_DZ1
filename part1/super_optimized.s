.LC0:
        .string "%d"
.LC1:
        .string "%d "
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-8], 0
        mov     DWORD PTR [rbp-12], 0
        lea     rax, [rbp-16]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        sal     rax, 2
        add     rax, OFFSET FLAT:a
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-16]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L3
        mov     DWORD PTR [rbp-4], 0
        jmp     .L4
.L7:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR a[0+rax*4]
        test    eax, eax
        jns     .L5
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR a[0+rax*4]
        add     DWORD PTR [rbp-8], eax
        jmp     .L6
.L5:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR a[0+rax*4]
        add     DWORD PTR [rbp-12], eax
.L6:
        add     DWORD PTR [rbp-4], 1
.L4:
        mov     eax, DWORD PTR [rbp-16]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L7
        mov     DWORD PTR [rbp-4], 0
        jmp     .L8
.L11:
        mov     eax, DWORD PTR [rbp-4]
        and     eax, 1
        test    eax, eax
        jne     .L9
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     edx, DWORD PTR [rbp-12]
        mov     DWORD PTR b[0+rax*4], edx
        jmp     .L10
.L9:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     edx, DWORD PTR [rbp-8]
        mov     DWORD PTR b[0+rax*4], edx
.L10:
        add     DWORD PTR [rbp-4], 1
.L8:
        mov     eax, DWORD PTR [rbp-16]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L11
        mov     DWORD PTR [rbp-4], 0
        jmp     .L12
.L13:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     eax, DWORD PTR b[0+rax*4]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    printf
        add     DWORD PTR [rbp-4], 1
.L12:
        mov     eax, DWORD PTR [rbp-16]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L13
        mov     eax, 0
        leave
        ret
