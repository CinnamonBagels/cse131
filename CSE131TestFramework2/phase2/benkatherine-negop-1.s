! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .word        0           
y:              .word        0           
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
/* line number 8*/
/* Incrementing */
/* line number 8*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         x, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 8*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Incrementing */
/* line number 9*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         y, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 11*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_0
    nop
    set         0, %l3
    ba      nEqualEnd_0
    nop
nEqual_0:
    set         1, %l3
nEqualEnd_0:
/* line number 11*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Negating */
/* line number 11*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: !=...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_0
    nop
decrement_0:
    dec     %l0
    ba      negEnd_0
    nop
increment_0:
    inc     %l0
negEnd_0:
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Printing bool Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: !=...
 as a BooleanType for operator: !...
 */
/* line number 11*/
/* Loading Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: !=...
 as a BooleanType for operator: !...
 to %l0 */
    set         -20, %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
! --storing constant x with value 5.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant y with value 5.0
    set         y, %l0
    add         %g0, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 17*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Negating */
/* line number 17*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_1
    nop
decrement_1:
    dec     %l0
    ba      negEnd_1
    nop
increment_1:
    inc     %l0
negEnd_1:
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Printing bool Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: <...
 as a BooleanType for operator: !...
 */
/* line number 17*/
/* Loading Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: <...
 as a BooleanType for operator: !...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_2
    nop
    set         0, %l3
    ba      equalEnd_2
    nop
equal_2:
    set         1, %l3
equalEnd_2:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Negating */
/* line number 18*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_2
    nop
decrement_2:
    dec     %l0
    ba      negEnd_2
    nop
increment_2:
    inc     %l0
negEnd_2:
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Printing bool Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: ==...
 as a BooleanType for operator: !...
 */
/* line number 18*/
/* Loading Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: ==...
 as a BooleanType for operator: !...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
