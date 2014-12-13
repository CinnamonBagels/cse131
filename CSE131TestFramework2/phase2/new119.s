! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .word        1           
b:              .word        0           
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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
/* line number 13*/
/* Returning value from foo1 */
    set         0, %i0
    ba      foo1_end
    nop
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 18*/
/* Returning value from foo2 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %i0
    ba      foo2_end
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo3
foo3:
    set         SAVE.foo3, %g1
    save        %sp, %g1, %sp
/* line number 23*/
/* Returning value from foo3 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo3_end
    nop
foo3_end:
    ret 
    restore
SAVE.foo3 = -(92 + 4) & -8
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
/* line number 28*/
/* setting x = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 28*/
/* Done. */
/* line number 30*/
/* setting y = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 30*/
/* Done. */
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* Negating */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_0
    nop
decrement_0:
    dec     %l0
    ba      negEnd_0
    nop
increment_0:
    inc     %l0
negEnd_0:
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 33*/
/* Printing bool Validating UnaryOp a as a BooleanType for operator: !...
 */
    set         -16, %l1
    add         %fp, %l1, %l1
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
/* line number 33*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* Negating */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_1
    nop
decrement_1:
    dec     %l0
    ba      negEnd_1
    nop
increment_1:
    inc     %l0
negEnd_1:
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Printing bool Validating UnaryOp b as a BooleanType for operator: !...
 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 34*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* Negating */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_2
    nop
decrement_2:
    dec     %l0
    ba      negEnd_2
    nop
increment_2:
    inc     %l0
negEnd_2:
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 35*/
/* Printing bool Validating UnaryOp x as a BooleanType for operator: !...
 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 35*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* Negating */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_3
    nop
decrement_3:
    dec     %l0
    ba      negEnd_3
    nop
increment_3:
    inc     %l0
negEnd_3:
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Printing bool Validating UnaryOp y as a BooleanType for operator: !...
 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_3
    nop
printTrue_3:
    set         _boolT, %o1
    ba      branchEnd_3
    nop
printFalse_3:
    set         _boolF, %o1
branchEnd_3:
    call    printf
    nop
/* line number 36*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* Negating */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_4
    nop
decrement_4:
    dec     %l0
    ba      negEnd_4
    nop
increment_4:
    inc     %l0
negEnd_4:
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 38*/
/* Short-circuiting && with Validating UnaryOp a as a BooleanType for operator: !...
 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 38*/
/* Negating */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_5
    nop
decrement_5:
    dec     %l0
    ba      negEnd_5
    nop
increment_5:
    inc     %l0
negEnd_5:
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 38*/
/* Prepping Arithmetic Calculations by loading */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 38*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 38*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 38*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_4
    nop
printTrue_4:
    set         _boolT, %o1
    ba      branchEnd_4
    nop
printFalse_4:
    set         _boolF, %o1
branchEnd_4:
    call    printf
    nop
/* line number 38*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* Negating */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_6
    nop
decrement_6:
    dec     %l0
    ba      negEnd_6
    nop
increment_6:
    inc     %l0
negEnd_6:
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 39*/
/* Short-circuiting && with Validating UnaryOp b as a BooleanType for operator: !...
 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
/* line number 39*/
/* Negating */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_7
    nop
decrement_7:
    dec     %l0
    ba      negEnd_7
    nop
increment_7:
    inc     %l0
negEnd_7:
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 39*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_1
    nop
andF_1:
    set         0, %l2
    ba      andEnd_1
    nop
andT_1:
    set         1, %l2
andEnd_1:
/* line number 39*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 39*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_5
    nop
printTrue_5:
    set         _boolT, %o1
    ba      branchEnd_5
    nop
printFalse_5:
    set         _boolF, %o1
branchEnd_5:
    call    printf
    nop
/* line number 39*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* Negating */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_8
    nop
decrement_8:
    dec     %l0
    ba      negEnd_8
    nop
increment_8:
    inc     %l0
negEnd_8:
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 41*/
/* Short-circuiting && with Validating UnaryOp a as a BooleanType for operator: !...
 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_2
    nop
/* line number 41*/
/* Negating */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_9
    nop
decrement_9:
    dec     %l0
    ba      negEnd_9
    nop
increment_9:
    inc     %l0
negEnd_9:
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 41*/
/* Prepping Arithmetic Calculations by loading */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 41*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_2
    nop
andF_2:
    set         0, %l2
    ba      andEnd_2
    nop
andT_2:
    set         1, %l2
andEnd_2:
/* line number 41*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 41*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_6
    nop
printTrue_6:
    set         _boolT, %o1
    ba      branchEnd_6
    nop
printFalse_6:
    set         _boolF, %o1
branchEnd_6:
    call    printf
    nop
/* line number 41*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 42*/
/* Negating */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_10
    nop
decrement_10:
    dec     %l0
    ba      negEnd_10
    nop
increment_10:
    inc     %l0
negEnd_10:
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 42*/
/* Short-circuiting && with Validating UnaryOp a as a BooleanType for operator: !...
 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_3
    nop
/* line number 42*/
/* Negating */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_11
    nop
decrement_11:
    dec     %l0
    ba      negEnd_11
    nop
increment_11:
    inc     %l0
negEnd_11:
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 42*/
/* Prepping Arithmetic Calculations by loading */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 42*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_3
    nop
andF_3:
    set         0, %l2
    ba      andEnd_3
    nop
andT_3:
    set         1, %l2
andEnd_3:
/* line number 42*/
/* Storing result of Binary Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 42*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_7
    nop
printTrue_7:
    set         _boolT, %o1
    ba      branchEnd_7
    nop
printFalse_7:
    set         _boolF, %o1
branchEnd_7:
    call    printf
    nop
/* line number 42*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 44*/
/* Saving return value */
    st          %o0, [%fp+-80]
/* line number 44*/
/* Negating */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_12
    nop
decrement_12:
    dec     %l0
    ba      negEnd_12
    nop
increment_12:
    inc     %l0
negEnd_12:
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 44*/
/* Printing bool Validating UnaryOp foo() as a BooleanType for operator: !...
 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_8
    nop
printTrue_8:
    set         _boolT, %o1
    ba      branchEnd_8
    nop
printFalse_8:
    set         _boolF, %o1
branchEnd_8:
    call    printf
    nop
/* line number 44*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 45*/
/* Saving return value */
    st          %o0, [%fp+-88]
/* line number 45*/
/* Negating */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_13
    nop
decrement_13:
    dec     %l0
    ba      negEnd_13
    nop
increment_13:
    inc     %l0
negEnd_13:
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 45*/
/* Printing bool Validating UnaryOp foo1() as a BooleanType for operator: !...
 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_9
    nop
printTrue_9:
    set         _boolT, %o1
    ba      branchEnd_9
    nop
printFalse_9:
    set         _boolF, %o1
branchEnd_9:
    call    printf
    nop
/* line number 45*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 46*/
/* Saving return value */
    st          %o0, [%fp+-96]
/* line number 46*/
/* Negating */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_14
    nop
decrement_14:
    dec     %l0
    ba      negEnd_14
    nop
increment_14:
    inc     %l0
negEnd_14:
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 46*/
/* Printing bool Validating UnaryOp foo2() as a BooleanType for operator: !...
 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_10
    nop
printTrue_10:
    set         _boolT, %o1
    ba      branchEnd_10
    nop
printFalse_10:
    set         _boolF, %o1
branchEnd_10:
    call    printf
    nop
/* line number 46*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 47*/
/* Saving return value */
    st          %o0, [%fp+-104]
/* line number 47*/
/* Negating */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_15
    nop
decrement_15:
    dec     %l0
    ba      negEnd_15
    nop
increment_15:
    inc     %l0
negEnd_15:
    set         -108, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 47*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_11
    nop
printTrue_11:
    set         _boolT, %o1
    ba      branchEnd_11
    nop
printFalse_11:
    set         _boolF, %o1
branchEnd_11:
    call    printf
    nop
/* line number 47*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 48*/
/* Saving return value */
    st          %o0, [%fp+-112]
/* line number 48*/
/* Negating */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_16
    nop
decrement_16:
    dec     %l0
    ba      negEnd_16
    nop
increment_16:
    inc     %l0
negEnd_16:
    set         -116, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 48*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_12
    nop
printTrue_12:
    set         _boolT, %o1
    ba      branchEnd_12
    nop
printFalse_12:
    set         _boolF, %o1
branchEnd_12:
    call    printf
    nop
/* line number 48*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 49*/
/* Saving return value */
    st          %o0, [%fp+-120]
/* line number 49*/
/* Negating */
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_17
    nop
decrement_17:
    dec     %l0
    ba      negEnd_17
    nop
increment_17:
    inc     %l0
negEnd_17:
    set         -124, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 49*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_13
    nop
printTrue_13:
    set         _boolT, %o1
    ba      branchEnd_13
    nop
printFalse_13:
    set         _boolF, %o1
branchEnd_13:
    call    printf
    nop
/* line number 49*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 50*/
/* Saving return value */
    st          %o0, [%fp+-128]
/* line number 50*/
/* Negating */
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_18
    nop
decrement_18:
    dec     %l0
    ba      negEnd_18
    nop
increment_18:
    inc     %l0
negEnd_18:
    set         -132, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 50*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -132, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_14
    nop
printTrue_14:
    set         _boolT, %o1
    ba      branchEnd_14
    nop
printFalse_14:
    set         _boolF, %o1
branchEnd_14:
    call    printf
    nop
/* line number 50*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 51*/
/* Saving return value */
    st          %o0, [%fp+-136]
/* line number 51*/
/* Negating */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_19
    nop
decrement_19:
    dec     %l0
    ba      negEnd_19
    nop
increment_19:
    inc     %l0
negEnd_19:
    set         -140, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 51*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -140, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_15
    nop
printTrue_15:
    set         _boolT, %o1
    ba      branchEnd_15
    nop
printFalse_15:
    set         _boolF, %o1
branchEnd_15:
    call    printf
    nop
/* line number 51*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 52*/
/* Saving return value */
    st          %o0, [%fp+-144]
/* line number 52*/
/* Negating */
    set         -144, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_20
    nop
decrement_20:
    dec     %l0
    ba      negEnd_20
    nop
increment_20:
    inc     %l0
negEnd_20:
    set         -148, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 52*/
/* Printing bool Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -148, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_16
    nop
printTrue_16:
    set         _boolT, %o1
    ba      branchEnd_16
    nop
printFalse_16:
    set         _boolF, %o1
branchEnd_16:
    call    printf
    nop
/* line number 52*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 54*/
/* Saving return value */
    st          %o0, [%fp+-152]
/* line number 54*/
/* Negating */
    set         -152, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_21
    nop
decrement_21:
    dec     %l0
    ba      negEnd_21
    nop
increment_21:
    inc     %l0
negEnd_21:
    set         -156, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Short-circuiting && with Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -156, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_4
    nop
    call    foo3
    nop
/* line number 54*/
/* Saving return value */
    st          %o0, [%fp+-160]
/* line number 54*/
/* Negating */
    set         -160, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_22
    nop
decrement_22:
    dec     %l0
    ba      negEnd_22
    nop
increment_22:
    inc     %l0
negEnd_22:
    set         -164, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Prepping Arithmetic Calculations by loading */
    set         -156, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -164, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 54*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_4
    nop
andF_4:
    set         0, %l2
    ba      andEnd_4
    nop
andT_4:
    set         1, %l2
andEnd_4:
/* line number 54*/
/* Storing result of Binary Op */
    set         -168, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 54*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -168, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_17
    nop
printTrue_17:
    set         _boolT, %o1
    ba      branchEnd_17
    nop
printFalse_17:
    set         _boolF, %o1
branchEnd_17:
    call    printf
    nop
/* line number 54*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 55*/
/* Saving return value */
    st          %o0, [%fp+-172]
/* line number 55*/
/* Negating */
    set         -172, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_23
    nop
decrement_23:
    dec     %l0
    ba      negEnd_23
    nop
increment_23:
    inc     %l0
negEnd_23:
    set         -176, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Short-circuiting && with Validating UnaryOp foo3() as a BooleanType for operator: !...
 */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_5
    nop
    call    foo3
    nop
/* line number 55*/
/* Saving return value */
    st          %o0, [%fp+-180]
/* line number 55*/
/* Negating */
    set         -180, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_24
    nop
decrement_24:
    dec     %l0
    ba      negEnd_24
    nop
increment_24:
    inc     %l0
negEnd_24:
    set         -184, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Prepping Arithmetic Calculations by loading */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -184, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 55*/
/* &&-ing */
    cmp         %l2, %g0
    bne     andT_5
    nop
andF_5:
    set         0, %l2
    ba      andEnd_5
    nop
andT_5:
    set         1, %l2
andEnd_5:
/* line number 55*/
/* Storing result of Binary Op */
    set         -188, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 55*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -188, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_18
    nop
printTrue_18:
    set         _boolT, %o1
    ba      branchEnd_18
    nop
printFalse_18:
    set         _boolF, %o1
branchEnd_18:
    call    printf
    nop
/* line number 55*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 188) & -8
