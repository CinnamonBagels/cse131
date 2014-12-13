! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x
float_0:        .single      0r2.0       
float_1:        .single      0r3.0       
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
x:              .skip        16          


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
/* Loading 2 to %l0 */
    set         2, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -8, %l5
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
! --storing constant x[2] with value 2.0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 6*/
/* Starting array access */
/* line number 6*/
/* Loading 3 to %l0 */
    set         3, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -12, %l5
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
! --storing constant x[3] with value 3.0
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Starting array access */
/* line number 8*/
/* Loading 2 to %l0 */
    set         2, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -16, %l5
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
/* line number 8*/
/* printing float STO.ExprSTO@1881149 */
/* line number 8*/
/* Loading x[2] to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Starting array access */
/* line number 9*/
/* Loading 3 to %l0 */
    set         3, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -20, %l5
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
/* line number 9*/
/* printing float STO.ExprSTO@2709da */
/* line number 9*/
/* Loading x[3] to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 9*/
/* Done printing float. */
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
    cmp         %l0, 4
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
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
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 3 to %l0 */
    set         3, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -28, %l5
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
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Starting greater than */
/* line number 11*/
/* Loading x[2] to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 11*/
/* Loading x[3] to %f1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 11*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* setting a = Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 2 to %l0 */
    set         2, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -40, %l5
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
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 3 to %l0 */
    set         3, %l0
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
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -44, %l5
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
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Starting greater than equal */
/* line number 12*/
/* Loading x[2] to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading x[3] to %f1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_1
    nop
    set         0, %l3
    ba      greaterEqualEnd_1
    nop
greaterEqual_1:
    set         1, %l3
greaterEqualEnd_1:
/* line number 12*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* setting b = Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
    set         -52, %l0
    add         %fp, %l0, %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Starting array access */
/* line number 13*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_8
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_8
    nop
arrayInBounds_8:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -56, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_8
    nop
arrayOutBounds_8:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_8:
/* line number 13*/
/* Starting array access */
/* line number 13*/
/* Loading 3 to %l0 */
    set         3, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_9
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_9
    nop
arrayInBounds_9:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -60, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_9
    nop
arrayOutBounds_9:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_9:
/* line number 13*/
/* Prepping Comparison Calculations by loading */
/* line number 13*/
/* Starting Less than */
/* line number 13*/
/* Loading x[2] to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 13*/
/* Loading x[3] to %f1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbl     less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 13*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* setting c = Validating ComparisonOp float and float as a BooleanType for operator: <...
 */
    set         -68, %l0
    add         %fp, %l0, %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_10
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_10
    nop
arrayInBounds_10:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -72, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_10
    nop
arrayOutBounds_10:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_10:
/* line number 14*/
/* Starting array access */
/* line number 14*/
/* Loading 3 to %l0 */
    set         3, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_11
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_11
    nop
arrayInBounds_11:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -76, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_11
    nop
arrayOutBounds_11:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_11:
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Starting Less than Equal */
/* line number 14*/
/* Loading x[2] to %f0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 14*/
/* Loading x[3] to %f1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fble    lessEqual_3
    nop
    set         0, %l3
    ba      lessEqualEnd_3
    nop
lessEqual_3:
    set         1, %l3
lessEqualEnd_3:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* setting d = Validating ComparisonOp float and float as a BooleanType for operator: <=...
 */
    set         -84, %l0
    add         %fp, %l0, %l0
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Printing bool a */
/* line number 16*/
/* Loading a to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
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
/* line number 16*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Printing bool b */
/* line number 17*/
/* Loading b to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Printing bool c */
/* line number 18*/
/* Loading c to %l0 */
    set         -68, %l1
    add         %fp, %l1, %l1
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
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Printing bool d */
/* line number 19*/
/* Loading d to %l0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_3
    nop
printTrue_3:
    set         _boolT, %o1
    ba      branchEnd_3
    nop
printFalse_3:
    set         _boolF, %o1
branchEnd_3:
    call    printf
    nop
/* line number 19*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_12
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_12
    nop
arrayInBounds_12:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -88, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_12
    nop
arrayOutBounds_12:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_12:
/* line number 21*/
/* Starting array access */
/* line number 21*/
/* Loading 3 to %l0 */
    set         3, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_13
    nop
    cmp         %l0, 4
    bge     arrayOutBounds_13
    nop
arrayInBounds_13:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         x, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -92, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_13
    nop
arrayOutBounds_13:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4, %o2
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_13:
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Adding */
/* line number 21*/
/* Loading x[2] to %f0 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading x[3] to %f1 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 22*/
/* setting e = float + float */
    set         -100, %l0
    add         %fp, %l0, %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 22*/
/* Done. */
/* line number 22*/
/* printing float STO.VarSTO@e77ca4 */
/* line number 22*/
/* Loading e to %f0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 22*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 100) & -8
