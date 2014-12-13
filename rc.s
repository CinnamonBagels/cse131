! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r4.5       
str_1:          .asciz       "ahha"      
str_2:          .asciz       "asdfsd"    
str_3:          .asciz       "1234"      
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
/* line number 4*/
/* setting y = 4.5 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 4*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 4*/
/* Done. */
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
/* line number 4*/
/* Loading -1 to %l1 */
    set         -1, %l1
/* line number 4*/
/* Multiplying */
/* line number 4*/
/* Loading y to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 4*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
/* line number 4*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 4*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
/* line number 4*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 4*/
/* Adding */
/* line number 4*/
/* Storing variable 5 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 4*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 4*/
/* Loading float * int to %f1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 4*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 6*/
/* setting x = int + float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 6*/
/* Done. */
while_0:
/* line number 6*/
/* Prepping Comparison Calculations by loading */
/* line number 6*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 6*/
/* Starting greater than */
/* line number 6*/
/* Loading y to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 6*/
/* Storing variable 0 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         0, %l3
    st          %l3, [%l5]
/* line number 6*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 6*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Decrementing */
/* line number 9*/
/* Loading y to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fadds       %f2, %f1, %f2
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 11*/
/* Continuing while loop */
    ba      while_0
    nop
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      while_0
    nop
whileEnd_0:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 28) & -8
