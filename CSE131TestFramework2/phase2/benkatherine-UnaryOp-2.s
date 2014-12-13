! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .single      0r5.0       
b:              .single      0r10.0      
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
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
/* line number 29*/
/* Multiplying */
/* line number 29*/
/* Loading a to %f0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 29*/
/* Loading b to %f1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 29*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 30*/
/* setting t = float * float */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 30*/
/* Done. */
/* line number 31*/
/* Converting int 5 to float. */
/* line number 31*/
/* promoting */
/* line number 31*/
/* Storing variable 5 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -5, %l3
    st          %l3, [%l5]
/* line number 31*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 31*/
/* done promoting */
/* line number 31*/
/* Assigning converted 5 to u */
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
/* line number 31*/
/* Loading -1 to %l1 */
    set         -1, %l1
/* line number 31*/
/* Multiplying */
/* line number 31*/
/* Loading t to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
/* line number 31*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 31*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
/* line number 31*/
/* Adding */
/* line number 31*/
/* Loading float * int to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Loading u to %f1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 31*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 32*/
/* setting v = float + float */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 32*/
/* Done. */
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
/* line number 32*/
/* Loading -1 to %l1 */
    set         -1, %l1
/* line number 32*/
/* Multiplying */
/* line number 32*/
/* Loading v to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 32*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
/* line number 32*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 32*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 34*/
/* setting w = float * int */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 34*/
/* Done. */
/* line number 34*/
/* printing float STO.VarSTO@f7d5a6 */
/* line number 34*/
/* Loading u to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 34*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* printing float STO.VarSTO@1d17f01 */
/* line number 35*/
/* Loading v to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 35*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* printing float STO.VarSTO@e9581b */
/* line number 36*/
/* Loading w to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 36*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Prepping Arithmetic Calculations by loading */
/* line number 37*/
/* Adding */
/* line number 37*/
/* Loading v to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 37*/
/* Loading w to %f1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 37*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 37*/
/* printing float STO.ExprSTO@197833e */
/* line number 37*/
/* Loading float + float to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 37*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
