! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     wow,bee
float_0:        .single      0r9.93      
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
wow:            .skip        40000       

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
/* line number 14*/
/* setting k = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 14*/
/* Done. */
/* getting address of k */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 14*/
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
/* line number 17*/
/* setting snake = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 17*/
/* Done. */
/* getting address of snake */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer snake1 with the value of &snake */
/* line number 18*/
/* Loading &snake to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 18*/
/* Storing value of register %o0 into snake1 */
    st          %o0, [%fp-24]
/* getting address of snake1 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
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
/* line number 22*/
/* Loading &bee to %o0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 22*/
/* Storing value of register %o0 into bird */
    st          %o0, [%fp-36]
/* line number 22*/
/* Starting array access */
/* line number 22*/
/* Loading 9000 to %l0 */
    set         9000, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 10000
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         wow, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -40, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant wow[9000] with value 1337.0
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1337, %l1
    st          %l1, [%l0]
/* line number 24*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading 9000 to %l0 */
    set         9000, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 10000
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         wow, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -56, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* getting address of wow[9000] */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* Storing variable &wow[9000] into a */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -60, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 26*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Dereferencing a */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 26*/
/* Loading *a to %o1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 76) & -8
