! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x
y:              .single      0r0.0       
float_0:        .single      0r5.55      
main_y:         .single      0r0.0       
float_1:        .single      0r3.33      
float_2:        .single      0r4.44      
float_3:        .single      0r4.44      
float_4:        .single      0r3.33      
float_5:        .single      0r0.33      
float_6:        .single      0r0.33      
float_7:        .single      0r6.33      
float_8:        .single      0r3.33      
float_9:        .single      0r6.33      
float_10:       .single      0r3.33      
float_11:       .single      0r6.33      
float_12:       .single      0r3.33      
float_13:       .single      0r3.33      
float_14:       .single      0r6.33      
float_15:       .single      0r3.33      
float_16:       .single      0r3.33      
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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
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
/* line number 7*/
/* Returning value from foo1 */
    set         3, %l0
    st          %l0, [%fp - 4]
    ld          [%fp - 4], %f0
    fitos       %f0, %f0
    ba      foo1_end
    nop
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 10*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 10*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 11*/
/* Starting greater than equal */
/* line number 11*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_0
    nop
    set         0, %l3
    ba      greaterEqualEnd_0
    nop
greaterEqual_0:
    set         1, %l3
greaterEqualEnd_0:
/* line number 11*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 11*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Starting greater than equal */
/* line number 12*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading x to %f1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
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
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >=...
 */
/* line number 12*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >=...
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
/* line number 12*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading int + int to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Starting greater than equal */
/* line number 14*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 14*/
/* Loading int + int to %f1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_2
    nop
    set         0, %l3
    ba      greaterEqualEnd_2
    nop
greaterEqual_2:
    set         1, %l3
greaterEqualEnd_2:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >=...
 */
/* line number 14*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >=...
 to %l0 */
    set         -20, %l1
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
/* line number 14*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Multiplying */
/* line number 15*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* Prepping Comparison Calculations by loading */
/* line number 15*/
/* Starting greater than equal */
/* line number 15*/
/* Loading int * float to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_3
    nop
    set         0, %l3
    ba      greaterEqualEnd_3
    nop
greaterEqual_3:
    set         1, %l3
greaterEqualEnd_3:
/* line number 15*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* line number 15*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -28, %l1
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
/* line number 15*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 16*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
    call    foo1
    nop
/* line number 16*/
/* Saving return value on to stack */
    st          %f0, [%fp+-36]
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading int / int to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Starting greater than equal */
/* line number 16*/
/* Loading int / int to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading foo1() to %f1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_4
    nop
    set         0, %l3
    ba      greaterEqualEnd_4
    nop
greaterEqual_4:
    set         1, %l3
greaterEqualEnd_4:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 16*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -40, %l1
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
/* line number 16*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 18*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Multiplying */
/* line number 18*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading int * int to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Starting greater than equal */
/* line number 18*/
/* Loading int * int to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading float * float to %f1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_5
    nop
    set         0, %l3
    ba      greaterEqualEnd_5
    nop
greaterEqual_5:
    set         1, %l3
greaterEqualEnd_5:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Returning value from foo2 */
/* line number 19*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %i0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo2_end
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 52) & -8
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
! --storing constant y with value 5.55
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
! --storing constant y with value 3.33
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 26*/
/* Prepping Comparison Calculations by loading */
/* line number 26*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 26*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 26*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_6
    nop
    set         0, %l3
    ba      greaterEqualEnd_6
    nop
greaterEqual_6:
    set         1, %l3
greaterEqualEnd_6:
/* line number 26*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 26*/
/* Printing bool Validating ComparisonOp int and int as a BooleanType for operator: >=...
 */
/* line number 26*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >=...
 to %l0 */
    set         -8, %l1
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
/* line number 26*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* Prepping Comparison Calculations by loading */
/* line number 27*/
/* Starting greater than equal */
/* line number 27*/
/* Storing variable 4.44 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 27*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 27*/
/* Storing variable 4.44 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 27*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_7
    nop
    set         0, %l3
    ba      greaterEqualEnd_7
    nop
greaterEqual_7:
    set         1, %l3
greaterEqualEnd_7:
/* line number 27*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 27*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* line number 27*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -12, %l1
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
/* line number 27*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* Prepping Arithmetic Calculations by loading */
/* line number 28*/
/* Loading x to %l0 */
    set         3, %l0
/* line number 28*/
/* Adding */
/* line number 28*/
/* Storing variable x into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 28*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 28*/
/* Storing variable .33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 28*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 28*/
/* Storing result of Binary Op */
    set         float_4, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 28*/
/* Prepping Comparison Calculations by loading */
/* line number 28*/
/* Starting greater than equal */
/* line number 28*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 28*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 28*/
/* Loading y to %f1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_8
    nop
    set         0, %l3
    ba      greaterEqualEnd_8
    nop
greaterEqual_8:
    set         1, %l3
greaterEqualEnd_8:
/* line number 28*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 28*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* line number 28*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -16, %l1
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
/* line number 28*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
/* line number 29*/
/* Subtracting */
/* line number 29*/
/* Loading y to %f0 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 29*/
/* Storing variable .33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 29*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 29*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 29*/
/* Prepping Comparison Calculations by loading */
/* line number 29*/
/* Loading x to %l0 */
    set         3, %l0
/* line number 29*/
/* Starting greater than equal */
/* line number 29*/
/* Storing variable x into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 29*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 29*/
/* Loading float - float to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_9
    nop
    set         0, %l3
    ba      greaterEqualEnd_9
    nop
greaterEqual_9:
    set         1, %l3
greaterEqualEnd_9:
/* line number 29*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 29*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -24, %l1
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
/* line number 29*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
/* line number 31*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 31*/
/* Adding */
/* line number 31*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 31*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 31*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 31*/
/* Storing result of Binary Op */
    set         float_7, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 31*/
/* Prepping Comparison Calculations by loading */
/* line number 31*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 31*/
/* Starting greater than equal */
/* line number 31*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 31*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 31*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_10
    nop
    set         0, %l3
    ba      greaterEqualEnd_10
    nop
greaterEqual_10:
    set         1, %l3
greaterEqualEnd_10:
/* line number 31*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 31*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 31*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -28, %l1
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
/* line number 31*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
/* line number 32*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 32*/
/* Adding */
/* line number 32*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_10, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 32*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 32*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 32*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 32*/
/* Storing result of Binary Op */
    set         float_9, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 32*/
/* Prepping Comparison Calculations by loading */
/* line number 32*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 32*/
/* Starting greater than equal */
/* line number 32*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_9, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 32*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 32*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 32*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_11
    nop
    set         0, %l3
    ba      greaterEqualEnd_11
    nop
greaterEqual_11:
    set         1, %l3
greaterEqualEnd_11:
/* line number 32*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 32*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >=...
 */
/* line number 32*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >=...
 to %l0 */
    set         -32, %l1
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
/* line number 32*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* Prepping Arithmetic Calculations by loading */
/* line number 34*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 34*/
/* Adding */
/* line number 34*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_12, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 34*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 34*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 34*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 34*/
/* Storing result of Binary Op */
    set         float_11, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 34*/
/* Prepping Comparison Calculations by loading */
/* line number 34*/
/* Starting greater than equal */
/* line number 34*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_11, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 34*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 34*/
/* Storing variable 3.33 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_13, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 34*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_12
    nop
    set         0, %l3
    ba      greaterEqualEnd_12
    nop
greaterEqual_12:
    set         1, %l3
greaterEqualEnd_12:
/* line number 34*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 34*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* line number 34*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -36, %l1
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
/* line number 34*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* Prepping Arithmetic Calculations by loading */
/* line number 35*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 35*/
/* Adding */
/* line number 35*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_15, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 35*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 35*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 35*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 35*/
/* Storing result of Binary Op */
    set         float_14, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 35*/
/* Prepping Comparison Calculations by loading */
/* line number 35*/
/* Starting greater than equal */
/* line number 35*/
/* Storing variable 3.33 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_16, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 35*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 35*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_14, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 35*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_13
    nop
    set         0, %l3
    ba      greaterEqualEnd_13
    nop
greaterEqual_13:
    set         1, %l3
greaterEqualEnd_13:
/* line number 35*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 35*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* line number 35*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -40, %l1
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
/* line number 35*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 37*/
/* Saving return value on to stack */
    st          %f0, [%fp+-44]
/* line number 37*/
/* Prepping Comparison Calculations by loading */
/* line number 37*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 37*/
/* Starting greater than equal */
/* line number 37*/
/* Storing variable 5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 37*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 37*/
/* Loading foo1() to %f1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_14
    nop
    set         0, %l3
    ba      greaterEqualEnd_14
    nop
greaterEqual_14:
    set         1, %l3
greaterEqualEnd_14:
/* line number 37*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 37*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -48, %l1
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
/* line number 37*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 38*/
/* Saving return value on to stack */
    st          %f0, [%fp+-52]
    call    foo1
    nop
/* line number 38*/
/* Saving return value on to stack */
    st          %f0, [%fp+-56]
/* line number 38*/
/* Prepping Arithmetic Calculations by loading */
/* line number 38*/
/* Adding */
/* line number 38*/
/* Loading foo1() to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 38*/
/* Loading foo1() to %f1 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 38*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 38*/
/* Prepping Comparison Calculations by loading */
/* line number 38*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 38*/
/* Starting greater than equal */
/* line number 38*/
/* Storing variable 5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 38*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 38*/
/* Loading float + float to %f1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_15
    nop
    set         0, %l3
    ba      greaterEqualEnd_15
    nop
greaterEqual_15:
    set         1, %l3
greaterEqualEnd_15:
/* line number 38*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 38*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 38*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_14
    nop
printTrue_14:
    set         _boolT, %o1
    ba      branchEnd_14
    nop
printFalse_14:
    set         _boolF, %o1
branchEnd_14:
    call    printf
    nop
/* line number 38*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 39*/
/* Saving return value on to stack */
    st          %f0, [%fp+-68]
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
/* line number 39*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 39*/
/* Adding */
/* line number 39*/
/* Storing variable 5 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 39*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Loading foo1() to %f1 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 39*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 39*/
/* Prepping Comparison Calculations by loading */
/* line number 39*/
/* Loading x to %l1 */
    set         3, %l1
/* line number 39*/
/* Starting greater than equal */
/* line number 39*/
/* Loading int + float to %f0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Storing variable x into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 39*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_16
    nop
    set         0, %l3
    ba      greaterEqualEnd_16
    nop
greaterEqual_16:
    set         1, %l3
greaterEqualEnd_16:
/* line number 39*/
/* Storing result of Comparison Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 39*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >=...
 */
/* line number 39*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >=...
 to %l0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_15
    nop
printTrue_15:
    set         _boolT, %o1
    ba      branchEnd_15
    nop
printFalse_15:
    set         _boolF, %o1
branchEnd_15:
    call    printf
    nop
/* line number 39*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* Preparing argument x */
/* line number 41*/
/* Loading x to %o0 */
    set         3, %o0
/* line number 41*/
/* Preparing argument y */
/* line number 41*/
/* Loading y to %f1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    call    foo2
    nop
/* line number 41*/
/* Saving return value on to stack */
    st          %o0, [%fp+-80]
/* line number 41*/
/* Printing bool foo2() */
/* line number 41*/
/* Loading foo2() to %l0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_16
    nop
printTrue_16:
    set         _boolT, %o1
    ba      branchEnd_16
    nop
printFalse_16:
    set         _boolF, %o1
branchEnd_16:
    call    printf
    nop
/* line number 41*/
/* Done printing bool. */
/* line number 43*/
/* Preparing argument x */
/* line number 43*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 43*/
/* Preparing argument y */
/* line number 43*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    call    foo2
    nop
/* line number 43*/
/* Saving return value on to stack */
    st          %o0, [%fp+-84]
/* line number 43*/
/* Printing bool foo2() */
/* line number 43*/
/* Loading foo2() to %l0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_17
    nop
printTrue_17:
    set         _boolT, %o1
    ba      branchEnd_17
    nop
printFalse_17:
    set         _boolF, %o1
branchEnd_17:
    call    printf
    nop
/* line number 43*/
/* Done printing bool. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 84) & -8
