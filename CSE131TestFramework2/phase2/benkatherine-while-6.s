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
/* line number 4*/
/* setting x = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
while_0:
/* line number 4*/
/* Prepping Comparison Calculations by loading */
/* line number 4*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 4*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 4*/
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
/* line number 4*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 5*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 6*/
/* Prepping Comparison Calculations by loading */
/* line number 6*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 6*/
/* Loading 2 to %l1 */
    set         2, %l1
/* line number 6*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_1
    nop
    set         0, %l3
    ba      equalEnd_1
    nop
equal_1:
    set         1, %l3
equalEnd_1:
/* line number 6*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 9*/
/* Breaking out of while loop */
    ba      whileEnd_0
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 12*/
/* setting y = 0 */
    set         0, %l0
    st          %l0, [%fp-20]
/* line number 12*/
/* Done. */
while_1:
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Loading y to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 12*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 12*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading y to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading 2 to %l1 */
    set         2, %l1
/* line number 14*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_3
    nop
    set         0, %l3
    ba      equalEnd_3
    nop
equal_3:
    set         1, %l3
equalEnd_3:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 17*/
/* Breaking out of while loop */
    ba      whileEnd_1
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading y to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 18*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 18*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Storing variable int + int into y */
    set         -20, %l5
    add         %fp, %l5, %l5
    set         -32, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      while_1
    nop
whileEnd_1:
/* line number 20*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 20*/
/* Loading y to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 21*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 21*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Storing variable int + int into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      while_0
    nop
whileEnd_0:
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
