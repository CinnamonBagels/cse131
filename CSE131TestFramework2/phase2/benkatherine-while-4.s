! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
while_0:
/* line number 5*/
/* Prepping Comparison Calculations by loading */
/* line number 5*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 5*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 5*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
/* line number 7*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 7*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 7*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 7*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Storing variable int + int into x */
    set         x, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 9*/
/* Breaking out of while loop */
    ba      whileEnd_0
    nop
    ba      while_0
    nop
whileEnd_0:
/* line number 11*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 11*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
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
SAVE.main = -(92 + 12) & -8
