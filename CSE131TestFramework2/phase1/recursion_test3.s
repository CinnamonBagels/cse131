! --globals--
                .section     ".data"
                .align 4
                 .global     counter
counter:        .word        0           
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
/* Incrementing */
    set         counter, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         counter, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 5*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Prepping Comparison Calculations by loading */
    set         counter, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 7*/
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
/* line number 7*/
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
    call    foo
    nop
/* line number 9*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 10*/
/* Returning value from foo */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 13*/
/* Returning value from foo */
    set         counter, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %i0
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
    call    foo
    nop
/* line number 17*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 18*/
/* setting final = foo() */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 18*/
/* Done. */
! --storing constant counter with value 0.0
    set         counter, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    call    foo
    nop
/* line number 19*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 19*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 19*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 20*/
/* setting doubleFinal = int + int */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 20*/
/* Done. */
! --storing constant counter with value 0.0
    set         counter, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    call    foo
    nop
/* line number 21*/
/* Saving return value */
    st          %o0, [%fp+-28]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 21*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 21*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* setting tripleFinal = int + int */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 22*/
/* Done. */
! --storing constant counter with value 0.0
    set         counter, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 24*/
/* Printing int counter */
    set         _intFmt, %o0
    set         counter, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* Printing int final */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* Printing int doubleFinal */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* Printing int tripleFinal */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
