! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     bee,found
bee:            .single      0r2.1       
float_0:        .single      0r4.22      
found:          .single      0r0         
float_1:        .single      0r13.55     
float_2:        .single      0r4.11      
float_3:        .single      0r9.44      
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
/* line number 2*/
/* Prepping Arithmetic Calculations by loading */
/* line number 2*/
/* Adding */
/* line number 2*/
/* Storing variable 4.22 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_0, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 2*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 2*/
/* Loading bee to %f1 */
    set         bee, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 2*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 4*/
/* Storing variable float + float into found */
    set         found, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
/* line number 6*/
/* Adding */
/* line number 6*/
/* Storing variable 9.44 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 6*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 6*/
/* Storing variable 4.11 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 6*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 6*/
/* Storing result of Binary Op */
    set         float_1, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
/* line number 6*/
/* Adding */
/* line number 6*/
/* Storing variable Arithmetic Op into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 6*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 6*/
/* Loading found to %f1 */
    set         found, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 6*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 8*/
/* setting a = float + float */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Loading a to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fstoi       %f0, %f0
    set         -16, %l0
    add         %fp, %l0, %l0
    st          %f0, [%l0]
/* line number 10*/
/* setting cast = a */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Printing int cast */
    set         _intFmt, %o0
/* line number 10*/
/* Loading cast to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
