! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r3.12      
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
/* line number 2*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 3*/
/* Prepping Comparison Calculations by loading */
/* line number 3*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 3*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_0
    nop
    set         0, %l3
    ba      equalEnd_0
    nop
equal_0:
    set         1, %l3
equalEnd_0:
/* line number 3*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 6*/
/* Returning value from foo */
/* line number 6*/
/* Loading x to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
    ba      endIf_1
    nop
else_0:
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 9*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Preparing argument int - int */
/* line number 9*/
/* Loading int - int to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    foo
    nop
/* line number 9*/
/* Saving return value on to stack */
    st          %o0, [%fp+-16]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading foo() to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading x to %l1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 10*/
/* Returning value from foo */
/* line number 10*/
/* Loading int * int to %i0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
endIf_1:
/* line number 12*/
/* Returning value from foo */
/* line number 12*/
/* Loading x to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 20) & -8
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
/* line number 17*/
/* setting x = 3.12 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 17*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* Preparing argument 5 */
/* line number 17*/
/* Loading 5 to %o0 */
    set         5, %o0
    call    foo
    nop
/* line number 17*/
/* Saving return value on to stack */
    st          %o0, [%fp+-12]
/* line number 17*/
/* Printing int foo() */
    set         _intFmt, %o0
/* line number 17*/
/* Loading foo() to %o1 */
    set         -12, %l1
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
/* Preparing argument 6 */
/* line number 18*/
/* Loading 6 to %o0 */
    set         6, %o0
    call    foo
    nop
/* line number 18*/
/* Saving return value on to stack */
    st          %o0, [%fp+-16]
/* line number 18*/
/* Printing int foo() */
    set         _intFmt, %o0
/* line number 18*/
/* Loading foo() to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Preparing argument 10 */
/* line number 19*/
/* Loading 10 to %o0 */
    set         10, %o0
    call    foo
    nop
/* line number 19*/
/* Saving return value on to stack */
    st          %o0, [%fp+-20]
/* line number 19*/
/* Printing int foo() */
    set         _intFmt, %o0
/* line number 19*/
/* Loading foo() to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Decrementing */
/* line number 21*/
/* Loading x to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 21*/
/* printing float STO.ExprSTO@69048b */
/* line number 21*/
/* Loading Validating UnaryOp x as a FloatType for operator: --...
 to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Incrementing */
/* line number 22*/
/* Loading x to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 22*/
/* printing float STO.ExprSTO@67211b */
/* line number 22*/
/* Loading Validating UnaryOp x as a FloatType for operator: ++...
 to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 22*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* Incrementing */
/* line number 23*/
/* Loading x to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 24*/
/* Decrementing */
/* line number 24*/
/* Loading x to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fadds       %f2, %f1, %f2
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 24*/
/* printing float STO.ExprSTO@ae8542 */
/* line number 24*/
/* Loading Validating UnaryOp x as a FloatType for operator: --...
 to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 24*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing float STO.VarSTO@e77ca4 */
/* line number 25*/
/* Loading x to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
