! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
y:              .single      0r4.44      
x:              .word        3           
str_0:          .asciz       "main"      
str_1:          .asciz       "end"       
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 5*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 5*/
/* Storing parameter b */
    st          %f1, [%fp+72]
/* line number 6*/
/* Decrementing */
/* line number 6*/
/* Loading a to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         68, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Printing int Validating UnaryOp a as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 6*/
/* Loading Validating UnaryOp a as a IntegerType for operator: --...
 to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
/* line number 6*/
/* Decrementing */
/* line number 6*/
/* Loading a to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         68, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Printing int Validating UnaryOp a as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
/* line number 6*/
/* Loading Validating UnaryOp a as a IntegerType for operator: --...
 to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
/* line number 6*/
/* Decrementing */
/* line number 6*/
/* Loading b to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 6*/
/* printing float STO.ExprSTO@110c2e8 */
/* line number 6*/
/* Loading Validating UnaryOp b as a FloatType for operator: --...
 to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
/* line number 6*/
/* Decrementing */
/* line number 6*/
/* Loading b to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 6*/
/* printing float STO.ExprSTO@16c171f */
/* line number 6*/
/* Loading Validating UnaryOp b as a FloatType for operator: --...
 to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
/* line number 7*/
/* Decrementing */
/* line number 7*/
/* Loading b to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 8*/
/* Returning value from foo */
/* line number 8*/
/* Loading Validating UnaryOp b as a FloatType for operator: --...
 to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 24) & -8
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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* Preparing argument x */
/* line number 14*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 14*/
/* Preparing argument y */
/* line number 14*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    call    foo
    nop
/* line number 14*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 14*/
/* printing float STO.VarSTO@1620d92 */
/* line number 14*/
/* Loading foo() to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
