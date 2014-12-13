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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
/* line number 3*/
/* Prepping Comparison Calculations by loading */
/* line number 3*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 3*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 3*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 3*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 6*/
/* Returning value from foo1 */
    set         1, %i0
    ba      foo1_end
    nop
/* line number 7*/
/* Returning value from foo1 */
    set         100, %i0
    ba      foo1_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 8*/
/* Prepping Comparison Calculations by loading */
/* line number 8*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 8*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 8*/
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
/* line number 8*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 11*/
/* Returning value from foo1 */
    set         2, %i0
    ba      foo1_end
    nop
/* line number 12*/
/* Returning value from foo1 */
    set         200, %i0
    ba      foo1_end
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 14*/
/* Returning value from foo1 */
    set         3, %i0
    ba      foo1_end
    nop
/* line number 15*/
/* Returning value from foo1 */
    set         300, %i0
    ba      foo1_end
    nop
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 12) & -8
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
    call    foo1
    nop
/* line number 20*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* line number 20*/
/* Printing int foo1() */
    set         _intFmt, %o0
/* line number 20*/
/* Loading foo1() to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
