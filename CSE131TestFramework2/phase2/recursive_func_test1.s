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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 1*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 1*/
/* Storing parameter b */
    st          %i1, [%fp+72]
/* line number 2*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 2*/
/* Loading a to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 2*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 2*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 2*/
/* Loading b to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 2*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 3*/
/* Prepping Comparison Calculations by loading */
/* line number 3*/
/* Loading b to %l0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 3*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 3*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 3*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
/* line number 4*/
/* Loading b to %l0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 4*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 4*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 4*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Preparing argument a */
/* line number 4*/
/* Loading a to %o0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 4*/
/* Preparing argument int - int */
/* line number 4*/
/* Loading int - int to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    foo
    nop
/* line number 4*/
/* Saving return value on to stack */
    st          %o0, [%fp+-16]
/* line number 5*/
/* Returning value from foo */
/* line number 5*/
/* Loading foo() to %i0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
    ba      endIf_1
    nop
else_0:
/* line number 8*/
/* Returning value from foo */
    set         5, %i0
    ba      foo_end
    nop
endIf_1:
/* line number 10*/
/* Returning value from foo */
    set         0, %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 16) & -8
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
/* Preparing argument 4 */
/* line number 12*/
/* Loading 4 to %o0 */
    set         4, %o0
/* line number 12*/
/* Preparing argument 5 */
/* line number 12*/
/* Loading 5 to %o1 */
    set         5, %o1
    call    foo
    nop
/* line number 12*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* line number 12*/
/* Preparing argument 10 */
/* line number 12*/
/* Loading 10 to %o0 */
    set         10, %o0
/* line number 12*/
/* Preparing argument foo() */
/* line number 12*/
/* Loading foo() to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    foo
    nop
/* line number 12*/
/* Saving return value on to stack */
    st          %o0, [%fp+-12]
/* line number 12*/
/* Printing int foo() */
    set         _intFmt, %o0
/* line number 12*/
/* Loading foo() to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
