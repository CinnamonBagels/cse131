! --globals--
                .section     ".data"
                .align 4
                 .global     x
x:              .word        0           
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
! --storing constant x with value 4.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         x, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 4*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 4*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant x with value 5.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         x, %l0
    add         %g0, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 6*/
/* setting y = x */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 6*/
/* Done. */
/* line number 6*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
/* line number 6*/
/* Printing int y */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* setting z = 0 */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Storing variable x into z */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         x, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 8*/
/* Printing int z */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
! --storing constant z with value 5.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Printing int z */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* Printing int y */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
