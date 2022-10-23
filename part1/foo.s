.file	"foo.c"
	.intel_syntax noprefix          # Используем синтаксис в стиле Intel
	.text                           # Начало секции
	.local	a                       # Объявляем символ a, но не экспортируем его
	.comm	a,262144,32             # Неинициализированный массив
	.local	b                       # Объявляем символ b, но не экспортируем его
	.comm	b,262144,32             # Неинициализированный массив
	.section	.rodata             # Переходим в секцию .rodata
.LC0:                               # Метка .LC0:
	.string	"%d"                    # …прямо перед тем, как положить в файл строку "%d"
.LC1:                               # Метка .LC1:
	.string	"%d "                   # …прямо перед тем, как положить в файл строку "%d "
	.text
	.globl	main                    # Объявляем и экспортируем вовне символ main
	.type	main, @function         # отмечаем, что main это функция
main:                               # Теперь метка main:, именно её мы и экспортируем
.LFB0:                              # внутренняя метка .LBF0:
	.cfi_startproc                  # -
	endbr64                         # -
	push	rbp                     # / Пролог функции (1/3). Сохранили предыдущий rbp на стек.
	.cfi_def_cfa_offset 16          # -
	.cfi_offset 6, -16              # -
	mov	rbp, rsp                    # | Пролог функции (2/3). Вместо rbp записали rsp.
	.cfi_def_cfa_register 6         # -
	sub	rsp, 32                     # \ Пролог функции (3/3). А сам rsp сдвинули на 32 байт
	mov	rax, QWORD PTR fs:40        # / stack protection, игнорируем
	mov	QWORD PTR -8[rbp], rax      # -
	xor	eax, eax                    # Обнуляет eax
	mov	DWORD PTR -16[rbp], 0       # sum_m = 0
	mov	DWORD PTR -12[rbp], 0       # sum_p = 0
	lea	rax, -24[rbp]               # переменная n
	mov	rsi, rax                    # rsi = rax
	lea	rax, .LC0[rip]              # наша строка "%d"
	mov	rdi, rax                    # rdi = rax
	mov	eax, 0                      # Обнуляет eax
	call	__isoc99_scanf@PLT      # Вызывает функцию `scanf`
	mov	DWORD PTR -20[rbp], 0       # счётчик цикла i = 0
	jmp	.L2                         # переход к метке .L2: ниже по коду, там проверка условия цикла
.L3:                                # Метка .LC3:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20] = i
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rdx, 0[0+rax*4]             # rdx = rax * 4 — прикольные трюки с вычислением: вычисляет адрес (rax*4)[0], который равен rax*4
	lea	rax, a[rip]                 # адрес начала массива a
	add	rax, rdx                    # rax += rdx
	mov	rsi, rax                    # rsi = rax
	lea	rax, .LC0[rip]              # наша строка "%d"
	mov	rdi, rax                    # rdi = rax
	mov	eax, 0                      # Обнуляет eax
	call	__isoc99_scanf@PLT      # Вызывает функцию `scanf`
	add	DWORD PTR -20[rbp], 1       # rbp[-20] += 1 == ++i
.L2:                                # Метка .LC2:
	mov	eax, DWORD PTR -24[rbp]     # загрузка n из стека в регистр eax
	cmp	DWORD PTR -20[rbp], eax     # сравнить rbp[-20] и eax (это счетчик цикла и N)
	jl	.L3                         # если меньше, то перейти к .L3
	mov	DWORD PTR -20[rbp], 0       # rbp[-20] = 0
	jmp	.L4                         # перейти в .L4
.L7:                                # Метка .LC7:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rdx, 0[0+rax*4]             # rdx = rax * 4 — прикольные трюки с вычислением: вычисляет адрес (rax*4)[0], который равен rax*4
	lea	rax, a[rip]                 # rax = &rip[a]
	mov	eax, DWORD PTR [rdx+rax]    # eax = *(rdx + rax)
	test	eax, eax                # сравнивает eax и eax
	jns	.L5                         # переходит в .L5 если нет знака
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rdx, 0[0+rax*4]             # rdx = rax * 4 — прикольные трюки с вычислением: вычисляет адрес (rax*4)[0], который равен rax*4
	lea	rax, a[rip]                 # rax = &rip[a]
	mov	eax, DWORD PTR [rdx+rax]    # eax = *(rdx + rax)
	add	DWORD PTR -16[rbp], eax     # rbp[-16] += eax == sum_m += a[i]
	jmp	.L6                         # переход в .L6
.L5:                                # Метка .LC5:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rdx, 0[0+rax*4]             # rdx = rax * 4
	lea	rax, a[rip]                 # rax = &rip[a]
	mov	eax, DWORD PTR [rdx+rax]    # eax = *(rdx + rax)
	add	DWORD PTR -12[rbp], eax     # rbp[-12] += eax == sum_p += a[i]
.L6:                                # Метка .LC6:
	add	DWORD PTR -20[rbp], 1       # rbp[-20] += 1 (индексируем i)
.L4:                                # Метка .LC4:
	mov	eax, DWORD PTR -24[rbp]     # eax = rbp[-24]
	cmp	DWORD PTR -20[rbp], eax     # сравнение rbp[-20] и eax
	jl	.L7                         # если меньше, то перейти к .L7:
	mov	DWORD PTR -20[rbp], 0       # rbp[-20] = 0
	jmp	.L8                         # переход в .L8:
.L11:                               # метка .L11:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	and	eax, 1                      # логическое битовое И
	test	eax, eax                # сравнение eax и eax
	jne	.L9                         # переход если они различны
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rcx, 0[0+rax*4]             # rcx = rax * 4
	lea	rdx, b[rip]                 # адрес начала массива b
	mov	eax, DWORD PTR -12[rbp]     # eax = rbp[-12]
	mov	DWORD PTR [rcx+rdx], eax    # rdx[rcx] = eax
	jmp	.L10                        # переход в .L10:
.L9:                                # метка .L9:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rcx, 0[0+rax*4]             # rcx = rax * 4
	lea	rdx, b[rip]                 # адрес начала массива b
	mov	eax, DWORD PTR -16[rbp]     # eax = rbp[-16]
	mov	DWORD PTR [rcx+rdx], eax    # rdx[rcx] = eax
.L10:                               # метка .L10:
	add	DWORD PTR -20[rbp], 1       # индексация i
.L8:                                # метка .L8:
	mov	eax, DWORD PTR -24[rbp]     # eax = rbp[-24]
	cmp	DWORD PTR -20[rbp], eax     # сравниваем rbp[-20] и eax
	jl	.L11                        # если меньше, то перейти к .L11
	mov	DWORD PTR -20[rbp], 0       # rbp[-20] = 0
	jmp	.L12                        # перейти к .L12
.L13:                               # метка .L13:
	mov	eax, DWORD PTR -20[rbp]     # eax = rbp[-20]
	cdqe                            # Convert Doubleword to Qwadword — у нас был eax, стал нормальный rax, делает sign-extend
	lea	rdx, 0[0+rax*4]             # rcx = rax * 4
	lea	rax, b[rip]                 # адрес начала массива b
	mov	eax, DWORD PTR [rdx+rax]    # eax = rax[rdx]
	mov	esi, eax                    # esi = eax
	lea	rax, .LC1[rip]              # сточка "%d "
	mov	rdi, rax                    # rdi = rax
	mov	eax, 0                      # eax = 0
	call	printf@PLT              # вызов printf
	add	DWORD PTR -20[rbp], 1       # индексация i
.L12:                               # метка .L12:
	mov	eax, DWORD PTR -24[rbp]     # eax = rnp[-24]
	cmp	DWORD PTR -20[rbp], eax     # сравнене rbp[-20] и eax
	jl	.L13                        # если меньше прыгнуть в .L13
	mov	eax, 0                      # eax = 0
	mov	rdx, QWORD PTR -8[rbp]      # rdx = rbp[-8]
	sub	rdx, QWORD PTR fs:40
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:                              # Дальше идёт всякая мета-информация, она нам не очень-то и нужна.
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
