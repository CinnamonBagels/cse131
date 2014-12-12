! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r5.0       
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
! --storing constant c with value 5.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 5*/
/* promoting */
/* line number 5*/
/* Storing variable 5 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 5*/
/* done promoting */
    st          %f1, [%l0]
/* line number 7*/
/* printing float STO.VarSTO@7c3885 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 7*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
