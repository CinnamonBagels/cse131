! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "inside foo"
str_1:          .asciz       "if1"       
str_2:          .asciz       "if inside" 
str_3:          .asciz       "else"      
str_4:          .asciz       "haha1"     
str_5:          .asciz       "haha2"     
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
/* line number 3*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 3*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 5*/
/* Returning value from foo */
    set         1, %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
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
/* setting a = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 10*/
/* Done. */
/* line number 14*/
/* setting b = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Short-circuiting && with a */
/* line number 14*/
/* Loading a to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
    call    foo
    nop
/* line number 14*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading foo() to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 14*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 15*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 17*/
/* Saving return value */
    st          %o0, [%fp+-24]
/* line number 17*/
/* Short-circuiting && with foo() */
/* line number 17*/
/* Loading foo() to %l1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading foo() to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_1
    nop
andF_1:
    set         0, %l2
    ba      andEnd_1
    nop
andT_1:
    set         1, %l2
andEnd_1:
/* line number 17*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 18*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_2
    nop
else_1:
endIf_2:
    ba      endIf_3
    nop
else_0:
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_3:
/* line number 27*/
/* Short-circuiting || with a */
/* line number 27*/
/* Loading a to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
    call    foo
    nop
/* line number 27*/
/* Saving return value */
    st          %o0, [%fp+-32]
/* line number 27*/
/* Prepping Arithmetic Calculations by loading */
/* line number 27*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 27*/
/* Loading foo() to %l1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 27*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_0
    nop
orF_0:
    set         0, %l2
    ba      orEnd_0
    nop
orT_0:
    set         1, %l2
orEnd_0:
/* line number 27*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 28*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 32*/
/* Short-circuiting || with b */
/* line number 32*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
    call    foo
    nop
/* line number 32*/
/* Saving return value */
    st          %o0, [%fp+-40]
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
/* line number 32*/
/* Loading b to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 32*/
/* Loading foo() to %l1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 32*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_1
    nop
orF_1:
    set         0, %l2
    ba      orEnd_1
    nop
orT_1:
    set         1, %l2
orEnd_1:
/* line number 32*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 33*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
