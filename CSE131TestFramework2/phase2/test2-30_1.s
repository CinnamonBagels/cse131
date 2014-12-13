! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     j
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
j:              .skip        400         


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
/* line number 10*/
/* Starting array access */
/* line number 10*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -92, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant i[4] with value 16.0
    set         -92, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         16, %l1
    st          %l1, [%l0]
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 6 to %l0 */
    set         6, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         j, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -96, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -100, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 11*/
/* Storing variable i[4] into j[6] */
    set         -96, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -100, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 13*/
/* Starting array access */
/* line number 13*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         j, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -104, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
! --storing constant j[4] with value -1234.0
    set         -104, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1234, %l1
    st          %l1, [%l0]
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 6 to %l0 */
    set         6, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -108, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         j, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -112, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 14*/
/* Storing variable j[4] into i[6] */
    set         -108, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -112, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -116, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* line number 16*/
/* Printing int i[4] */
    set         _intFmt, %o0
/* line number 16*/
/* Loading i[4] to %o1 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 6 to %l0 */
    set         6, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_7
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_7
    nop
arrayInBounds_7:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         j, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -120, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_7
    nop
arrayOutBounds_7:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_7:
/* line number 16*/
/* Printing int j[6] */
    set         _intFmt, %o0
/* line number 16*/
/* Loading j[6] to %o1 */
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
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
/* Loading 6 to %l0 */
    set         6, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_8
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_8
    nop
arrayInBounds_8:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -124, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_8
    nop
arrayOutBounds_8:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_8:
/* line number 16*/
/* Printing int i[6] */
    set         _intFmt, %o0
/* line number 16*/
/* Loading i[6] to %o1 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_9
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_9
    nop
arrayInBounds_9:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         j, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -128, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_9
    nop
arrayOutBounds_9:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_9:
/* line number 16*/
/* Printing int j[4] */
    set         _intFmt, %o0
/* line number 16*/
/* Loading j[4] to %o1 */
    set         -128, %l1
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 128) & -8
