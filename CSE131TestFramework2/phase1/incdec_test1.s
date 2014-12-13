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
/* line number 5*/
/* setting x = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 5*/
/* Done. */
/* line number 7*/
/* setting y = 1 */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Incrementing */
/* line number 7*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 7*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 7*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* Incrementing */
/* line number 8*/
/* Loading y to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 8*/
/* Loading Validating UnaryOp y as a IntegerType for operator: ++...
 to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Incrementing */
/* line number 12*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 12*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading y to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Printing int int + int */
    set         _intFmt, %o0
/* line number 12*/
/* Loading int + int to %o1 */
    set         -28, %l1
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
/* Incrementing */
/* line number 13*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
/* line number 13*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading y to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Printing int int + int */
    set         _intFmt, %o0
/* line number 13*/
/* Loading int + int to %o1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Decrementing */
/* line number 17*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 17*/
/* Post decrement */
    inc     %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 17*/
/* Loading Validating UnaryOp x as a IntegerType for operator: --...
 to %o1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Decrementing */
/* line number 18*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 18*/
/* Loading Validating UnaryOp x as a IntegerType for operator: --...
 to %o1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Decrementing */
/* line number 22*/
/* Loading y to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 22*/
/* Post decrement */
    inc     %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading Validating UnaryOp y as a IntegerType for operator: --...
 to %l1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 22*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 22*/
/* Loading int - int to %o1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 22*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* Decrementing */
/* line number 25*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 25*/
/* Prepping Arithmetic Calculations by loading */
/* line number 25*/
/* Loading Validating UnaryOp x as a IntegerType for operator: --...
 to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 25*/
/* Loading y to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 25*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 25*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 25*/
/* Loading int - int to %o1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 60) & -8
