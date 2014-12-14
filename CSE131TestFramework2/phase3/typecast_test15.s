! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r4.22      
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
/* line number 4*/
/* setting b = 4.22 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 4*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 4*/
/* Done. */
/* line number 4*/
/* Loading b to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fstoi       %f0, %f0
    set         -12, %l0
    add         %fp, %l0, %l0
    st          %f0, [%l0]
/* line number 5*/
/* setting a = b */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 5*/
/* Done. */
/* line number 5*/
/* Storing variable a into a */
    set         -20, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* setting c = a */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Printing bool c */
/* line number 7*/
/* Loading c to %l0 */
    set         -24, %l1
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
/* line number 7*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 24) & -8
