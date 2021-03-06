! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r7.0       
float_1:        .single      0r5.0       
float_2:        .single      0r6.0       
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 2*/
/* Storing parameter x */
    st          %f0, [%fp+68]
/* line number 2*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 2*/
/* Storing parameter z */
    st          %f2, [%fp+76]
/* line number 3*/
/* printing float STO.VarSTO@cab3bf */
/* line number 3*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
/* line number 3*/
/* printing float STO.VarSTO@1def658 */
/* line number 3*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
/* line number 3*/
/* printing float STO.VarSTO@ff366c */
/* line number 3*/
/* Loading z to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
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
/* line number 9*/
/* setting a = 7.0 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 9*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Preparing argument 5.0 */
/* line number 9*/
/* Loading 5.0 to %f0 */
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 9*/
/* Preparing argument 6.0 */
/* line number 9*/
/* Loading 6.0 to %f1 */
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
/* line number 9*/
/* Preparing argument a */
/* line number 9*/
/* Loading a to %f2 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f2
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
