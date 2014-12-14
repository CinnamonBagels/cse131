! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     bee
float_0:        .single      0r9.93      
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
bee:            .skip        12          


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
/* setting k = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* getting address of k */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Storing variable &k into a */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
! --storing constant b with value 9.93
    set         -8, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* setting snake = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 15*/
/* Done. */
/* getting address of snake */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer snake1 with the value of &snake */
/* line number 16*/
/* Loading &snake to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 16*/
/* Storing value of register %o0 into snake1 */
    st          %o0, [%fp-24]
/* getting address of snake1 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Storing variable &snake1 into c */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* getting address of bee */
    set         bee, %l0
    add         %g0, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer bird with the value of &bee */
/* line number 20*/
/* Loading &bee to %o0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 20*/
/* Storing value of register %o0 into bird */
    st          %o0, [%fp-36]
/* line number 20*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* printing float STO.VarSTO@ea5d87 */
/* line number 20*/
/* Loading b to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing a */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 21*/
/* Loading *a to %o1 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Dereferencing c */
    set         -4, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -80, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Dereferencing *c */
    set         -80, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Printing bool **c */
/* line number 22*/
/* Loading **c to %l0 */
    set         -84, %l1
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
/* line number 22*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 84) & -8
