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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 6*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 8*/
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
while_0:
/* line number 8*/
/* Prepping Comparison Calculations by loading */
/* line number 8*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 8*/
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
/* line number 8*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 10*/
/* Starting array access */
/* line number 10*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         68, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -16, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
/* line number 10*/
/* Printing int a[i] */
    set         _intFmt, %o0
/* line number 10*/
/* Loading a[i] to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Incrementing */
/* line number 11*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 11*/
/* Post Increment */
    dec     %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 20) & -8
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
/* line number 21*/
/* setting j = 5 */
    set         5, %l0
    st          %l0, [%fp-28]
/* line number 21*/
/* Done. */
/* line number 21*/
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-32]
/* line number 21*/
/* Done. */
while_1:
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading i to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 21*/
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
/* line number 21*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 23*/
/* Incrementing */
/* line number 23*/
/* Loading i to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -32, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 23*/
/* Post Increment */
    dec     %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Starting array access */
/* line number 23*/
/* Loading Validating UnaryOp i as a IntegerType for operator: ++...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -24, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -44, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 23*/
/* Decrementing */
/* line number 23*/
/* Loading j to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -28, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 23*/
/* Post decrement */
    inc     %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Storing variable Validating UnaryOp j as a IntegerType for operator: --...
 into array[Validating UnaryOp i as a IntegerType for operator: ++...
] */
    set         -44, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -48, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      while_1
    nop
whileEnd_1:
/* line number 33*/
/* Preparing argument array */
    set         null, %o0
    add         null, %o0, %o0
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 48) & -8
