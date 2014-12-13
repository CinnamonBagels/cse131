! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .word        5           
b:              .word        0           
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
/* line number 2*/
/* Incrementing */
/* line number 2*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         a, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 4*/
/* Storing variable Validating UnaryOp a as a IntegerType for operator: ++...
 into b */
    set         b, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 7*/
/* setting c = 4 */
    set         4, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Incrementing */
/* line number 7*/
/* Loading c to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* setting d = Validating UnaryOp c as a IntegerType for operator: ++...
 */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Incrementing */
/* line number 9*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         a, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Printing int Validating UnaryOp a as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 9*/
/* Loading Validating UnaryOp a as a IntegerType for operator: ++...
 to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 11*/
/* Loading b to %o1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Incrementing */
/* line number 12*/
/* Loading b to %l0 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         b, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Printing int Validating UnaryOp b as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 12*/
/* Loading Validating UnaryOp b as a IntegerType for operator: ++...
 to %o1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 14*/
/* Loading c to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Incrementing */
/* line number 15*/
/* Loading c to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 15*/
/* Printing int Validating UnaryOp c as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 15*/
/* Loading Validating UnaryOp c as a IntegerType for operator: ++...
 to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Incrementing */
/* line number 17*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         a, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading c to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading Validating UnaryOp a as a IntegerType for operator: ++...
 to %l1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 17*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 17*/
/* Loading int - int to %o1 */
    set         -36, %l1
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
/* Incrementing */
/* line number 18*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         a, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading Validating UnaryOp a as a IntegerType for operator: ++...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading c to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 18*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 18*/
/* Loading int - int to %o1 */
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
