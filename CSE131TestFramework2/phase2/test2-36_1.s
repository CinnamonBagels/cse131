! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gfarr,giarr
float_0:        .single      0r9876.54   
float_1:        .single      0r1029.0    
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " "         
str_6:          .asciz       " "         
str_7:          .asciz       " "         
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
/* line number 9*/
/* setting i = 10 */
    set         10, %l0
    st          %l0, [%fp-8]
/* line number 9*/
/* Done. */
/* line number 11*/
/* setting j = 40 */
    set         40, %l0
    st          %l0, [%fp-92]
/* line number 11*/
/* Done. */
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -88, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -180, %l5
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
! --storing constant liarr[0] with value 54321.0
    set         -180, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         54321, %l1
    st          %l1, [%l0]
/* line number 15*/
/* Starting array access */
/* line number 15*/
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -88, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -184, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
! --storing constant liarr[1] with value 65432.0
    set         -184, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         65432, %l1
    st          %l1, [%l0]
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -172, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -188, %l5
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
! --storing constant lfarr[0] with value 9876.54
    set         -188, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Starting array access */
/* line number 17*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         -172, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -192, %l5
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
! --storing constant lfarr[1] with value 1029.0
    set         -192, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant j with value 59.0
    set         -92, %l0
    add         %fp, %l0, %l0
    set         59, %l1
    st          %l1, [%l0]
/* line number 19*/
/* Storing variable j into i */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -92, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 19*/
/* Converting int i to float. */
/* line number 19*/
/* promoting */
/* line number 19*/
/* Loading i to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 19*/
/* done promoting */
/* line number 19*/
/* Assigning converted i to f */
    set         -176, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 21*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 21*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
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
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -88, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -196, %l5
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
/* line number 21*/
/* Printing int liarr[0] */
    set         _intFmt, %o0
/* line number 21*/
/* Loading liarr[0] to %o1 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -88, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -200, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 21*/
/* Printing int liarr[1] */
    set         _intFmt, %o0
/* line number 21*/
/* Loading liarr[1] to %o1 */
    set         -200, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 21*/
/* Loading j to %o1 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading 0 to %l0 */
    set         0, %l0
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
    set         -172, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -204, %l5
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
/* line number 21*/
/* printing float STO.ExprSTO@e77ca4 */
/* line number 21*/
/* Loading lfarr[0] to %f0 */
    set         -204, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         -172, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -208, %l5
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
/* line number 21*/
/* printing float STO.ExprSTO@1a83205 */
/* line number 21*/
/* Loading lfarr[1] to %f0 */
    set         -208, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* printing float STO.VarSTO@87cbde */
/* line number 21*/
/* Loading f to %f0 */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 208) & -8
