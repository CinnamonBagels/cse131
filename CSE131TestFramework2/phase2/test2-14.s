! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       " "         
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
/* setting i = 4 */
    set         4, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
while_0:
/* line number 7*/
/* Prepping Comparison Calculations by loading */
/* line number 7*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 7*/
/* Loading 2 to %l1 */
    set         2, %l1
/* line number 7*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_0
    nop
    set         0, %l3
    ba      greaterEqualEnd_0
    nop
greaterEqual_0:
    set         1, %l3
greaterEqualEnd_0:
/* line number 7*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >=...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 8*/
/* Decrementing */
/* line number 8*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 8*/
/* Post decrement */
    inc     %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Printing int Validating UnaryOp i as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 8*/
/* Loading Validating UnaryOp i as a IntegerType for operator: --...
 to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
    ba      while_0
    nop
whileEnd_0:
/* line number 10*/
/* Decrementing */
/* line number 10*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Printing int Validating UnaryOp i as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 10*/
/* Loading Validating UnaryOp i as a IntegerType for operator: --...
 to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
