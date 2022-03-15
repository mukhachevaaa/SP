.data
vyvod:
        .string "%d\n"
 massiv:
        .long 128, 10, 12, 144 /* содержимое массива*/
end:
 
.text
.globl main
main:
        xorl %eax, %eax
        movl  $massiv, %ebx      /* адрес текущего элемента*/
        jmp   check  
sum_massiv:
        shrl $1, (%ebx) /*сдвиг на 1 разряд*/
        addl (%ebx), %eax /*сложили*/
        addl  $4, %ebx
        jmp check

sdvig_if_7:
        movl (%ebx), %ecx                    
        andl  $128, %ecx  
        cmpl  $128, %ecx /*проверка наличия 1 в 7 бите*/
        je    sum_massiv
        addl  $4, %ebx     /*выделили место и перешли на след.элемент*/                        
check:
        cmpl  $end, %ebx  /*последний ди элемент*/
        jne    sdvig_if_7       

        pushl %eax
        pushl $vyvod
        call  printf
        addl  $8, %esp
         movl  $0, %eax
        ret
