! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     i
i:              .word        5           
str_0:          .asciz       " "         
str_1:          .asciz       " "         
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
/* line number 8*/
/* setting j = i */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Prepping Comparison Calculations by loading */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         0, %l1
/* line number 8*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_0
    nop
    set         0, %l3
    ba      greaterEqualEnd_0
    nop
greaterEqual_0:
    set         1, %l3
greaterEqualEnd_0:
/* line number 8*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 9*/
/* Decrementing */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         i, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 9*/
/* Post decrement */
    inc     %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Printing int Validating UnaryOp i as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
    call    foo
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 13*/
/* Printing int j */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
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
    call    foo
    nop
/* line number 19*/
/* Printing int i */
    set         _intFmt, %o0
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
