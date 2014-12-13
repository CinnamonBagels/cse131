! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gfarr,giarr
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
gfarr:          .skip        400         

giarr:          .skip        400         


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
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 8 to %l0 */
    set         8, %l0
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
    set         -164, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -168, %l5
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
! --storing constant liarr[8] with value 19.0
    set         -168, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         19, %l1
    st          %l1, [%l0]
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 8 to %l0 */
    set         8, %l0
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
    set         giarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -172, %l5
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
! --storing constant giarr[8] with value 29.0
    set         -172, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         29, %l1
    st          %l1, [%l0]
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         -176, %l5
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
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 8 to %l0 */
    set         8, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -164, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -180, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 14*/
/* Converting int liarr[8] to float. */
/* line number 14*/
/* promoting */
/* line number 14*/
/* Loading liarr[8] to %f1 */
    set         -180, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 14*/
/* done promoting */
/* line number 14*/
/* Assigning converted liarr[8] to lfarr[1] */
    set         -176, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l2
    st          %f1, [%l2]
/* line number 15*/
/* Starting array access */
/* line number 15*/
/* Loading 2 to %l0 */
    set         2, %l0
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
    set         -184, %l5
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
/* line number 15*/
/* Starting array access */
/* line number 15*/
/* Loading 8 to %l0 */
    set         8, %l0
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
    set         giarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -188, %l5
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
/* line number 15*/
/* Converting int giarr[8] to float. */
/* line number 15*/
/* promoting */
/* line number 15*/
/* Loading giarr[8] to %f1 */
    set         -188, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 15*/
/* done promoting */
/* line number 15*/
/* Assigning converted giarr[8] to lfarr[2] */
    set         -184, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l2
    st          %f1, [%l2]
/* line number 17*/
/* Starting array access */
/* line number 17*/
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -192, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* line number 17*/
/* Starting array access */
/* line number 17*/
/* Loading 8 to %l0 */
    set         8, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_7
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_7
    nop
arrayInBounds_7:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -164, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -196, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_7
    nop
arrayOutBounds_7:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_7:
/* line number 17*/
/* Converting int liarr[8] to float. */
/* line number 17*/
/* promoting */
/* line number 17*/
/* Loading liarr[8] to %f1 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 17*/
/* done promoting */
/* line number 17*/
/* Assigning converted liarr[8] to gfarr[1] */
    set         -192, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l2
    st          %f1, [%l2]
/* line number 18*/
/* Starting array access */
/* line number 18*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_8
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_8
    nop
arrayInBounds_8:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -200, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_8
    nop
arrayOutBounds_8:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_8:
/* line number 18*/
/* Starting array access */
/* line number 18*/
/* Loading 8 to %l0 */
    set         8, %l0
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
    set         giarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -204, %l5
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
/* line number 18*/
/* Converting int giarr[8] to float. */
/* line number 18*/
/* promoting */
/* line number 18*/
/* Loading giarr[8] to %f1 */
    set         -204, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 18*/
/* done promoting */
/* line number 18*/
/* Assigning converted giarr[8] to gfarr[2] */
    set         -200, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l2
    st          %f1, [%l2]
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_10
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_10
    nop
arrayInBounds_10:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -208, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_10
    nop
arrayOutBounds_10:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_10:
/* line number 20*/
/* printing float STO.ExprSTO@15e2075 */
/* line number 20*/
/* Loading gfarr[1] to %f0 */
    set         -208, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_11
    nop
    cmp         %l0, 100
    bge     arrayOutBounds_11
    nop
arrayInBounds_11:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -212, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_11
    nop
arrayOutBounds_11:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         100, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_11:
/* line number 20*/
/* printing float STO.ExprSTO@a522a6 */
/* line number 20*/
/* Loading gfarr[2] to %f0 */
    set         -212, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_12
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_12
    nop
arrayInBounds_12:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -216, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_12
    nop
arrayOutBounds_12:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_12:
/* line number 20*/
/* printing float STO.ExprSTO@1860038 */
/* line number 20*/
/* Loading lfarr[1] to %f0 */
    set         -216, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_13
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_13
    nop
arrayInBounds_13:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -220, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_13
    nop
arrayOutBounds_13:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_13:
/* line number 20*/
/* printing float STO.ExprSTO@787c16 */
/* line number 20*/
/* Loading lfarr[2] to %f0 */
    set         -220, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 220) & -8
