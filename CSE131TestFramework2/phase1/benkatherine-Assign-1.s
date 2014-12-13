! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z,q
q:              .single      0r5.0       
x:              .word        0           
y:              .word        0           
z:              .word        10          
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
/* line number 12*/
/* setting a = x */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading int + int to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading z to %l1 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* setting b = int + int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 13*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 14*/
/* Loading b to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading w to %l0 */
    set         5, %l0
/* line number 15*/
/* Adding */
/* line number 15*/
/* Storing variable w into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         5, %l3
    st          %l3, [%l5]
/* line number 15*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading q to %f1 */
    set         q, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 16*/
/* setting c = int + float */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading Arithmetic Op to %l0 */
    set         10, %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading Arithmetic Op to %l0 */
    set         15, %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading Arithmetic Op to %l0 */
    set         20, %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Converting int Arithmetic Op to float. */
/* line number 17*/
/* promoting */
/* line number 17*/
/* Storing variable Arithmetic Op into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         25, %l3
    st          %l3, [%l5]
/* line number 17*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 17*/
/* done promoting */
/* line number 17*/
/* Assigning converted Arithmetic Op to d */
    set         -48, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 17*/
/* printing float STO.VarSTO@10d16b */
/* line number 17*/
/* Loading c to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printing float STO.VarSTO@24de67 */
/* line number 18*/
/* Loading d to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 18*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Adding */
/* line number 19*/
/* Loading d to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading c to %f1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* printing float STO.ExprSTO@853e51 */
/* line number 19*/
/* Loading float + float to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 52) & -8
