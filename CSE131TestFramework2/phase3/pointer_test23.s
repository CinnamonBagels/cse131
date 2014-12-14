! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     woo
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
woo:            .skip        4           


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
/* Allocating for new woo */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -8, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 7*/
/* Dereferencing woo */
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *woo with value 99.0
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         99, %l1
    st          %l1, [%l0]
/* line number 9*/
/* Dereferencing woo */
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Printing int *woo */
    set         _intFmt, %o0
/* line number 9*/
/* Loading *woo to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
SAVE.main = -(92 + 16) & -8
