! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       " = "       
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
! --storing constant i with value 1.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant k with value 3.0
    set         -20, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Storing variable k into j */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
! --storing constant l with value 7.0
    set         -16, %l0
    add         %fp, %l0, %l0
    set         7, %l1
    st          %l1, [%l0]
/* line number 11*/
/* printf on int */
    set         _intFmt, %o0
    set         1337, %o1
    call    printf
    nop

/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 11*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
/* line number 11*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 11*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
/* line number 11*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 11*/
/* Loading k to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
/* line number 11*/
/* Printing int l */
    set         _intFmt, %o0
/* line number 11*/
/* Loading l to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
