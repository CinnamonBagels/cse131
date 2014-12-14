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
float_7:        .single      0r3.0       
float_8:        .single      0r3.0       
float_9:        .single      0r3.0       
float_10:       .single      0r6.33      
float_11:       .single      0r3.33      
float_12:       .single      0r6.33      
float_13:       .single      0r3.33      
float_14:       .single      0r6.33      
float_15:       .single      0r3.33      
float_16:       .single      0r3.33      
float_17:       .single      0r6.33      
float_18:       .single      0r3.33      
float_19:       .single      0r3.33      
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
/* line number 10*/
/* Storing parameter z */
    st          %i2, [%fp+76]
/* line number 13*/
/* setting a = false */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Prepping Comparison Calculations by loading */
/* line number 13*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading z to %l1 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_0
    nop
    set         0, %l3
    ba      equalEnd_0
    nop
equal_0:
    set         1, %l3
equalEnd_0:
/* line number 13*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 13*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -12, %l1
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
/* line number 13*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading z to %l0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading a to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_1
    nop
    set         0, %l3
    ba      equalEnd_1
    nop
equal_1:
    set         1, %l3
equalEnd_1:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 14*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -16, %l1
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
/* line number 14*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Starting == equal */
/* line number 16*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_2
    nop
    set         0, %l3
    ba      equalEnd_2
    nop
equal_2:
    set         1, %l3
equalEnd_2:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 16*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
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
/* line number 16*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Starting == equal */
/* line number 17*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading x to %f1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbe     equal_3
    nop
    set         0, %l3
    ba      equalEnd_3
    nop
equal_3:
    set         1, %l3
equalEnd_3:
/* line number 17*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: ==...
 */
/* line number 17*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: ==...
 to %l0 */
    set         -24, %l1
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 19*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Prepping Comparison Calculations by loading */
/* line number 19*/
/* Loading int + int to %l1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
/* Starting == equal */
/* line number 19*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading int + int to %f1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbe     equal_4
    nop
    set         0, %l3
    ba      equalEnd_4
    nop
equal_4:
    set         1, %l3
equalEnd_4:
/* line number 19*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: ==...
 */
/* line number 19*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: ==...
 to %l0 */
    set         -32, %l1
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
/* line number 19*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Multiplying */
/* line number 20*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Starting == equal */
/* line number 20*/
/* Loading int * float to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_5
    nop
    set         0, %l3
    ba      equalEnd_5
    nop
equal_5:
    set         1, %l3
equalEnd_5:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 20*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -40, %l1
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
/* line number 20*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 21*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 21*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
    call    foo1
    nop
/* line number 21*/
/* Saving return value on to stack */
    st          %f0, [%fp+-48]
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading int / int to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Starting == equal */
/* line number 21*/
/* Loading int / int to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading foo1() to %f1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_6
    nop
    set         0, %l3
    ba      equalEnd_6
    nop
equal_6:
    set         1, %l3
equalEnd_6:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 21*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -52, %l1
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
/* line number 21*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
/* line number 23*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 23*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 23*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 23*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
/* line number 23*/
/* Multiplying */
/* line number 23*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 23*/
/* Loading y to %f1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 23*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* Prepping Comparison Calculations by loading */
/* line number 23*/
/* Loading int * int to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 23*/
/* Starting == equal */
/* line number 23*/
/* Loading int * int to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 23*/
/* Loading float * float to %f1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_7
    nop
    set         0, %l3
    ba      equalEnd_7
    nop
equal_7:
    set         1, %l3
equalEnd_7:
/* line number 23*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Returning value from foo2 */
/* line number 24*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %i0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo2_end
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 64) & -8
                .section     ".text"
                .align 4
                .global      foo3
foo3:
    set         SAVE.foo3, %g1
    save        %sp, %g1, %sp
/* line number 29*/
/* Returning value from foo3 */
    set         0, %i0
    ba      foo3_end
    nop
foo3_end:
    ret 
    restore
SAVE.foo3 = -(92 + 4) & -8
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
/* line number 36*/
/* Prepping Comparison Calculations by loading */
/* line number 36*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 36*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 36*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_8
    nop
    set         0, %l3
    ba      equalEnd_8
    nop
equal_8:
    set         1, %l3
equalEnd_8:
/* line number 36*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 36*/
/* Printing bool Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 36*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -8, %l1
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
/* line number 36*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Prepping Comparison Calculations by loading */
/* line number 37*/
/* Starting == equal */
/* line number 37*/
/* Storing variable 4.44 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 37*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 37*/
/* Storing variable 4.44 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 37*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_9
    nop
    set         0, %l3
    ba      equalEnd_9
    nop
equal_9:
    set         1, %l3
equalEnd_9:
/* line number 37*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 37*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -12, %l1
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
/* line number 37*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* Prepping Arithmetic Calculations by loading */
/* line number 38*/
/* Loading x to %l0 */
    set         3, %l0
/* line number 38*/
/* Adding */
/* line number 38*/
/* Storing variable x into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 38*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 38*/
/* Storing variable .33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 38*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 38*/
/* Storing result of Binary Op */
    set         float_4, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 38*/
/* Prepping Comparison Calculations by loading */
/* line number 38*/
/* Starting == equal */
/* line number 38*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 38*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 38*/
/* Loading y to %f1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_10
    nop
    set         0, %l3
    ba      equalEnd_10
    nop
equal_10:
    set         1, %l3
equalEnd_10:
/* line number 38*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 38*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 38*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -16, %l1
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
/* line number 38*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
/* line number 39*/
/* Subtracting */
/* line number 39*/
/* Loading y to %f0 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Storing variable .33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 39*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 39*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 39*/
/* Prepping Comparison Calculations by loading */
/* line number 39*/
/* Loading x to %l0 */
    set         3, %l0
/* line number 39*/
/* Starting == equal */
/* line number 39*/
/* Storing variable x into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 39*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Loading float - float to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_11
    nop
    set         0, %l3
    ba      equalEnd_11
    nop
equal_11:
    set         1, %l3
equalEnd_11:
/* line number 39*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 39*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 39*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -24, %l1
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
/* line number 39*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 40*/
/* Prepping Comparison Calculations by loading */
/* line number 40*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 40*/
/* Starting == equal */
/* line number 40*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 40*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 40*/
/* Storing variable 3.00 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 40*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_12
    nop
    set         0, %l3
    ba      equalEnd_12
    nop
equal_12:
    set         1, %l3
equalEnd_12:
/* line number 40*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 40*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 40*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -28, %l1
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
/* line number 40*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 41*/
/* Saving return value on to stack */
    st          %f0, [%fp+-32]
/* line number 41*/
/* Prepping Comparison Calculations by loading */
/* line number 41*/
/* Starting == equal */
/* line number 41*/
/* Loading foo1() to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 41*/
/* Storing variable 3.00 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 41*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_13
    nop
    set         0, %l3
    ba      equalEnd_13
    nop
equal_13:
    set         1, %l3
equalEnd_13:
/* line number 41*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 41*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 41*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -36, %l1
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
/* line number 41*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 42*/
/* Saving return value on to stack */
    st          %f0, [%fp+-40]
/* line number 42*/
/* Prepping Comparison Calculations by loading */
/* line number 42*/
/* Starting == equal */
/* line number 42*/
/* Storing variable 3.00 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_9, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 42*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 42*/
/* Loading foo1() to %f1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_14
    nop
    set         0, %l3
    ba      equalEnd_14
    nop
equal_14:
    set         1, %l3
equalEnd_14:
/* line number 42*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 42*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 42*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -44, %l1
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
/* line number 42*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 43*/
/* Saving return value on to stack */
    st          %f0, [%fp+-48]
/* line number 43*/
/* Prepping Comparison Calculations by loading */
/* line number 43*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 43*/
/* Starting == equal */
/* line number 43*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 43*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 43*/
/* Loading foo1() to %f1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_15
    nop
    set         0, %l3
    ba      equalEnd_15
    nop
equal_15:
    set         1, %l3
equalEnd_15:
/* line number 43*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 43*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 43*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -52, %l1
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
/* line number 43*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 44*/
/* Saving return value on to stack */
    st          %f0, [%fp+-56]
/* line number 44*/
/* Prepping Comparison Calculations by loading */
/* line number 44*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 44*/
/* Starting == equal */
/* line number 44*/
/* Loading foo1() to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 44*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 44*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbe     equal_16
    nop
    set         0, %l3
    ba      equalEnd_16
    nop
equal_16:
    set         1, %l3
equalEnd_16:
/* line number 44*/
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 44*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: ==...
 */
/* line number 44*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: ==...
 to %l0 */
    set         -60, %l1
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
/* line number 44*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Prepping Comparison Calculations by loading */
/* line number 45*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 45*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 45*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_17
    nop
    set         0, %l3
    ba      equalEnd_17
    nop
equal_17:
    set         1, %l3
equalEnd_17:
/* line number 45*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 45*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 45*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -64, %l1
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
/* line number 45*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* Prepping Comparison Calculations by loading */
/* line number 46*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 46*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 46*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_18
    nop
    set         0, %l3
    ba      equalEnd_18
    nop
equal_18:
    set         1, %l3
equalEnd_18:
/* line number 46*/
/* Storing result of Comparison Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 46*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 46*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -68, %l1
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
/* line number 46*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 47*/
/* Saving return value on to stack */
    st          %o0, [%fp+-72]
    call    foo3
    nop
/* line number 47*/
/* Saving return value on to stack */
    st          %o0, [%fp+-76]
/* line number 47*/
/* Prepping Comparison Calculations by loading */
/* line number 47*/
/* Loading foo3() to %l0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 47*/
/* Loading foo3() to %l1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 47*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_19
    nop
    set         0, %l3
    ba      equalEnd_19
    nop
equal_19:
    set         1, %l3
equalEnd_19:
/* line number 47*/
/* Storing result of Comparison Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 47*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 47*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_18
    nop
printTrue_18:
    set         _boolT, %o1
    ba      branchEnd_18
    nop
printFalse_18:
    set         _boolF, %o1
branchEnd_18:
    call    printf
    nop
/* line number 47*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 50*/
/* Prepping Comparison Calculations by loading */
/* line number 50*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 50*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 50*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_20
    nop
    set         0, %l3
    ba      equalEnd_20
    nop
equal_20:
    set         1, %l3
equalEnd_20:
/* line number 50*/
/* Storing result of Comparison Op */
    set         -84, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 50*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 50*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_19
    nop
printTrue_19:
    set         _boolT, %o1
    ba      branchEnd_19
    nop
printFalse_19:
    set         _boolF, %o1
branchEnd_19:
    call    printf
    nop
/* line number 50*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* Prepping Comparison Calculations by loading */
/* line number 51*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 51*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 51*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_21
    nop
    set         0, %l3
    ba      equalEnd_21
    nop
equal_21:
    set         1, %l3
equalEnd_21:
/* line number 51*/
/* Storing result of Comparison Op */
    set         -88, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 51*/
/* Printing bool Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 */
/* line number 51*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_20
    nop
printTrue_20:
    set         _boolT, %o1
    ba      branchEnd_20
    nop
printFalse_20:
    set         _boolF, %o1
branchEnd_20:
    call    printf
    nop
/* line number 51*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 53*/
/* Prepping Arithmetic Calculations by loading */
/* line number 53*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 53*/
/* Adding */
/* line number 53*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_11, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 53*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 53*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 53*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 53*/
/* Storing result of Binary Op */
    set         float_10, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 53*/
/* Prepping Comparison Calculations by loading */
/* line number 53*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 53*/
/* Starting == equal */
/* line number 53*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 53*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 53*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_10, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 53*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_22
    nop
    set         0, %l3
    ba      equalEnd_22
    nop
equal_22:
    set         1, %l3
equalEnd_22:
/* line number 53*/
/* Storing result of Comparison Op */
    set         -92, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 53*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 53*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_21
    nop
printTrue_21:
    set         _boolT, %o1
    ba      branchEnd_21
    nop
printFalse_21:
    set         _boolF, %o1
branchEnd_21:
    call    printf
    nop
/* line number 53*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* Prepping Arithmetic Calculations by loading */
/* line number 54*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 54*/
/* Adding */
/* line number 54*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_13, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 54*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 54*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 54*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 54*/
/* Storing result of Binary Op */
    set         float_12, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 54*/
/* Prepping Comparison Calculations by loading */
/* line number 54*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 54*/
/* Starting == equal */
/* line number 54*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_12, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 54*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 54*/
/* Storing variable 3 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 54*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbe     equal_23
    nop
    set         0, %l3
    ba      equalEnd_23
    nop
equal_23:
    set         1, %l3
equalEnd_23:
/* line number 54*/
/* Storing result of Comparison Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 54*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: ==...
 */
/* line number 54*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: ==...
 to %l0 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_22
    nop
printTrue_22:
    set         _boolT, %o1
    ba      branchEnd_22
    nop
printFalse_22:
    set         _boolF, %o1
branchEnd_22:
    call    printf
    nop
/* line number 54*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 56*/
/* Prepping Arithmetic Calculations by loading */
/* line number 56*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 56*/
/* Adding */
/* line number 56*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_15, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 56*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 56*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 56*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 56*/
/* Storing result of Binary Op */
    set         float_14, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 56*/
/* Prepping Comparison Calculations by loading */
/* line number 56*/
/* Starting == equal */
/* line number 56*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_14, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 56*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 56*/
/* Storing variable 3.33 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_16, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 56*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_24
    nop
    set         0, %l3
    ba      equalEnd_24
    nop
equal_24:
    set         1, %l3
equalEnd_24:
/* line number 56*/
/* Storing result of Comparison Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 56*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 56*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_23
    nop
printTrue_23:
    set         _boolT, %o1
    ba      branchEnd_23
    nop
printFalse_23:
    set         _boolF, %o1
branchEnd_23:
    call    printf
    nop
/* line number 56*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 57*/
/* Prepping Arithmetic Calculations by loading */
/* line number 57*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 57*/
/* Adding */
/* line number 57*/
/* Storing variable 3.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_18, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 57*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 57*/
/* Storing variable 3 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 57*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 57*/
/* Storing result of Binary Op */
    set         float_17, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 57*/
/* Prepping Comparison Calculations by loading */
/* line number 57*/
/* Starting == equal */
/* line number 57*/
/* Storing variable 3.33 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_19, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 57*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 57*/
/* Storing variable Arithmetic Op into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_17, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 57*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_25
    nop
    set         0, %l3
    ba      equalEnd_25
    nop
equal_25:
    set         1, %l3
equalEnd_25:
/* line number 57*/
/* Storing result of Comparison Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 57*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: ==...
 */
/* line number 57*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_24
    nop
printTrue_24:
    set         _boolT, %o1
    ba      branchEnd_24
    nop
printFalse_24:
    set         _boolF, %o1
branchEnd_24:
    call    printf
    nop
/* line number 57*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 59*/
/* Saving return value on to stack */
    st          %f0, [%fp+-108]
/* line number 59*/
/* Prepping Comparison Calculations by loading */
/* line number 59*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 59*/
/* Starting == equal */
/* line number 59*/
/* Storing variable 5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 59*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 59*/
/* Loading foo1() to %f1 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_26
    nop
    set         0, %l3
    ba      equalEnd_26
    nop
equal_26:
    set         1, %l3
equalEnd_26:
/* line number 59*/
/* Storing result of Comparison Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 59*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 59*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_25
    nop
printTrue_25:
    set         _boolT, %o1
    ba      branchEnd_25
    nop
printFalse_25:
    set         _boolF, %o1
branchEnd_25:
    call    printf
    nop
/* line number 59*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 60*/
/* Saving return value on to stack */
    st          %f0, [%fp+-116]
    call    foo1
    nop
/* line number 60*/
/* Saving return value on to stack */
    st          %f0, [%fp+-120]
/* line number 60*/
/* Prepping Arithmetic Calculations by loading */
/* line number 60*/
/* Adding */
/* line number 60*/
/* Loading foo1() to %f0 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 60*/
/* Loading foo1() to %f1 */
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 60*/
/* Storing result of Binary Op */
    set         -124, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 60*/
/* Prepping Comparison Calculations by loading */
/* line number 60*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 60*/
/* Starting == equal */
/* line number 60*/
/* Storing variable 5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 60*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 60*/
/* Loading float + float to %f1 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_27
    nop
    set         0, %l3
    ba      equalEnd_27
    nop
equal_27:
    set         1, %l3
equalEnd_27:
/* line number 60*/
/* Storing result of Comparison Op */
    set         -128, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 60*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 60*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_26
    nop
printTrue_26:
    set         _boolT, %o1
    ba      branchEnd_26
    nop
printFalse_26:
    set         _boolF, %o1
branchEnd_26:
    call    printf
    nop
/* line number 60*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 61*/
/* Saving return value on to stack */
    st          %f0, [%fp+-132]
/* line number 61*/
/* Prepping Arithmetic Calculations by loading */
/* line number 61*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 61*/
/* Adding */
/* line number 61*/
/* Storing variable 5 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 61*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 61*/
/* Loading foo1() to %f1 */
    set         -132, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 61*/
/* Storing result of Binary Op */
    set         -136, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 61*/
/* Prepping Comparison Calculations by loading */
/* line number 61*/
/* Loading x to %l1 */
    set         3, %l1
/* line number 61*/
/* Starting == equal */
/* line number 61*/
/* Loading int + float to %f0 */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 61*/
/* Storing variable x into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 61*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbe     equal_28
    nop
    set         0, %l3
    ba      equalEnd_28
    nop
equal_28:
    set         1, %l3
equalEnd_28:
/* line number 61*/
/* Storing result of Comparison Op */
    set         -140, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 61*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: ==...
 */
/* line number 61*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: ==...
 to %l0 */
    set         -140, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_27
    nop
printTrue_27:
    set         _boolT, %o1
    ba      branchEnd_27
    nop
printFalse_27:
    set         _boolF, %o1
branchEnd_27:
    call    printf
    nop
/* line number 61*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 63*/
/* Preparing argument x */
/* line number 63*/
/* Loading x to %o0 */
    set         3, %o0
/* line number 63*/
/* Preparing argument y */
/* line number 63*/
/* Loading y to %f1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* line number 63*/
/* Preparing argument true */
/* line number 63*/
/* Loading true to %o2 */
    set         1, %o2
    call    foo2
    nop
/* line number 63*/
/* Saving return value on to stack */
    st          %o0, [%fp+-144]
/* line number 63*/
/* Printing bool foo2() */
/* line number 63*/
/* Loading foo2() to %l0 */
    set         -144, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_28
    nop
printTrue_28:
    set         _boolT, %o1
    ba      branchEnd_28
    nop
printFalse_28:
    set         _boolF, %o1
branchEnd_28:
    call    printf
    nop
/* line number 63*/
/* Done printing bool. */
/* line number 65*/
/* Preparing argument x */
/* line number 65*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 65*/
/* Preparing argument y */
/* line number 65*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* line number 65*/
/* Preparing argument true */
/* line number 65*/
/* Loading true to %o2 */
    set         1, %o2
    call    foo2
    nop
/* line number 65*/
/* Saving return value on to stack */
    st          %o0, [%fp+-148]
/* line number 65*/
/* Printing bool foo2() */
/* line number 65*/
/* Loading foo2() to %l0 */
    set         -148, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_29
    nop
printTrue_29:
    set         _boolT, %o1
    ba      branchEnd_29
    nop
printFalse_29:
    set         _boolF, %o1
branchEnd_29:
    call    printf
    nop
/* line number 65*/
/* Done printing bool. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 148) & -8
