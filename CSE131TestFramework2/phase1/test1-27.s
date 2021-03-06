! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     i,j,k
i:              .word        10          
j:              .word        2           
k:              .word        0           
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " "         
str_6:          .asciz       " "         
str_7:          .asciz       " "         
str_8:          .asciz       " "         
str_9:          .asciz       " "         
globalInit_:    .word        0           

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     
arrayOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d)."

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
/* line number 6*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 6*/
/* Loading j to %l1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 6*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 6*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Storing variable int / int into k */
    set         k, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 12*/
/* setting a = 20 */
    set         20, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* line number 13*/
/* setting b = 5 */
    set         5, %l0
    st          %l0, [%fp-12]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
/* line number 13*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 13*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 14*/
/* setting c = int / int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading i to %l1 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 14*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 15*/
/* setting d = int / int */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 15*/
/* Done. */
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Loading 2 to %l1 */
    set         2, %l1
/* line number 15*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 15*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 17*/
/* setting e = int / int */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 17*/
/* Loading k to %o1 */
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 17*/
/* Loading c to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int d */
    set         _intFmt, %o0
/* line number 17*/
/* Loading d to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int e */
    set         _intFmt, %o0
/* line number 17*/
/* Loading e to %o1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading 30 to %l0 */
    set         30, %l0
/* line number 17*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 17*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 17*/
/* Printing int int / int */
    set         _intFmt, %o0
/* line number 17*/
/* Loading int / int to %o1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 17*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 19*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 19*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Storing variable int + int into a */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -44, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading 4 to %l1 */
    set         4, %l1
/* line number 20*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 20*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 20*/
/* Storing variable Validating int and int as an IntegerType for operator: %...
 into b */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -48, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading 103 to %l0 */
    set         103, %l0
/* line number 21*/
/* Loading 26 to %l1 */
    set         26, %l1
/* line number 21*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 21*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
! --storing constant c with value 25.0
    set         -20, %l0
    add         %fp, %l0, %l0
    set         25, %l1
    st          %l1, [%l0]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading c to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading a to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 22*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 22*/
/* Storing variable Validating int and int as an IntegerType for operator: %...
 into d */
    set         -28, %l5
    add         %fp, %l5, %l5
    set         -56, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 24*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 24*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 24*/
/* Loading b to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 24*/
/* Loading c to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing int d */
    set         _intFmt, %o0
/* line number 24*/
/* Loading d to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading e to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading 4 to %l1 */
    set         4, %l1
/* line number 24*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 24*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 24*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 24*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading 22 to %l0 */
    set         22, %l0
/* line number 24*/
/* Loading 14 to %l1 */
    set         14, %l1
/* line number 24*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 24*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 24*/
/* printf on int */
    set         _intFmt, %o0
    set         8, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 64) & -8
