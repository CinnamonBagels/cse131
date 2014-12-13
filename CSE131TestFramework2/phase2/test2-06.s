! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "bad falseFunc!"
str_1:          .asciz       "bad trueFunc!"
str_2:          .asciz       "bad, shouldn't reach here!"
str_3:          .asciz       "good! "    
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
                .global      falseFunc
falseFunc:
    set         SAVE.falseFunc, %g1
    save        %sp, %g1, %sp
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 6*/
/* Returning value from falseFunc */
    set         0, %i0
    ba      falseFunc_end
    nop
falseFunc_end:
    ret 
    restore
SAVE.falseFunc = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      trueFunc
trueFunc:
    set         SAVE.trueFunc, %g1
    save        %sp, %g1, %sp
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 11*/
/* Returning value from trueFunc */
    set         1, %i0
    ba      trueFunc_end
    nop
trueFunc_end:
    ret 
    restore
SAVE.trueFunc = -(92 + 4) & -8
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
/* setting x = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 17*/
/* Done. */
/* line number 17*/
/* Short-circuiting || with true */
/* line number 17*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 17*/
/* Incrementing */
/* line number 17*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 17*/
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
/* line number 17*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 17*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
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
/* line number 17*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 17*/
/* Short-circuiting || with Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 17*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
    call    trueFunc
    nop
/* line number 17*/
/* Saving return value on to stack */
    st          %o0, [%fp+-24]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading trueFunc() to %l1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
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
/* line number 17*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 17*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 18*/
/* Short-circuiting && with false */
/* line number 18*/
/* Loading false to %l1 */
    set         0, %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 18*/
/* Incrementing */
/* line number 18*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading Validating UnaryOp x as a IntegerType for operator: ++...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 18*/
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
/* line number 18*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 18*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
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
/* line number 18*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 18*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
/* line number 18*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
    call    falseFunc
    nop
/* line number 18*/
/* Saving return value on to stack */
    st          %o0, [%fp+-44]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading falseFunc() to %l1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
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
/* line number 18*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 18*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -48, %l1
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
    ba      endIf_2
    nop
else_1:
endIf_2:
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    ba      endIf_3
    nop
else_0:
endIf_3:
/* line number 24*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 24*/
/* Loading x to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 48) & -8
