! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r7.0       
float_1:        .single      0r8.0       
float_2:        .single      0r1.0       
float_3:        .single      0r2.0       
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
    st          %i0, [%fp+68]
/* line number 2*/
/* Storing parameter y */
    st          %i1, [%fp+72]
! --storing constant x with value 7.0
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant y with value 8.0
    set         72, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
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
/* line number 10*/
/* setting a = 1.0 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 10*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 10*/
/* Done. */
/* line number 12*/
/* setting b = 2.0 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_3, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Preparing argument a */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
/* line number 12*/
/* Preparing argument b */
    set         -12, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o1
    call    foo
    nop
/* line number 14*/
/* printing float STO.VarSTO@1a183d2 */
/* line number 14*/
/* Loading a to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
/* line number 14*/
/* printing float STO.VarSTO@d55a0f */
/* line number 14*/
/* Loading b to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
