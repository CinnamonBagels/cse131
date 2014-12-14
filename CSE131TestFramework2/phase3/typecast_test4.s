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
/* line number 3*/
/* Short-circuiting && with true */
/* line number 3*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 3*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 3*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 3*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 5*/
/* setting a = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 5*/
/* Done. */
/* line number 5*/
/* Storing variable a into a */
    set         -16, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* Converting int a to float. */
/* line number 7*/
/* promoting */
/* line number 7*/
/* Loading a to %f1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 7*/
/* done promoting */
/* line number 7*/
/* Assigning converted a to b */
    set         -20, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 7*/
/* printing float STO.VarSTO@cab3bf */
/* line number 7*/
/* Loading b to %f0 */
    set         -20, %l1
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
SAVE.main = -(92 + 20) & -8
