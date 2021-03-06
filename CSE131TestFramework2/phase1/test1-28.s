! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     i,j,k
j:              .single      0r2.0       
k:              .single      0r0         
float_0:        .single      0r5.0       
float_1:        .single      0r2.0       
i:              .word        10          
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " "         
str_6:          .asciz       " "         
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
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
/* line number 5*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Dividing */
/* line number 5*/
/* Loading i to %f0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 5*/
/* Loading j to %f1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 5*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 8*/
/* Storing variable int / float into k */
    set         k, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 11*/
/* setting a = 20 */
    set         20, %l0
    st          %l0, [%fp-8]
/* line number 11*/
/* Done. */
/* line number 12*/
/* setting b = 5.0 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Dividing */
/* line number 12*/
/* Loading a to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading b to %f1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 13*/
/* setting c = int / float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
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
/* Loading i to %l1 */
    set         i, %l1
    add         %g0, %l1, %l1
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
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 14*/
/* setting d = int / int */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
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
/* Dividing */
/* line number 14*/
/* Loading a to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 14*/
/* Storing variable 2.0 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 14*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 14*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 16*/
/* setting e = int / float */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 16*/
/* Done. */
/* line number 16*/
/* printing float STO.VarSTO@1a83205 */
/* line number 16*/
/* Loading k to %f0 */
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* printing float STO.VarSTO@24de67 */
/* line number 16*/
/* Loading c to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Printing int d */
    set         _intFmt, %o0
/* line number 16*/
/* Loading d to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* printing float STO.VarSTO@1be4050 */
/* line number 16*/
/* Loading e to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading 30 to %l0 */
    set         30, %l0
/* line number 16*/
/* Dividing */
/* line number 16*/
/* Storing variable 30 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         30, %l3
    st          %l3, [%l5]
/* line number 16*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading b to %f1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 16*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 16*/
/* printing float STO.ExprSTO@170526a */
/* line number 16*/
/* Loading int / float to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 16*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
