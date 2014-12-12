! --globals--
                .section     ".data"
                .align 4
                 .global     x,y
float_0:        .single      0r3.3       
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
x:              .skip        12          

y:              .skip        16          


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
/* line number 7*/
/* Starting array access */
    set         2, %l0
    set         x, %l1
    add         %g0, %l1, %l1
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
    add         %l1, %l2, %l4
    set         -8, %l5
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
! --storing constant x[2] with value 3.0
    set         3, %l1
    st          %l1, [%l0]
/* line number 9*/
/* Starting array access */
    set         2, %l0
    set         x, %l1
    add         %g0, %l1, %l1
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
    add         %l1, %l2, %l4
    set         -8, %l5
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
/* line number 11*/
/* Converting int x[2] to float. */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 11*/
/* Assigning converted x[2] to e */
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 11*/
/* Starting array access */
    set         2, %l0
    set         x, %l1
    add         %g0, %l1, %l1
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
    add         %l1, %l2, %l4
    set         -12, %l5
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
/* line number 11*/
/* Printing int x[2] */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printing float e */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Starting array access */
    set         3, %l0
    set         y, %l1
    add         %g0, %l1, %l1
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
    set         -12, %l5
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
! --storing constant y[3] with value 3.3
    set         float_0, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
/* line number 16*/
/* Starting array access */
    set         3, %l0
    set         y, %l1
    add         %g0, %l1, %l1
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
    set         -12, %l5
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
/* line number 16*/
/* printing float y[3] */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Starting array access */
    set         3, %l0
    set         y, %l1
    add         %g0, %l1, %l1
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
    set         -12, %l5
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
/* line number 20*/
/* setting f = y[3] */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 20*/
/* Done. */
/* line number 20*/
/* printing float f */
    set         -12, %l1
    add         %fp, %l1, %l1
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
SAVE.main = -(92 + 12) & -8
