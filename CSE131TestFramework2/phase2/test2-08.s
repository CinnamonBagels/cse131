! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gf,gi
gf:             .single      0r3.45      
float_0:        .single      0r6.7       
float_1:        .single      0r123.0     
float_2:        .single      0r101.22    
float_4:        .single      0r9.5       
float_5:        .single      0r5.5       
float_6:        .single      0r9.5       
gi:             .word        678         
str_3:          .asciz       " "         
str_7:          .asciz       " "         
str_8:          .asciz       " "         
str_9:          .asciz       " "         
str_10:         .asciz       " "         
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
/* setting li = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 10*/
/* Done. */
/* line number 12*/
/* setting lf = 6.7 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 13*/
/* setting ithree = 123 */
    set         123, %l0
    st          %l0, [%fp-16]
/* line number 13*/
/* Done. */
/* line number 15*/
/* setting fthree = 123.00 */
    set         -20, %l0
    add         %fp, %l0, %l0
/* line number 15*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Done. */
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading li to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Adding */
/* line number 15*/
/* Loading li to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading lf to %f1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Adding */
/* line number 15*/
/* Loading int + float to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading gf to %f1 */
    set         gf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading gi to %l1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Adding */
/* line number 15*/
/* Loading float + float to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading gi to %f1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading 100 to %l1 */
    set         100, %l1
/* line number 15*/
/* Adding */
/* line number 15*/
/* Loading float + int to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Storing variable 100 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         100, %l3
    st          %l3, [%l5]
/* line number 15*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Adding */
/* line number 15*/
/* Loading float + int to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Storing variable 101.22 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 15*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* setting lall = float + float */
    set         -44, %l0
    add         %fp, %l0, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* printing float STO.VarSTO@adb165 */
/* line number 17*/
/* Loading lall to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading 4 to %l0 */
    set         4, %l0
/* line number 17*/
/* Adding */
/* line number 17*/
/* Storing variable 4 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         4, %l3
    st          %l3, [%l5]
/* line number 17*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Storing variable 5.5 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         float_4, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
    set         float_6, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading gi to %l1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Starting Less than */
/* line number 18*/
/* Loading gf to %f0 */
    set         gf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading gi to %f1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbl     less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: <...
 */
/* line number 18*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: <...
 to %l0 */
    set         -48, %l1
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
/* line number 18*/
/* Done printing bool. */
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading gi to %l0 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Starting Less than */
/* line number 18*/
/* Loading gi to %f0 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading gf to %f1 */
    set         gf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbl     less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: <...
 */
/* line number 18*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: <...
 to %l0 */
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
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Prepping Comparison Calculations by loading */
/* line number 19*/
/* Loading gi to %l1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
/* Starting greater than */
/* line number 19*/
/* Loading gf to %f0 */
    set         gf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading gi to %f1 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 19*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Printing bool Validating ComparisonOp float and int as a BooleanType for operator: >...
 */
/* line number 19*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
    set         -56, %l1
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
/* line number 19*/
/* Done printing bool. */
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Prepping Comparison Calculations by loading */
/* line number 19*/
/* Loading gi to %l0 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Starting greater than */
/* line number 19*/
/* Loading gi to %f0 */
    set         gi, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading gf to %f1 */
    set         gf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* line number 19*/
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 19*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >...
 */
/* line number 19*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -60, %l1
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
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading ithree to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Starting == equal */
/* line number 20*/
/* Loading ithree to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading fthree to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbe     equal_4
    nop
    set         0, %l3
    ba      equalEnd_4
    nop
equal_4:
    set         1, %l3
equalEnd_4:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: ==...
 */
/* line number 20*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: ==...
 to %l0 */
    set         -64, %l1
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
/* line number 20*/
/* Done printing bool. */
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading ithree to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Starting not equal */
/* line number 20*/
/* Loading ithree to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading fthree to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbne    nEqual_5
    nop
    set         0, %l3
    ba      nEqualEnd_5
    nop
nEqual_5:
    set         1, %l3
nEqualEnd_5:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: !=...
 */
/* line number 20*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: !=...
 to %l0 */
    set         -68, %l1
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
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading ithree to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Starting Less than Equal */
/* line number 21*/
/* Loading ithree to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading fthree to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fble    lessEqual_6
    nop
    set         0, %l3
    ba      lessEqualEnd_6
    nop
lessEqual_6:
    set         1, %l3
lessEqualEnd_6:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: <=...
 */
/* line number 21*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: <=...
 to %l0 */
    set         -72, %l1
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
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading ithree to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Starting greater than equal */
/* line number 21*/
/* Loading ithree to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading fthree to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbge    greaterEqual_7
    nop
    set         0, %l3
    ba      greaterEqualEnd_7
    nop
greaterEqual_7:
    set         1, %l3
greaterEqualEnd_7:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Printing bool Validating ComparisonOp int and float as a BooleanType for operator: >=...
 */
/* line number 21*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >=...
 to %l0 */
    set         -76, %l1
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
/* line number 21*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 76) & -8
