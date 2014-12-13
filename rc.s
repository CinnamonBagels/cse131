! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gfarr,giarr
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
/* line number 10*/
/* Starting array access */
/* line number 10*/
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
    set         -84, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -88, %l5
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
    set         -88, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         19, %l1
    st          %l1, [%l0]
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -92, %l5
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
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 8 to %l0 */
    set         8, %l0
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
    set         -96, %l5
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
/* line number 12*/
/* Converting int liarr[8] to float. */
/* line number 12*/
/* promoting */
/* line number 12*/
/* Loading liarr[8] to %f1 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 12*/
/* done promoting */
/* line number 12*/
/* Assigning converted liarr[8] to gfarr[1] */
    set         -92, %l2
    add         %fp, %l2, %l2
    st          %f1, [%f1]
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 1 to %l0 */
    set         1, %l0
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
    set         gfarr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -100, %l5
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
/* line number 14*/
/* printing float STO.ExprSTO@3b1f38 */
/* line number 14*/
/* Loading gfarr[1] to %f0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 100) & -8
