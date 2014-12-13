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
/* line number 5*/
/* Loading 0 to %l0 */
    set         0, %l0
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
! --storing constant b[0] with value 1.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 6*/
/* Starting array access */
/* line number 6*/
/* Loading 1 to %l0 */
    set         1, %l0
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
! --storing constant b[1] with value 0.0
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Starting array access */
/* line number 8*/
/* Loading 0 to %l0 */
    set         0, %l0
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
/* line number 8*/
/* Printing bool b[0] */
/* line number 8*/
/* Loading b[0] to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 8*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Starting array access */
/* line number 9*/
/* Loading 1 to %l0 */
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
/* Printing bool b[1] */
/* line number 9*/
/* Loading b[1] to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 9*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 2 to %l0 */
    set         2, %l0
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
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 0 to %l0 */
    set         0, %l0
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
/* Storing variable b[0] into b[2] */
    set         -36, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -40, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 11*/
/* Printing bool b[2] */
/* line number 11*/
/* Loading b[2] to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
