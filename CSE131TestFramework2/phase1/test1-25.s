! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r4.0       
float_1:        .single      0r6.0       
str_2:          .asciz       " * "       
str_3:          .asciz       " = "       
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
/* setting k = 4.0 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 7*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 7*/
/* Done. */
/* line number 8*/
/* setting l = 6.0 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 8*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Multiplying */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* setting m = float * float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* printing float STO.VarSTO@60acdc */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* printing float STO.VarSTO@f4c9c4 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* printing float STO.VarSTO@1d317ab */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
