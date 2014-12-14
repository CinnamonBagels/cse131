! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     b
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
b:              .skip        4           


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
/* setting a = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* getting address of a */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 4*/
/* Storing variable &a into b */
    set         b, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 5*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 5*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 5*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Dereferencing b */
/* line number 6*/
/* Loading b to %l0 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Printing int *b */
    set         _intFmt, %o0
/* line number 6*/
/* Loading *b to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 7*/
/* Dereferencing b */
/* line number 7*/
/* Loading b to %l0 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *b with value 10.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         10, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 8*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Dereferencing b */
/* line number 9*/
/* Loading b to %l0 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Printing int *b */
    set         _intFmt, %o0
/* line number 9*/
/* Loading *b to %o1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* getting address of b */
    set         b, %l0
    add         %g0, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer c with the value of &b */
/* line number 11*/
/* Loading &b to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 11*/
/* Storing value of register %o0 into c */
    st          %o0, [%fp-32]
/* line number 11*/
/* Dereferencing c */
/* line number 11*/
/* Loading c to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Dereferencing *c */
/* line number 11*/
/* Loading *c to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant **c with value 12.0
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         12, %l1
    st          %l1, [%l0]
/* line number 12*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 12*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Dereferencing b */
/* line number 13*/
/* Loading b to %l0 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 13*/
/* Printing int *b */
    set         _intFmt, %o0
/* line number 13*/
/* Loading *b to %o1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
