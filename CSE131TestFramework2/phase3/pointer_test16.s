! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r33.22     
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
/* getting address of p */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer hey with the value of &p */
/* line number 17*/
/* Loading &p to %o0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 17*/
/* Storing value of register %o0 into hey */
    st          %o0, [%fp-48]
/* line number 17*/
/* Incrementing */
/* line number 17*/
/* Loading hey to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -48, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 17*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Decrementing int* hey */
/* line number 18*/
/* Loading hey to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -48, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 18*/
/* Post decrement */
    add         %l0, %l6, %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of hey */
    set         -48, %l0
    add         %fp, %l0, %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer lol with the value of &hey */
/* line number 22*/
/* Loading &hey to %o0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 22*/
/* Storing value of register %o0 into lol */
    st          %o0, [%fp-64]
/* line number 22*/
/* Decrementing int* lol */
/* line number 22*/
/* Loading lol to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -64, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 22*/
/* Post decrement */
    add         %l0, %l6, %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Incrementing */
/* line number 23*/
/* Loading lol to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -64, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of lol */
    set         -64, %l0
    add         %fp, %l0, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer dust with the value of &lol */
/* line number 27*/
/* Loading &lol to %o0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 27*/
/* Storing value of register %o0 into dust */
    st          %o0, [%fp-80]
/* line number 27*/
/* Incrementing */
/* line number 27*/
/* Loading dust to %l0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -80, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Decrementing int* dust */
/* line number 28*/
/* Loading dust to %l0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    sub         %l0, %l6, %l0
    set         -80, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 28*/
/* Post decrement */
    add         %l0, %l6, %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing dust */
    set         -80, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing *dust */
    set         -92, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing **dust */
    set         -96, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing ***dust */
    set         -100, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Prepping Arithmetic Calculations by loading */
/* line number 30*/
/* Loading ****dust to %l0 */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 30*/
/* Loading 4311 to %l1 */
    set         4311, %l1
/* line number 30*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 30*/
/* Storing result of Binary Op */
    set         -108, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 30*/
/* Prepping Arithmetic Calculations by loading */
/* line number 30*/
/* Loading int - int to %l0 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 30*/
/* Adding */
/* line number 30*/
/* Loading int - int to %f0 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 30*/
/* Storing variable 33.22 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_0, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 30*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 30*/
/* Storing result of Binary Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 30*/
/* printing float STO.ExprSTO@a969e4 */
/* line number 30*/
/* Loading int + float to %f0 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 30*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 112) & -8
