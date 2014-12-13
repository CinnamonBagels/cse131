! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r1.0       
float_1:        .single      0r2.0       
float_2:        .single      0r3.0       
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
! --storing constant f[0] with value 1.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
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
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 7*/
/* printing float STO.ExprSTO@41e2aa */
/* line number 7*/
/* Loading f[0] to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 7*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Starting array access */
/* line number 9*/
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
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant f[1] with value 2.0
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* line number 9*/
/* promoting */
/* line number 9*/
/* Storing variable 2 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         2, %l3
    st          %l3, [%l5]
/* line number 9*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 9*/
/* done promoting */
    st          %f1, [%l0]
/* line number 10*/
/* Starting array access */
/* line number 10*/
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
/* line number 10*/
/* printing float STO.ExprSTO@1881149 */
/* line number 10*/
/* Loading f[1] to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -52, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -56, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
! --storing constant g[2] with value 3.0
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* line number 14*/
/* promoting */
/* line number 14*/
/* Storing variable 3 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 14*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 14*/
/* done promoting */
    st          %f1, [%l0]
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -52, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -60, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 17*/
/* setting a = g[2] */
    set         -64, %l0
    add         %fp, %l0, %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* printing float STO.VarSTO@f7d5a6 */
/* line number 17*/
/* Loading a to %f0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Starting array access */
/* line number 18*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -52, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -68, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* line number 18*/
/* printing float STO.ExprSTO@eba9b0 */
/* line number 18*/
/* Loading g[2] to %f0 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 18*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -72, %l5
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
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         -76, %l5
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
/* line number 20*/
/* Storing variable f[1] into f[0] */
    set         -72, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -76, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 22*/
/* Starting array access */
/* line number 22*/
/* Loading 0 to %l0 */
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
    set         -16, %l1
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
/* line number 22*/
/* printing float STO.ExprSTO@1d17f01 */
/* line number 22*/
/* Loading f[0] to %f0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 22*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -16, %l1
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
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         -16, %l1
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
/* line number 24*/
/* Storing variable f[1] into f[0] */
    set         -84, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -88, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 24*/
/* printing float STO.ExprSTO@e9581b */
/* line number 24*/
/* Loading f[0] to %f0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 24*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 88) & -8
