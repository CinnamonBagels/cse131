! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     i,b1
i:              .word        0           
b1:             .word        0           
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
/* line number 4*/
/* Storing parameter j */
    st          %i0, [%fp+68]
/* line number 5*/
/* Prepping Comparison Calculations by loading */
/* line number 5*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 5*/
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
/* line number 5*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 5*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into b1 */
    set         b1, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 5*/
/* Printing bool b1 */
/* line number 5*/
/* Loading b1 to %l0 */
    set         b1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* line number 5*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Prepping Comparison Calculations by loading */
/* line number 6*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 6*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 6*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 6*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Storing variable Validating ComparisonOp int and int as a BooleanType for operator: >...
 into b1 */
    set         b1, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* Loading b1 to %l0 */
    set         b1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 8*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* Storing variable int - int into i */
    set         i, %l5
    add         %g0, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 9*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 9*/
/* Loading i to %o1 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading i to %l0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 10*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Storing variable int - int into i */
    set         i, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 10*/
/* Preparing argument i */
/* line number 10*/
/* Loading i to %o0 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
    call    foo
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
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
! --storing constant i with value 4.0
    set         i, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 19*/
/* Preparing argument 4 */
/* line number 19*/
/* Loading 4 to %o0 */
    set         4, %o0
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
