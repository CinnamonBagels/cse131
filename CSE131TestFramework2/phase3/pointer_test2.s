! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r99.99     
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
/* line number 5*/
/* setting p = 99.99 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 5*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 5*/
/* Done. */
/* getting address of p */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* Dereferencing &p */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&p */
    set         -16, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* Dereferencing &*&p */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&*&p */
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer a with the value of &*&*&p */
/* line number 7*/
/* Loading &*&*&p to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 7*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-32]
/* line number 7*/
/* Dereferencing a */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *a */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Dereferencing &*a */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&*a */
    set         -44, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Dereferencing &*&*a */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* printing float STO.VarSTO@1a0c382 */
/* line number 7*/
/* Loading *&*&*a to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 7*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 52) & -8
