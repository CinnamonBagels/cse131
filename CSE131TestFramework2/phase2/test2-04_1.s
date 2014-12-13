! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r1.1       
float_1:        .single      0r2.2       
str_2:          .asciz       " > "       
str_3:          .asciz       " ? "       
str_4:          .asciz       " indeed"   
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
/* line number 6*/
/* setting onePointOne = 1.1 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 6*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 6*/
/* Done. */
/* line number 8*/
/* setting twoPointTwo = 2.2 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 8*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* printing float STO.VarSTO@24de67 */
/* line number 8*/
/* Loading twoPointTwo to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing float STO.VarSTO@fc4957 */
/* line number 8*/
/* Loading onePointOne to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* Prepping Comparison Calculations by loading */
/* line number 8*/
/* Starting greater than */
/* line number 8*/
/* Loading twoPointTwo to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 8*/
/* Loading onePointOne to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
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
/* line number 8*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* Printing bool Validating ComparisonOp float and float as a BooleanType for operator: >...
 */
/* line number 8*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -16, %l1
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
/* line number 8*/
/* Done printing bool. */
/* line number 10*/
/* Prepping Comparison Calculations by loading */
/* line number 10*/
/* Starting greater than */
/* line number 10*/
/* Loading twoPointTwo to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Loading onePointOne to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
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
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
