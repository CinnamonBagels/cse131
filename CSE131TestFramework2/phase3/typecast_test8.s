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
/* setting b = 441 */
    set         441, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* getting address of b */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer rawr with the value of &b */
/* line number 5*/
/* Loading &b to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 5*/
/* Storing value of register %o0 into rawr */
    st          %o0, [%fp-16]
/* getting address of rawr */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer rawr1 with the value of &rawr */
/* line number 6*/
/* Loading &rawr to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 6*/
/* Storing value of register %o0 into rawr1 */
    st          %o0, [%fp-24]
/* getting address of rawr1 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer rawr2 with the value of &rawr1 */
/* line number 7*/
/* Loading &rawr1 to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 7*/
/* Storing value of register %o0 into rawr2 */
    st          %o0, [%fp-32]
/* getting address of rawr2 */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer rawr3 with the value of &rawr2 */
/* line number 9*/
/* Loading &rawr2 to %o0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 9*/
/* Storing value of register %o0 into rawr3 */
    st          %o0, [%fp-40]
/* line number 9*/
/* Storing variable rawr3 into rawr3 */
    set         -44, %l5
    add         %fp, %l5, %l5
    set         -40, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* initializing pointer a with the value of rawr3 */
/* line number 11*/
/* Loading rawr3 to %o0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 11*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-48]
/* line number 11*/
/* Dereferencing a */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Dereferencing *a */
    set         -52, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Dereferencing **a */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Dereferencing ***a */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* printing float STO.VarSTO@d03350 */
/* line number 11*/
/* Loading ****a to %f0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 64) & -8
