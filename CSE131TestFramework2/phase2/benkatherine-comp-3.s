! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
y:              .single      0r3.0       
float_0:        .single      0r9.0       
float_1:        .single      0r5.0       
float_2:        .single      0r9.0       
float_3:        .single      0r9.0       
float_4:        .single      0r5.0       
float_5:        .single      0r9.0       
x:              .word        4           
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
/* line number 25*/
/* Prepping Arithmetic Calculations by loading */
/* line number 25*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 25*/
/* Adding */
/* line number 25*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 25*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 25*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 26*/
/* setting c = int + float */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 26*/
/* Done. */
/* line number 26*/
/* Prepping Arithmetic Calculations by loading */
/* line number 26*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 26*/
/* Adding */
/* line number 26*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 26*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 26*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 28*/
/* setting d = int + float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 28*/
/* Done. */
/* line number 28*/
/* printing float STO.VarSTO@1286c71 */
/* line number 28*/
/* Loading c to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing float STO.VarSTO@e77ca4 */
/* line number 29*/
/* Loading d to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
/* line number 31*/
/* Loading 4 to %l0 */
    set         4, %l0
/* line number 31*/
/* Adding */
/* line number 31*/
/* Storing variable 4 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         4, %l3
    st          %l3, [%l5]
/* line number 31*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Storing variable 5.0 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 31*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 31*/
/* Storing result of Binary Op */
    set         float_0, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 32*/
/* setting e = Arithmetic Op */
    set         -24, %l0
    add         %fp, %l0, %l0
/* line number 32*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 32*/
/* Done. */
/* line number 32*/
/* printing float STO.VarSTO@1a83205 */
/* line number 32*/
/* Loading e to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 32*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* Prepping Arithmetic Calculations by loading */
/* line number 34*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 34*/
/* Adding */
/* line number 34*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 34*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 34*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 35*/
/* setting f = float + int */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 35*/
/* Done. */
/* line number 35*/
/* Prepping Arithmetic Calculations by loading */
/* line number 35*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 35*/
/* Adding */
/* line number 35*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 35*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 35*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 37*/
/* setting g = float + int */
    set         -40, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 37*/
/* Done. */
/* line number 37*/
/* printing float STO.VarSTO@16c2195 */
/* line number 37*/
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 37*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* printing float STO.VarSTO@10d16b */
/* line number 38*/
/* Loading g to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 38*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 40*/
/* Prepping Arithmetic Calculations by loading */
/* line number 40*/
/* Loading 4 to %l1 */
    set         4, %l1
/* line number 40*/
/* Adding */
/* line number 40*/
/* Storing variable 5.0 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 40*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 40*/
/* Storing variable 4 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         4, %l3
    st          %l3, [%l5]
/* line number 40*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 40*/
/* Storing result of Binary Op */
    set         float_3, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 41*/
/* setting h = Arithmetic Op */
    set         -44, %l0
    add         %fp, %l0, %l0
/* line number 41*/
/* setting float */
    set         float_5, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 41*/
/* Done. */
/* line number 41*/
/* printing float STO.VarSTO@24de67 */
/* line number 41*/
/* Loading h to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 41*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
