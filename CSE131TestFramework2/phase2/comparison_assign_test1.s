! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,i0,i1,i2,i3,fx,fy,fz,f0,f1,f2,f3
fx:             .single      0r5.43      
fy:             .single      0r3.26      
fz:             .single      0r5.43      
float_0:        .single      0r6.32      
float_1:        .single      0r5.22      
float_2:        .single      0r5.32      
float_3:        .single      0r5.32      
float_4:        .single      0r3.1       
float_5:        .single      0r5.32      
float_6:        .single      0r94.3      
float_7:        .single      0r-97.24    
x:              .word        1           
y:              .word        2           
i0:             .word        0           
i1:             .word        0           
i2:             .word        0           
i3:             .word        0           
f0:             .word        0           
f1:             .word        0           
f2:             .word        0           
f3:             .word        0           
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
/* line number 5*/
/* Prepping Comparison Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 5*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into i0 */
    set         i0, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 6*/
/* Prepping Comparison Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 6*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 6*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into i1 */
    set         i1, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* Prepping Comparison Calculations by loading */
    set         5, %l0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 7*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 7*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into i2 */
    set         i2, %l5
    add         %g0, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 8*/
/* Prepping Comparison Calculations by loading */
    set         50, %l0
    set         50, %l1
/* line number 8*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* line number 8*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into i3 */
    set         i3, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 15*/
/* Prepping Comparison Calculations by loading */
/* line number 15*/
/* Starting greater than */
    set         fx, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         fy, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* line number 15*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Storing variable Validating ComparisonOp float and float as a BooleanType for operator: >...
 into f0 */
    set         f0, %l5
    add         %g0, %l5, %l5
    set         -24, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Starting greater than */
    set         fx, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         float_0, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_5
    nop
    set         0, %l3
    ba      greaterEnd_5
    nop
greater_5:
    set         1, %l3
greaterEnd_5:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Storing variable Validating ComparisonOp float and float as a BooleanType for operator: >...
 into f1 */
    set         f1, %l5
    add         %g0, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Starting greater than */
/* line number 17*/
/* Storing variable 5.22 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 17*/
/* Storing variable fy into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         fy, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         fy, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_6
    nop
    set         0, %l3
    ba      greaterEnd_6
    nop
greater_6:
    set         1, %l3
greaterEnd_6:
/* line number 17*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Storing variable Validating ComparisonOp float and float as a BooleanType for operator: >...
 into f2 */
    set         f2, %l5
    add         %g0, %l5, %l5
    set         -32, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Starting greater than */
/* line number 18*/
/* Storing variable 5.32 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_3, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 18*/
/* Storing variable 5.32 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_7
    nop
    set         0, %l3
    ba      greaterEnd_7
    nop
greater_7:
    set         1, %l3
greaterEnd_7:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Storing variable Validating ComparisonOp float and float as a BooleanType for operator: >...
 into f3 */
    set         f3, %l5
    add         %g0, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 23*/
/* Prepping Comparison Calculations by loading */
    set         50, %l0
    set         25, %l1
/* line number 23*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_8
    nop
    set         0, %l3
    ba      greaterEnd_8
    nop
greater_8:
    set         1, %l3
greaterEnd_8:
/* line number 23*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* setting i4 = Validating ComparisonOp int and int as a BooleanType for operator: >...
 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 24*/
/* Done. */
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Prepping Comparison Calculations by loading */
    set         50, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_9
    nop
    set         0, %l3
    ba      greaterEnd_9
    nop
greater_9:
    set         1, %l3
greaterEnd_9:
/* line number 24*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* setting i5 = Validating ComparisonOp int and int as a BooleanType for operator: >...
 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 25*/
/* Done. */
/* line number 25*/
/* Prepping Arithmetic Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 25*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 25*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Prepping Comparison Calculations by loading */
    set         -50, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 25*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_10
    nop
    set         0, %l3
    ba      greaterEnd_10
    nop
greater_10:
    set         1, %l3
greaterEnd_10:
/* line number 25*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 27*/
/* setting i6 = Validating ComparisonOp int and int as a BooleanType for operator: >...
 */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 27*/
/* Done. */
/* line number 27*/
/* Printing bool i0 */
    set         i0, %l1
    add         %g0, %l1, %l1
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
/* line number 27*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* Printing bool i1 */
    set         i1, %l1
    add         %g0, %l1, %l1
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
/* line number 28*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* Printing bool i2 */
    set         i2, %l1
    add         %g0, %l1, %l1
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
/* line number 29*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* Printing bool i3 */
    set         i3, %l1
    add         %g0, %l1, %l1
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
/* line number 30*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Printing bool i4 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_4
    nop
printTrue_4:
    set         _boolT, %o1
    ba      branchEnd_4
    nop
printFalse_4:
    set         _boolF, %o1
branchEnd_4:
    call    printf
    nop
/* line number 31*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Printing bool i5 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_5
    nop
printTrue_5:
    set         _boolT, %o1
    ba      branchEnd_5
    nop
printFalse_5:
    set         _boolF, %o1
branchEnd_5:
    call    printf
    nop
/* line number 32*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* Printing bool i6 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_6
    nop
printTrue_6:
    set         _boolT, %o1
    ba      branchEnd_6
    nop
printFalse_6:
    set         _boolF, %o1
branchEnd_6:
    call    printf
    nop
/* line number 33*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* Prepping Comparison Calculations by loading */
/* line number 38*/
/* Starting greater than */
/* line number 38*/
/* Storing variable 5.32 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_5, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 38*/
/* Storing variable 3.1 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_11
    nop
    set         0, %l3
    ba      greaterEnd_11
    nop
greater_11:
    set         1, %l3
greaterEnd_11:
/* line number 38*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 39*/
/* setting f4 = Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
    set         -44, %l0
    add         %fp, %l0, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 39*/
/* Done. */
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
/* line number 39*/
/* Adding */
    set         fx, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         fy, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 39*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 39*/
/* Prepping Comparison Calculations by loading */
/* line number 39*/
/* Starting greater than */
/* line number 39*/
/* Storing variable 94.3 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_6, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 39*/
/* Storing variable float + float into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -48, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_12
    nop
    set         0, %l3
    ba      greaterEnd_12
    nop
greater_12:
    set         1, %l3
greaterEnd_12:
/* line number 39*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 40*/
/* setting f5 = Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
    set         -56, %l0
    add         %fp, %l0, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 40*/
/* Done. */
/* line number 40*/
/* Prepping Arithmetic Calculations by loading */
/* line number 40*/
/* Adding */
    set         fx, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         fy, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 40*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 40*/
/* Prepping Comparison Calculations by loading */
/* line number 40*/
/* Starting greater than */
/* line number 40*/
/* Storing variable 97.24 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_7, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 40*/
/* Storing variable float + float into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -60, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_13
    nop
    set         0, %l3
    ba      greaterEnd_13
    nop
greater_13:
    set         1, %l3
greaterEnd_13:
/* line number 40*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 42*/
/* setting f6 = Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
    set         -68, %l0
    add         %fp, %l0, %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 42*/
/* Done. */
/* line number 42*/
/* Printing bool f0 */
    set         f0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_7
    nop
printTrue_7:
    set         _boolT, %o1
    ba      branchEnd_7
    nop
printFalse_7:
    set         _boolF, %o1
branchEnd_7:
    call    printf
    nop
/* line number 42*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 43*/
/* Printing bool f1 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_8
    nop
printTrue_8:
    set         _boolT, %o1
    ba      branchEnd_8
    nop
printFalse_8:
    set         _boolF, %o1
branchEnd_8:
    call    printf
    nop
/* line number 43*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* Printing bool f2 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_9
    nop
printTrue_9:
    set         _boolT, %o1
    ba      branchEnd_9
    nop
printFalse_9:
    set         _boolF, %o1
branchEnd_9:
    call    printf
    nop
/* line number 44*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Printing bool f3 */
    set         f3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_10
    nop
printTrue_10:
    set         _boolT, %o1
    ba      branchEnd_10
    nop
printFalse_10:
    set         _boolF, %o1
branchEnd_10:
    call    printf
    nop
/* line number 45*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* Printing bool f4 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_11
    nop
printTrue_11:
    set         _boolT, %o1
    ba      branchEnd_11
    nop
printFalse_11:
    set         _boolF, %o1
branchEnd_11:
    call    printf
    nop
/* line number 46*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 47*/
/* Printing bool f5 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_12
    nop
printTrue_12:
    set         _boolT, %o1
    ba      branchEnd_12
    nop
printFalse_12:
    set         _boolF, %o1
branchEnd_12:
    call    printf
    nop
/* line number 47*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 48*/
/* Printing bool f6 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_13
    nop
printTrue_13:
    set         _boolT, %o1
    ba      branchEnd_13
    nop
printFalse_13:
    set         _boolF, %o1
branchEnd_13:
    call    printf
    nop
/* line number 48*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 68) & -8
