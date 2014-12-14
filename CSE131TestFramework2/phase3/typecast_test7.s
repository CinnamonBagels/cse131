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
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 3*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 3*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 3*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Loading Arithmetic Op to %l0 */
    set         15, %l0
/* line number 3*/
/* Loading 99 to %l1 */
    set         99, %l1
/* line number 3*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 3*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* setting b = Arithmetic Op */
    set         114, %l0
    st          %l0, [%fp-16]
/* line number 4*/
/* Done. */
/* getting address of b */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer rawr with the value of &b */
/* line number 5*/
/* Loading &b to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 5*/
/* Storing value of register %o0 into rawr */
    st          %o0, [%fp-24]
/* line number 5*/
/* Storing variable rawr into rawr */
    set         -28, %l5
    add         %fp, %l5, %l5
    set         -24, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* initializing pointer a with the value of rawr */
/* line number 6*/
/* Loading rawr to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 6*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-32]
/* line number 6*/
/* Dereferencing a */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* printing float STO.VarSTO@ff366c */
/* line number 6*/
/* Loading *a to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
