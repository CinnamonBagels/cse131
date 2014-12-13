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
/* line number 5*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -20, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant x[1] with value 5.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 6*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
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
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
! --storing constant x[0] with value 6.0
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         6, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Starting array access */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -28, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant x[2] with value 7.0
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         7, %l1
    st          %l1, [%l0]
/* line number 9*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -32, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 9*/
/* Printing int x[1] */
    set         _intFmt, %o0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -36, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* line number 10*/
/* Printing int x[0] */
    set         _intFmt, %o0
    set         -36, %l1
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
/* Starting array access */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -40, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 11*/
/* Printing int x[2] */
    set         _intFmt, %o0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -44, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* line number 14*/
/* setting a = x[1] */
    set         -48, %l0
    add         %fp, %l0, %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Printing int a */
    set         _intFmt, %o0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_7
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_7
    nop
arrayInBounds_7:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -52, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_7
    nop
arrayOutBounds_7:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_7:
/* line number 16*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_8
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_8
    nop
arrayInBounds_8:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -56, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_8
    nop
arrayOutBounds_8:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_8:
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l1
/* line number 16*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* setting b = int + int */
    set         -64, %l0
    add         %fp, %l0, %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* Printing int b */
    set         _intFmt, %o0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_9
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_9
    nop
arrayInBounds_9:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -80, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_9
    nop
arrayOutBounds_9:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_9:
! --storing constant y[0] with value 1.0
    set         -80, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 22*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_10
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_10
    nop
arrayInBounds_10:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -84, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_10
    nop
arrayOutBounds_10:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_10:
! --storing constant y[1] with value 2.0
    set         -84, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         2, %l1
    st          %l1, [%l0]
/* line number 23*/
/* Starting array access */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_11
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_11
    nop
arrayInBounds_11:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -88, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_11
    nop
arrayOutBounds_11:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_11:
! --storing constant y[2] with value 3.0
    set         -88, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 25*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_12
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_12
    nop
arrayInBounds_12:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -92, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_12
    nop
arrayOutBounds_12:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_12:
/* line number 25*/
/* Printing int y[0] */
    set         _intFmt, %o0
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_13
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_13
    nop
arrayInBounds_13:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -96, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_13
    nop
arrayOutBounds_13:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_13:
/* line number 26*/
/* Printing int y[1] */
    set         _intFmt, %o0
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* Starting array access */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_14
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_14
    nop
arrayInBounds_14:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -100, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_14
    nop
arrayOutBounds_14:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_14:
/* line number 27*/
/* Printing int y[2] */
    set         _intFmt, %o0
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* Starting array access */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_15
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_15
    nop
arrayInBounds_15:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -104, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_15
    nop
arrayOutBounds_15:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_15:
/* line number 29*/
/* Starting array access */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_16
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_16
    nop
arrayInBounds_16:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -76, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -108, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_16
    nop
arrayOutBounds_16:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_16:
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l1
/* line number 29*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 29*/
/* Storing result of Binary Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Printing int int + int */
    set         _intFmt, %o0
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 112) & -8
