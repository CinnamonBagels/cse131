! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r9.0       
float_1:        .single      0r100.0     
float_2:        .single      0r200.0     
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
/* line number 10*/
/* setting b = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading 500 to %l0 */
    set         500, %l0
/* line number 10*/
/* Loading 500 to %l1 */
    set         500, %l1
/* line number 10*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading Arithmetic Op to %l0 */
    set         1000, %l0
/* line number 10*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 10*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading Arithmetic Op to %l0 */
    set         999, %l0
/* line number 10*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading int + int to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* setting a = int - int */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading b to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4040, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant c[b] with value 9.0
    set         -4040, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* line number 14*/
/* promoting */
/* line number 14*/
/* Storing variable 9 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         9, %l3
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
/* Loading b to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4044, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 16*/
/* printing float STO.ExprSTO@10d16b */
/* line number 16*/
/* Loading c[b] to %f0 */
    set         -4044, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 18*/
/* Loading a to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4048, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant c[a] with value 100.0
    set         -4048, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* line number 18*/
/* promoting */
/* line number 18*/
/* Storing variable 100 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         100, %l3
    st          %l3, [%l5]
/* line number 18*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 18*/
/* done promoting */
    st          %f1, [%l0]
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading a to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4052, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 20*/
/* printing float STO.ExprSTO@24de67 */
/* line number 20*/
/* Loading c[a] to %f0 */
    set         -4052, %l1
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
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading a to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 22*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4056, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading int + int to %l0 */
    set         -4056, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 22*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4060, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading int - int to %l0 */
    set         -4060, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4064, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading int + int to %l0 */
    set         -4064, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4068, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading int - int to %l0 */
    set         -4068, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4072, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading int + int to %l0 */
    set         -4072, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -4076, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Starting array access */
/* line number 22*/
/* Loading int - int to %l0 */
    set         -4076, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4080, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
! --storing constant c[int - int] with value 200.0
    set         -4080, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* line number 22*/
/* promoting */
/* line number 22*/
/* Storing variable 200 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         200, %l3
    st          %l3, [%l5]
/* line number 22*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 22*/
/* done promoting */
    st          %f1, [%l0]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading a to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4084, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int + int to %l0 */
    set         -4084, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 24*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4088, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int - int to %l0 */
    set         -4088, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4092, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int + int to %l0 */
    set         -4092, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4096, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int - int to %l0 */
    set         -4096, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4100, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int + int to %l0 */
    set         -4100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading b to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4104, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading int - int to %l0 */
    set         -4104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading 1000 to %l1 */
    set         1000, %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -4108, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading int + int to %l0 */
    set         -4108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4112, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 24*/
/* printing float STO.ExprSTO@853e51 */
/* line number 24*/
/* Loading c[int + int] to %f0 */
    set         -4112, %l1
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
SAVE.main = -(92 + 4112) & -8
