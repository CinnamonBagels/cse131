! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r4.22      
float_1:        .single      0r4.22      
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
/* setting b = 4.22 */
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
/* Loading b to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fstoi       %f0, %f0
    set         -12, %l0
    add         %fp, %l0, %l0
    st          %f0, [%l0]
/* line number 6*/
/* setting a = b */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 6*/
/* Done. */
/* getting address of a */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Storing variable &a into &a */
    set         -24, %l5
    add         %fp, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* initializing pointer c with the value of &a */
/* line number 8*/
/* Loading &a to %o0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 8*/
/* Storing value of register %o0 into c */
    st          %o0, [%fp-28]
/* line number 8*/
/* Dereferencing c */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Adding */
/* line number 8*/
/* Loading *c to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* line number 8*/
/* Storing variable 4.22 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 8*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 8*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 8*/
/* printing float STO.ExprSTO@adb165 */
/* line number 8*/
/* Loading float + float to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
