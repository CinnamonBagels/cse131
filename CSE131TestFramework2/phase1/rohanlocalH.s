! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* Converting int 10 to float. */
/* line number 5*/
/* promoting */
/* line number 5*/
/* Storing variable 10 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         10, %l3
    st          %l3, [%l5]
/* line number 5*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 5*/
/* done promoting */
/* line number 5*/
/* Assigning converted 10 to c */
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 5*/
/* printing float STO.VarSTO@1def658 */
/* line number 5*/
/* Loading c to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 5*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
