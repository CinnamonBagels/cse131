! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "a is: "    
str_1:          .asciz       "old b is: "
str_2:          .asciz       "new b is: "
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
/* line number 1*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 3*/
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 3*/
/* Done. */
while_0:
/* line number 3*/
/* Prepping Comparison Calculations by loading */
/* line number 3*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 3*/
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
/* line number 3*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 3*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 4*/
/* Starting array access */
/* line number 4*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 10
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
    set         10, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
/* line number 4*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 4*/
/* Loading 2 to %l1 */
    set         2, %l1
/* line number 4*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 4*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 4*/
/* Storing variable int * int into a[i] */
    set         -16, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
/* line number 5*/
/* Starting array access */
/* line number 5*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         68, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 5*/
/* Printing int a[i] */
    set         _intFmt, %o0
/* line number 5*/
/* Loading a[i] to %o1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 5*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Incrementing */
/* line number 6*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 6*/
/* Post Increment */
    dec     %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 28) & -8
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
/* line number 13*/
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-48]
/* line number 13*/
/* Done. */
/* line number 14*/
/* setting f = 0 */
    set         0, %l0
    st          %l0, [%fp-52]
/* line number 14*/
/* Done. */
while_1:
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading i to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 14*/
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
/* line number 14*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 15*/
/* Starting array access */
/* line number 15*/
/* Loading i to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -44, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -60, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 15*/
/* Storing variable i into b[i] */
    set         -60, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -48, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading i to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -44, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -64, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 16*/
/* Printing int b[i] */
    set         _intFmt, %o0
/* line number 16*/
/* Loading b[i] to %o1 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Incrementing */
/* line number 17*/
/* Loading i to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -48, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 17*/
/* Post Increment */
    dec     %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_1
    nop
whileEnd_1:
/* line number 19*/
/* Preparing argument b */
    set         null, %o0
    add         null, %o0, %o0
    call    foo
    nop
while_2:
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading f to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 20*/
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
/* line number 20*/
/* Storing result of Comparison Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_2
    nop
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading f to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -44, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -76, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* line number 21*/
/* Printing int b[f] */
    set         _intFmt, %o0
/* line number 21*/
/* Loading b[f] to %o1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Incrementing */
/* line number 22*/
/* Loading f to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -52, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 22*/
/* Post Increment */
    dec     %l0
    set         -80, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_2
    nop
whileEnd_2:
main_end:
    ret 
    restore
SAVE.main = -(92 + 80) & -8
