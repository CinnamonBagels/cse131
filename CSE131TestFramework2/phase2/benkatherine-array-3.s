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
/* Loading 1 to %l0 */
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
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant x[1] with value 666.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         666, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Starting array access */
/* line number 7*/
/* Loading 0 to %l0 */
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
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 7*/
/* Starting array access */
/* line number 7*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 7*/
/* Storing variable x[1] into x[0] */
    set         -24, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* Printing int x[0] */
    set         _intFmt, %o0
/* line number 7*/
/* Loading x[0] to %o1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 7*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* Starting array access */
/* line number 8*/
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
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 8*/
/* Printing int x[1] */
    set         _intFmt, %o0
/* line number 8*/
/* Loading x[1] to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
