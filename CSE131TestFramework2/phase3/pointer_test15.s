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
/* setting k = 11222 */
    set         11222, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* getting address of k */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer p with the value of &k */
/* line number 6*/
/* Loading &k to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 6*/
/* Storing value of register %o0 into p */
    st          %o0, [%fp-16]
/* line number 6*/
/* Incrementing */
/* line number 6*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 6*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Incrementing */
/* line number 7*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Decrementing int* p */
/* line number 8*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Decrementing int* p */
/* line number 9*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Incrementing */
/* line number 11*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 11*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 13*/
/* Decrementing int* p */
/* line number 13*/
/* Loading p to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 13*/
/* Post decrement */
    add         %l0, %l6, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer hey with the value of p */
/* line number 17*/
/* Loading p to %o0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 17*/
/* Storing value of register %o0 into hey */
    st          %o0, [%fp-44]
/* line number 17*/
/* Dereferencing hey */
    set         -44, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Printing int *hey */
    set         _intFmt, %o0
/* line number 17*/
/* Loading *hey to %o1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 48) & -8
