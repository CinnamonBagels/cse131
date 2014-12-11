! --globals--
                .section     ".data"
                .align 4
globalInit_:    .word        0           
str_0:          .asciz       "a before post++ is: "
str_1:          .asciz       "a after post++ is: "
str_2:          .asciz       "c should be: "
str_3:          .asciz       "c should be: "

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
/* line number 4*/
/* setting a = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 5*/
/* setting b = 6 */
    set         6, %l0
    st          %l0, [%fp-12]
/* line number 5*/
/* Done. */
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
/* line number 7*/
/* Printing int a */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 7*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 9*/
/* Post Increment */
    dec     %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Storing int - int into c */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -24, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* Printing int a */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int c */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Storing int + int into c */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -32, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Printing int c */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
