
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
/* setting y = 6 */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         6, %l1
    st          %l1, [%l0]
/* Done. */
/* Starting array access */
    set         0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant x[0] with value 4.0
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         4, %l1
    st          %l1, [%l0]
/* Starting array access */
    set         1, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
! --storing constant x[1] with value 3.0
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* Starting array access */
    set         2, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant x[2] with value 5.0
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* Starting array access */
    set         3, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* Storing y into x[3] */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -20, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* Starting array access */
    set         0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* Printing int x[0] */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
/* Starting array access */
    set         1, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* Printing int x[1] */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
/* Starting array access */
    set         2, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* Printing int x[2] */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
/* Starting array access */
    set         3, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_7
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_7
    nop
arrayInBounds_7:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_7
    nop
arrayOutBounds_7:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_7:
/* Printing int x[3] */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 20) & -8
