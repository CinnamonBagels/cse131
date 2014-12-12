! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r95.95     
float_1:        .single      0r1234567.0 
float_2:        .single      0r0.01      
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " = true, false = "
str_6:          .asciz       "\n"        
str_7:          .asciz       " "         
str_8:          .asciz       " "         
str_9:          .asciz       " "         
str_10:         .asciz       " "         
str_11:         .asciz       " = true, false = "
str_12:         .asciz       "\n"        
float_13:       .single      0r95.95     
float_14:       .single      0r95.95     
str_15:         .asciz       " "         
float_16:       .single      0r1234567.0 
float_17:       .single      0r1234567.0 
str_18:         .asciz       " "         
float_19:       .single      0r0.01      
float_20:       .single      0r-0.01     
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
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 5*/
/* setting b1 = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 5*/
/* Done. */
/* line number 6*/
/* setting b2 = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting i = 2 */
    set         2, %l0
    st          %l0, [%fp-16]
/* line number 7*/
/* Done. */
/* line number 8*/
/* setting k = 5 */
    set         -5, %l0
    st          %l0, [%fp-20]
/* line number 8*/
/* Done. */
/* line number 9*/
/* setting f1 = 95.95 */
    set         -24, %l0
    add         %fp, %l0, %l0
/* line number 9*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 9*/
/* Done. */
/* line number 10*/
/* setting f2 = 1234567.0 */
    set         -28, %l0
    add         %fp, %l0, %l0
/* line number 10*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 10*/
/* Done. */
/* line number 12*/
/* setting f3 = .01 */
    set         -32, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Printing int i */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int k */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* Printing bool b1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* line number 13*/
/* Done printing bool. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* Printing bool b2 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 13*/
/* Done printing bool. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 15*/
/* printing float f1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing float f2 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing float f3 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printf on int */
    set         _intFmt, %o0
    set         2, %o1
    call    printf
    nop

/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* printf on int */
    set         _intFmt, %o0
    set         -5, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
    set         float_14, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    set         float_17, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    set         float_20, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
