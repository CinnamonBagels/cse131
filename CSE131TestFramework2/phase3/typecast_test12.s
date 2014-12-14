! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* setting b = 125151 */
    set         125151, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* getting address of b */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer a with the value of &b */
/* line number 5*/
/* Loading &b to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 5*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-16]
/* getting address of a */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer d with the value of &a */
/* line number 6*/
/* Loading &a to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 6*/
/* Storing value of register %o0 into d */
    st          %o0, [%fp-24]
/* getting address of d */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer e with the value of &d */
/* line number 7*/
/* Loading &d to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 7*/
/* Storing value of register %o0 into e */
    st          %o0, [%fp-32]
/* getting address of e */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer f with the value of &e */
/* line number 8*/
/* Loading &e to %o0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 8*/
/* Storing value of register %o0 into f */
    st          %o0, [%fp-40]
/* line number 8*/
/* Storing variable f into f */
    set         -44, %l5
    add         %fp, %l5, %l5
    set         -40, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* initializing pointer c with the value of f */
/* line number 10*/
/* Loading f to %o0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 10*/
/* Storing value of register %o0 into c */
    st          %o0, [%fp-48]
/* line number 10*/
/* Dereferencing c */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Dereferencing *c */
    set         -52, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Dereferencing **c */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Dereferencing ***c */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Printing bool ****c */
/* line number 10*/
/* Loading ****c to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 64) & -8
