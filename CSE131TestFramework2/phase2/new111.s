! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x
y:              .single      0r0.0       
float_0:        .single      0r5.55      
main_y:         .single      0r0.0       
float_1:        .single      0r3.33      
float_2:        .single      0r3.33      
float_3:        .single      0r1.11      
float_4:        .single      0r1.11      
float_5:        .single      0r3.33      
float_6:        .single      0r3.33      
float_7:        .single      0r3.33      
float_8:        .single      0r3.33      
float_9:        .single      0r3.33      
float_10:       .single      0r3.33      
float_11:       .single      0r3.33      
float_12:       .single      0r3.33      
float_13:       .single      0r3.33      
x:              .word        5           
staticGuard_y:    .word        0           
staticGuard_main_y:    .word        0           
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
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
    set         staticGuard_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_y:
    set         staticGuard_main_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_y
    nop
    set         staticGuard_main_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_y:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
! --storing constant y with value 5.55
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
! --storing constant y with value 3.33
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 9*/
/* Prepping Comparison Calculations by loading */
/* line number 9*/
/* Starting greater than */
/* line number 9*/
/* Storing variable 1.11 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Loading 1.11 to %f0 */
    set         float_3, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 9*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Loading 3.33 to %f1 */
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 9*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 9*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -8, %l1
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
/* line number 9*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Prepping Comparison Calculations by loading */
/* line number 10*/
/* Starting greater than */
/* line number 10*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 10*/
/* Loading 3.33 to %f0 */
    set         float_5, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 10*/
/* Storing variable 1.11 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 10*/
/* Loading 1.11 to %f1 */
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 10*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 10*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -12, %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Starting greater than */
/* line number 11*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 11*/
/* Loading 3.33 to %f0 */
    set         float_6, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 11*/
/* Storing variable y into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         main_y, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 11*/
/* Loading y to %f1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 11*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 11*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -16, %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Starting greater than */
/* line number 12*/
/* Loading y to %f0 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading 3.33 to %f1 */
    set         float_7, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* line number 12*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 12*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -20, %l1
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
/* line number 12*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Prepping Comparison Calculations by loading */
/* line number 13*/
/* Loading x to %l0 */
    set         3, %l0
/* line number 13*/
/* Starting greater than */
/* line number 13*/
/* Storing variable x into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 13*/
/* Loading x to %f0 */
    set         3, %f0
/* line number 13*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 13*/
/* Loading 3.33 to %f1 */
    set         float_8, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* line number 13*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >...
 */
/* line number 13*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -24, %l1
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
/* line number 13*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading x to %l1 */
    set         3, %l1
/* line number 14*/
/* Starting greater than */
/* line number 14*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_9, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 14*/
/* Loading 3.33 to %f0 */
    set         float_9, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 14*/
/* Storing variable x into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 14*/
/* Loading x to %f1 */
    set         3, %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_5
    nop
    set         0, %l3
    ba      greaterEnd_5
    nop
greater_5:
    set         1, %l3
greaterEnd_5:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >...
 */
/* line number 14*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
    set         -28, %l1
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
/* line number 14*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Prepping Comparison Calculations by loading */
/* line number 15*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Starting greater than */
/* line number 15*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_10, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 15*/
/* Loading 3.33 to %f0 */
    set         float_10, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 15*/
/* Storing variable x into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         x, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 15*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_6
    nop
    set         0, %l3
    ba      greaterEnd_6
    nop
greater_6:
    set         1, %l3
greaterEnd_6:
/* line number 15*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >...
 */
/* line number 15*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
    set         -32, %l1
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
/* line number 15*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Starting greater than */
/* line number 16*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading 3.33 to %f1 */
    set         float_11, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_7
    nop
    set         0, %l3
    ba      greaterEnd_7
    nop
greater_7:
    set         1, %l3
greaterEnd_7:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >...
 */
/* line number 16*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
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
/* line number 16*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Starting greater than */
/* line number 17*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading 3.33 to %f1 */
    set         float_12, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_8
    nop
    set         0, %l3
    ba      greaterEnd_8
    nop
greater_8:
    set         1, %l3
greaterEnd_8:
/* line number 17*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 17*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Starting greater than */
/* line number 18*/
/* Storing variable 3.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_13, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 18*/
/* Loading 3.33 to %f0 */
    set         float_13, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 18*/
/* Storing variable y into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         y, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 18*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_9
    nop
    set         0, %l3
    ba      greaterEnd_9
    nop
greater_9:
    set         1, %l3
greaterEnd_9:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 18*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
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
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Prepping Comparison Calculations by loading */
/* line number 19*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 19*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
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
/* line number 19*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Printing bool Validating ComparisonOp int and int as a BooleanType for operator: >...
 */
/* line number 19*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
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
/* line number 19*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 20*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_11
    nop
    set         0, %l3
    ba      greaterEnd_11
    nop
greater_11:
    set         1, %l3
greaterEnd_11:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* Printing bool Validating ComparisonOp int and int as a BooleanType for operator: >...
 */
/* line number 20*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -52, %l1
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
/* line number 20*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 21*/
/* Starting greater than */
/* line number 21*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading 3 to %f1 */
    set         3, %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_12
    nop
    set         0, %l3
    ba      greaterEnd_12
    nop
greater_12:
    set         1, %l3
greaterEnd_12:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >...
 */
/* line number 21*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
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
/* line number 21*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Prepping Comparison Calculations by loading */
/* line number 22*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 22*/
/* Starting greater than */
/* line number 22*/
/* Storing variable 3 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 22*/
/* Loading 3 to %f0 */
    set         3, %f0
/* line number 22*/
/* Storing variable y into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         y, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 22*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_13
    nop
    set         0, %l3
    ba      greaterEnd_13
    nop
greater_13:
    set         1, %l3
greaterEnd_13:
/* line number 22*/
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >...
 */
/* line number 22*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -60, %l1
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
/* line number 22*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 60) & -8
