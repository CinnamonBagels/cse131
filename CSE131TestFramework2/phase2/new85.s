! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r4.44      
float_2:        .single      0r4.44      
str_1:          .asciz       "main"      
str_3:          .asciz       "end"       
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
/* line number 2*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 3*/
/* Incrementing */
/* line number 3*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         68, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 3*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 3*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
/* line number 3*/
/* Incrementing */
/* line number 3*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         68, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 3*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
/* line number 3*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
/* line number 3*/
/* Incrementing */
/* line number 3*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 3*/
/* printing float STO.ExprSTO@17df9ec */
/* line number 3*/
/* Loading Validating UnaryOp y as a FloatType for operator: ++...
 to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
/* line number 3*/
/* Incrementing */
/* line number 3*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 3*/
/* printing float STO.ExprSTO@1a32902 */
/* line number 3*/
/* Loading Validating UnaryOp y as a FloatType for operator: ++...
 to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
/* line number 4*/
/* Incrementing */
/* line number 4*/
/* Loading x to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         68, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* Returning value from foo */
/* line number 5*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fitos       %f0, %f0
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
/* line number 10*/
/* setting x = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 10*/
/* Done. */
/* line number 12*/
/* setting y = 4.44 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Preparing argument 3 */
/* line number 12*/
/* Loading 3 to %o0 */
    set         3, %o0
/* line number 12*/
/* Preparing argument 4.44 */
/* line number 12*/
/* Loading 4.44 to %f1 */
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    call    foo
    nop
/* line number 12*/
/* Saving return value on to stack */
    st          %f0, [%fp+-16]
/* line number 12*/
/* printing float STO.VarSTO@adb165 */
/* line number 12*/
/* Loading foo() to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
