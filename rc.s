! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
<<<<<<< HEAD
=======
str_0:          .asciz       "should be printed 1"
str_1:          .asciz       "should be printed 2"
str_2:          .asciz       "should be printed 3"
str_3:          .asciz       "should be printed 4"
str_4:          .asciz       "AGAIN, SHOLD NOT BE PRINTED"
str_5:          .asciz       "ahoy counter: "
str_6:          .asciz       "SHOULD NOT BE PRINTED"
>>>>>>> 4ea61d9b805ad48bf760eccdf7dba1ec34a20091
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
<<<<<<< HEAD
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 2*/
/* Storing parameter x */
    st          %i0, [%fp+-8]
/* line number 4*/
/* Returning value from foo */
/* line number 4*/
/* Loading x to %i0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
=======
>>>>>>> 4ea61d9b805ad48bf760eccdf7dba1ec34a20091
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
<<<<<<< HEAD
    call    foo
    nop
/* line number 8*/
/* Saving return value */
    st          %o0, [%fp+-8]
    call    foo
    nop
/* line number 8*/
/* Saving return value */
    st          %o0, [%fp+-12]
/* line number 8*/
/* Printing int foo() */
    set         _intFmt, %o0
/* line number 8*/
/* Loading foo() to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
=======
/* line number 4*/
/* setting ahoy = 10 */
    set         10, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 6*/
/* setting hola = 12 */
    set         12, %l0
    st          %l0, [%fp-12]
/* line number 6*/
/* Done. */
while_0:
/* line number 6*/
/* Prepping Comparison Calculations by loading */
/* line number 6*/
/* Loading ahoy to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 6*/
/* Loading 15 to %l1 */
    set         15, %l1
/* line number 6*/
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
/* line number 6*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant hola with value 10.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         10, %l1
    st          %l1, [%l0]
while_1:
/* line number 10*/
/* Prepping Comparison Calculations by loading */
/* line number 10*/
/* Loading hola to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading 14 to %l1 */
    set         14, %l1
/* line number 10*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 10*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_2:
/* line number 14*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      whileEnd_2
    nop
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_3:
/* line number 17*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      whileEnd_3
    nop
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Breaking out of while loop */
    ba      whileEnd_3
    nop
    ba      while_3
    nop
whileEnd_3:
/* line number 22*/
/* Breaking out of while loop */
    ba      whileEnd_2
    nop
    ba      while_2
    nop
whileEnd_2:
/* line number 23*/
/* Incrementing */
/* line number 23*/
/* Loading hola to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 23*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 25*/
/* Continuing while loop */
    ba      while_1
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      while_1
    nop
whileEnd_1:
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Printing int ahoy */
    set         _intFmt, %o0
/* line number 27*/
/* Loading ahoy to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
>>>>>>> 4ea61d9b805ad48bf760eccdf7dba1ec34a20091
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* Incrementing */
/* line number 28*/
/* Loading ahoy to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 28*/
/* Post Increment */
    dec     %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Continuing while loop */
    ba      while_0
    nop
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      while_0
    nop
whileEnd_0:
main_end:
    ret 
    restore
SAVE.main = -(92 + 28) & -8
