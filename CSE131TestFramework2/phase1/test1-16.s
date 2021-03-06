! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     i,j
i:              .word        4           
j:              .word        5           
str_0:          .asciz       " + "       
str_1:          .asciz       " + "       
str_2:          .asciz       " + "       
str_3:          .asciz       " + "       
str_4:          .asciz       " = "       
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
/* line number 7*/
/* setting i = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
/* line number 9*/
/* setting j = 2 */
    set         2, %l0
    st          %l0, [%fp-12]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 9*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 9*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* printf on int */
    set         _intFmt, %o0
    set         3, %o1
    call    printf
    nop

/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 9*/
/* Loading i to %o1 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 9*/
/* Loading j to %o1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading j to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading int + int to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading int + int to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading i to %l1 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading int + int to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading j to %l1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* setting k = int + int */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 14*/
/* Loading k to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
