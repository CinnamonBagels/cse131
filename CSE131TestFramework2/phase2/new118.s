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
/* line number 18*/
/* Loading a to %i0 */
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
/* line number 21*/
/* Storing parameter t */
    st          %i0, [%fp+-8]
/* line number 23*/
/* Returning value from foo3 */
/* line number 23*/
/* Loading t to %i0 */
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
/* line number 31*/
/* setting r = 3 */
    set         3, %l0
    st          %l0, [%fp-16]
/* line number 31*/
/* Done. */
/* line number 32*/
/* setting s = 5 */
    set         5, %l0
    st          %l0, [%fp-20]
/* line number 32*/
/* Done. */
/* line number 34*/
/* setting t = 7 */
    set         7, %l0
    st          %l0, [%fp-24]
/* line number 34*/
/* Done. */
/* line number 34*/
/* Short-circuiting || with true */
/* line number 34*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* Short-circuiting || with false */
/* line number 35*/
/* Loading false to %l1 */
    set         0, %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* Short-circuiting || with true */
/* line number 36*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Short-circuiting || with false */
/* line number 37*/
/* Loading false to %l1 */
    set         0, %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* Short-circuiting || with a */
/* line number 39*/
/* Loading a to %l1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
/* line number 39*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 39*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 39*/
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
/* line number 39*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 39*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 39*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -28, %l1
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
/* line number 39*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 40*/
/* Short-circuiting || with a */
/* line number 40*/
/* Loading a to %l1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
/* line number 40*/
/* Prepping Arithmetic Calculations by loading */
/* line number 40*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 40*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 40*/
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
/* line number 40*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 40*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 40*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -32, %l1
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
/* line number 40*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* Short-circuiting || with a */
/* line number 41*/
/* Loading a to %l1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_2
    nop
/* line number 41*/
/* Prepping Arithmetic Calculations by loading */
/* line number 41*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 41*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 41*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_2
    nop
orF_2:
    set         0, %l2
    ba      orEnd_2
    nop
orT_2:
    set         1, %l2
orEnd_2:
/* line number 41*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 41*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 41*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -36, %l1
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
/* line number 41*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 42*/
/* Short-circuiting || with a */
/* line number 42*/
/* Loading a to %l1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_3
    nop
/* line number 42*/
/* Prepping Arithmetic Calculations by loading */
/* line number 42*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 42*/
/* Loading y to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 42*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_3
    nop
orF_3:
    set         0, %l2
    ba      orEnd_3
    nop
orT_3:
    set         1, %l2
orEnd_3:
/* line number 42*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 42*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 42*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -40, %l1
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
/* line number 42*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* Prepping Comparison Calculations by loading */
/* line number 44*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 44*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 44*/
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
/* line number 44*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 44*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 44*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_4
    nop
/* line number 44*/
/* Prepping Arithmetic Calculations by loading */
/* line number 44*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 44*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 44*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_4
    nop
orF_4:
    set         0, %l2
    ba      orEnd_4
    nop
orT_4:
    set         1, %l2
orEnd_4:
/* line number 44*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 44*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 44*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -48, %l1
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
/* line number 44*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Short-circuiting || with true */
/* line number 45*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    bne     orT_5
    nop
/* line number 45*/
/* Prepping Comparison Calculations by loading */
/* line number 45*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 45*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 45*/
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
/* line number 45*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 45*/
/* Prepping Arithmetic Calculations by loading */
/* line number 45*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 45*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 45*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_5
    nop
orF_5:
    set         0, %l2
    ba      orEnd_5
    nop
orT_5:
    set         1, %l2
orEnd_5:
/* line number 45*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 45*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 45*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -56, %l1
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
/* line number 45*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 47*/
/* Prepping Comparison Calculations by loading */
/* line number 47*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 47*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 47*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 47*/
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 47*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 47*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_6
    nop
/* line number 47*/
/* Prepping Arithmetic Calculations by loading */
/* line number 47*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 47*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 47*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_6
    nop
orF_6:
    set         0, %l2
    ba      orEnd_6
    nop
orT_6:
    set         1, %l2
orEnd_6:
/* line number 47*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 47*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 47*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
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
/* line number 47*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 48*/
/* Short-circuiting || with false */
/* line number 48*/
/* Loading false to %l1 */
    set         0, %l1
    cmp         %l1, %g0
    bne     orT_7
    nop
/* line number 48*/
/* Prepping Comparison Calculations by loading */
/* line number 48*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 48*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 48*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_3
    nop
    set         0, %l3
    ba      lessEnd_3
    nop
less_3:
    set         1, %l3
lessEnd_3:
/* line number 48*/
/* Storing result of Comparison Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 48*/
/* Prepping Arithmetic Calculations by loading */
/* line number 48*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 48*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 48*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_7
    nop
orF_7:
    set         0, %l2
    ba      orEnd_7
    nop
orT_7:
    set         1, %l2
orEnd_7:
/* line number 48*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 48*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 48*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -72, %l1
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
/* line number 48*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 50*/
/* Prepping Comparison Calculations by loading */
/* line number 50*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 50*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 50*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_4
    nop
    set         0, %l3
    ba      lessEnd_4
    nop
less_4:
    set         1, %l3
lessEnd_4:
/* line number 50*/
/* Storing result of Comparison Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 50*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 50*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_8
    nop
/* line number 50*/
/* Prepping Comparison Calculations by loading */
/* line number 50*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 50*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 50*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_5
    nop
    set         0, %l3
    ba      lessEnd_5
    nop
less_5:
    set         1, %l3
lessEnd_5:
/* line number 50*/
/* Storing result of Comparison Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 50*/
/* Prepping Arithmetic Calculations by loading */
/* line number 50*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 50*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 50*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_8
    nop
orF_8:
    set         0, %l2
    ba      orEnd_8
    nop
orT_8:
    set         1, %l2
orEnd_8:
/* line number 50*/
/* Storing result of Binary Op */
    set         -84, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 50*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 50*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
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
/* line number 50*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* Prepping Comparison Calculations by loading */
/* line number 51*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 51*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 51*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_6
    nop
    set         0, %l3
    ba      lessEnd_6
    nop
less_6:
    set         1, %l3
lessEnd_6:
/* line number 51*/
/* Storing result of Comparison Op */
    set         -88, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 51*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 51*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_9
    nop
/* line number 51*/
/* Prepping Comparison Calculations by loading */
/* line number 51*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 51*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 51*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_7
    nop
    set         0, %l3
    ba      lessEnd_7
    nop
less_7:
    set         1, %l3
lessEnd_7:
/* line number 51*/
/* Storing result of Comparison Op */
    set         -92, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 51*/
/* Prepping Arithmetic Calculations by loading */
/* line number 51*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 51*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 51*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_9
    nop
orF_9:
    set         0, %l2
    ba      orEnd_9
    nop
orT_9:
    set         1, %l2
orEnd_9:
/* line number 51*/
/* Storing result of Binary Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 51*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 51*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -96, %l1
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
/* line number 51*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 52*/
/* Prepping Comparison Calculations by loading */
/* line number 52*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 52*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 52*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_8
    nop
    set         0, %l3
    ba      lessEnd_8
    nop
less_8:
    set         1, %l3
lessEnd_8:
/* line number 52*/
/* Storing result of Comparison Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 52*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 52*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_10
    nop
/* line number 52*/
/* Prepping Comparison Calculations by loading */
/* line number 52*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 52*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 52*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_9
    nop
    set         0, %l3
    ba      lessEnd_9
    nop
less_9:
    set         1, %l3
lessEnd_9:
/* line number 52*/
/* Storing result of Comparison Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 52*/
/* Prepping Arithmetic Calculations by loading */
/* line number 52*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 52*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 52*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_10
    nop
orF_10:
    set         0, %l2
    ba      orEnd_10
    nop
orT_10:
    set         1, %l2
orEnd_10:
/* line number 52*/
/* Storing result of Binary Op */
    set         -108, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 52*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 52*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -108, %l1
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
/* line number 52*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 53*/
/* Prepping Comparison Calculations by loading */
/* line number 53*/
/* Loading r to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 53*/
/* Loading s to %l1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 53*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_10
    nop
    set         0, %l3
    ba      lessEnd_10
    nop
less_10:
    set         1, %l3
lessEnd_10:
/* line number 53*/
/* Storing result of Comparison Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 53*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: <...
 */
/* line number 53*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_11
    nop
/* line number 53*/
/* Prepping Comparison Calculations by loading */
/* line number 53*/
/* Loading s to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 53*/
/* Loading r to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 53*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_11
    nop
    set         0, %l3
    ba      lessEnd_11
    nop
less_11:
    set         1, %l3
lessEnd_11:
/* line number 53*/
/* Storing result of Comparison Op */
    set         -116, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 53*/
/* Prepping Arithmetic Calculations by loading */
/* line number 53*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 53*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l1 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 53*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_11
    nop
orF_11:
    set         0, %l2
    ba      orEnd_11
    nop
orT_11:
    set         1, %l2
orEnd_11:
/* line number 53*/
/* Storing result of Binary Op */
    set         -120, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 53*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 53*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -120, %l1
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
/* line number 53*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 55*/
/* Saving return value */
    st          %o0, [%fp+-124]
/* line number 55*/
/* Short-circuiting || with foo1() */
/* line number 55*/
/* Loading foo1() to %l1 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_12
    nop
    call    foo
    nop
/* line number 55*/
/* Saving return value */
    st          %o0, [%fp+-128]
/* line number 55*/
/* Prepping Arithmetic Calculations by loading */
/* line number 55*/
/* Loading foo1() to %l0 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 55*/
/* Loading foo() to %l1 */
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 55*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_12
    nop
orF_12:
    set         0, %l2
    ba      orEnd_12
    nop
orT_12:
    set         1, %l2
orEnd_12:
/* line number 55*/
/* Storing result of Binary Op */
    set         -132, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 55*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 55*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -132, %l1
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
/* line number 55*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 56*/
/* Saving return value */
    st          %o0, [%fp+-136]
/* line number 56*/
/* Short-circuiting || with foo() */
/* line number 56*/
/* Loading foo() to %l1 */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_13
    nop
    call    foo1
    nop
/* line number 56*/
/* Saving return value */
    st          %o0, [%fp+-140]
/* line number 56*/
/* Prepping Arithmetic Calculations by loading */
/* line number 56*/
/* Loading foo() to %l0 */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 56*/
/* Loading foo1() to %l1 */
    set         -140, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 56*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_13
    nop
orF_13:
    set         0, %l2
    ba      orEnd_13
    nop
orT_13:
    set         1, %l2
orEnd_13:
/* line number 56*/
/* Storing result of Binary Op */
    set         -144, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 56*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 56*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -144, %l1
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
/* line number 56*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 57*/
/* Saving return value */
    st          %o0, [%fp+-148]
/* line number 57*/
/* Short-circuiting || with foo() */
/* line number 57*/
/* Loading foo() to %l1 */
    set         -148, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_14
    nop
    call    foo
    nop
/* line number 57*/
/* Saving return value */
    st          %o0, [%fp+-152]
/* line number 57*/
/* Prepping Arithmetic Calculations by loading */
/* line number 57*/
/* Loading foo() to %l0 */
    set         -148, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 57*/
/* Loading foo() to %l1 */
    set         -152, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 57*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_14
    nop
orF_14:
    set         0, %l2
    ba      orEnd_14
    nop
orT_14:
    set         1, %l2
orEnd_14:
/* line number 57*/
/* Storing result of Binary Op */
    set         -156, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 57*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 57*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -156, %l1
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
/* line number 57*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 58*/
/* Saving return value */
    st          %o0, [%fp+-160]
/* line number 58*/
/* Short-circuiting || with foo1() */
/* line number 58*/
/* Loading foo1() to %l1 */
    set         -160, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_15
    nop
    call    foo1
    nop
/* line number 58*/
/* Saving return value */
    st          %o0, [%fp+-164]
/* line number 58*/
/* Prepping Arithmetic Calculations by loading */
/* line number 58*/
/* Loading foo1() to %l0 */
    set         -160, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 58*/
/* Loading foo1() to %l1 */
    set         -164, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 58*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_15
    nop
orF_15:
    set         0, %l2
    ba      orEnd_15
    nop
orT_15:
    set         1, %l2
orEnd_15:
/* line number 58*/
/* Storing result of Binary Op */
    set         -168, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 58*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 58*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -168, %l1
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
/* line number 58*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 60*/
/* Saving return value */
    st          %o0, [%fp+-172]
/* line number 60*/
/* Short-circuiting || with foo2() */
/* line number 60*/
/* Loading foo2() to %l1 */
    set         -172, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_16
    nop
    call    foo
    nop
/* line number 60*/
/* Saving return value */
    st          %o0, [%fp+-176]
/* line number 60*/
/* Prepping Arithmetic Calculations by loading */
/* line number 60*/
/* Loading foo2() to %l0 */
    set         -172, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 60*/
/* Loading foo() to %l1 */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 60*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_16
    nop
orF_16:
    set         0, %l2
    ba      orEnd_16
    nop
orT_16:
    set         1, %l2
orEnd_16:
/* line number 60*/
/* Storing result of Binary Op */
    set         -180, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 60*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 60*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -180, %l1
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
/* line number 60*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 61*/
/* Saving return value */
    st          %o0, [%fp+-184]
/* line number 61*/
/* Short-circuiting || with foo() */
/* line number 61*/
/* Loading foo() to %l1 */
    set         -184, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_17
    nop
    call    foo2
    nop
/* line number 61*/
/* Saving return value */
    st          %o0, [%fp+-188]
/* line number 61*/
/* Prepping Arithmetic Calculations by loading */
/* line number 61*/
/* Loading foo() to %l0 */
    set         -184, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 61*/
/* Loading foo2() to %l1 */
    set         -188, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 61*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_17
    nop
orF_17:
    set         0, %l2
    ba      orEnd_17
    nop
orT_17:
    set         1, %l2
orEnd_17:
/* line number 61*/
/* Storing result of Binary Op */
    set         -192, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 61*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 61*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -192, %l1
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
/* line number 61*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo1
    nop
/* line number 62*/
/* Saving return value */
    st          %o0, [%fp+-196]
/* line number 62*/
/* Short-circuiting || with foo1() */
/* line number 62*/
/* Loading foo1() to %l1 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_18
    nop
    call    foo2
    nop
/* line number 62*/
/* Saving return value */
    st          %o0, [%fp+-200]
/* line number 62*/
/* Prepping Arithmetic Calculations by loading */
/* line number 62*/
/* Loading foo1() to %l0 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 62*/
/* Loading foo2() to %l1 */
    set         -200, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 62*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_18
    nop
orF_18:
    set         0, %l2
    ba      orEnd_18
    nop
orT_18:
    set         1, %l2
orEnd_18:
/* line number 62*/
/* Storing result of Binary Op */
    set         -204, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 62*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 62*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -204, %l1
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
/* line number 62*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 63*/
/* Saving return value */
    st          %o0, [%fp+-208]
/* line number 63*/
/* Short-circuiting || with foo2() */
/* line number 63*/
/* Loading foo2() to %l1 */
    set         -208, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_19
    nop
    call    foo1
    nop
/* line number 63*/
/* Saving return value */
    st          %o0, [%fp+-212]
/* line number 63*/
/* Prepping Arithmetic Calculations by loading */
/* line number 63*/
/* Loading foo2() to %l0 */
    set         -208, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 63*/
/* Loading foo1() to %l1 */
    set         -212, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 63*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_19
    nop
orF_19:
    set         0, %l2
    ba      orEnd_19
    nop
orT_19:
    set         1, %l2
orEnd_19:
/* line number 63*/
/* Storing result of Binary Op */
    set         -216, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 63*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 63*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -216, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_19
    nop
printTrue_19:
    set         _boolT, %o1
    ba      branchEnd_19
    nop
printFalse_19:
    set         _boolF, %o1
branchEnd_19:
    call    printf
    nop
/* line number 63*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 65*/
/* Saving return value */
    st          %o0, [%fp+-220]
/* line number 65*/
/* Short-circuiting || with foo2() */
/* line number 65*/
/* Loading foo2() to %l1 */
    set         -220, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_20
    nop
    call    foo3
    nop
/* line number 65*/
/* Saving return value */
    st          %o0, [%fp+-224]
/* line number 65*/
/* Prepping Arithmetic Calculations by loading */
/* line number 65*/
/* Loading foo2() to %l0 */
    set         -220, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 65*/
/* Loading foo3() to %l1 */
    set         -224, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 65*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_20
    nop
orF_20:
    set         0, %l2
    ba      orEnd_20
    nop
orT_20:
    set         1, %l2
orEnd_20:
/* line number 65*/
/* Storing result of Binary Op */
    set         -228, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 65*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 65*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -228, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_20
    nop
printTrue_20:
    set         _boolT, %o1
    ba      branchEnd_20
    nop
printFalse_20:
    set         _boolF, %o1
branchEnd_20:
    call    printf
    nop
/* line number 65*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 66*/
/* Saving return value */
    st          %o0, [%fp+-232]
/* line number 66*/
/* Short-circuiting || with foo2() */
/* line number 66*/
/* Loading foo2() to %l1 */
    set         -232, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_21
    nop
    call    foo3
    nop
/* line number 66*/
/* Saving return value */
    st          %o0, [%fp+-236]
/* line number 66*/
/* Prepping Arithmetic Calculations by loading */
/* line number 66*/
/* Loading foo2() to %l0 */
    set         -232, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 66*/
/* Loading foo3() to %l1 */
    set         -236, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 66*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_21
    nop
orF_21:
    set         0, %l2
    ba      orEnd_21
    nop
orT_21:
    set         1, %l2
orEnd_21:
/* line number 66*/
/* Storing result of Binary Op */
    set         -240, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 66*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 66*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -240, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_21
    nop
printTrue_21:
    set         _boolT, %o1
    ba      branchEnd_21
    nop
printFalse_21:
    set         _boolF, %o1
branchEnd_21:
    call    printf
    nop
/* line number 66*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 67*/
/* Saving return value */
    st          %o0, [%fp+-244]
/* line number 67*/
/* Short-circuiting || with foo2() */
/* line number 67*/
/* Loading foo2() to %l1 */
    set         -244, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_22
    nop
    call    foo3
    nop
/* line number 67*/
/* Saving return value */
    st          %o0, [%fp+-248]
/* line number 67*/
/* Prepping Arithmetic Calculations by loading */
/* line number 67*/
/* Loading foo2() to %l0 */
    set         -244, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 67*/
/* Loading foo3() to %l1 */
    set         -248, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 67*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_22
    nop
orF_22:
    set         0, %l2
    ba      orEnd_22
    nop
orT_22:
    set         1, %l2
orEnd_22:
/* line number 67*/
/* Storing result of Binary Op */
    set         -252, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 67*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 67*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -252, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_22
    nop
printTrue_22:
    set         _boolT, %o1
    ba      branchEnd_22
    nop
printFalse_22:
    set         _boolF, %o1
branchEnd_22:
    call    printf
    nop
/* line number 67*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 68*/
/* Saving return value */
    st          %o0, [%fp+-256]
/* line number 68*/
/* Short-circuiting || with foo2() */
/* line number 68*/
/* Loading foo2() to %l1 */
    set         -256, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_23
    nop
    call    foo3
    nop
/* line number 68*/
/* Saving return value */
    st          %o0, [%fp+-260]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Loading foo2() to %l0 */
    set         -256, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 68*/
/* Loading foo3() to %l1 */
    set         -260, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 68*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_23
    nop
orF_23:
    set         0, %l2
    ba      orEnd_23
    nop
orT_23:
    set         1, %l2
orEnd_23:
/* line number 68*/
/* Storing result of Binary Op */
    set         -264, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 68*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 68*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -264, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_23
    nop
printTrue_23:
    set         _boolT, %o1
    ba      branchEnd_23
    nop
printFalse_23:
    set         _boolF, %o1
branchEnd_23:
    call    printf
    nop
/* line number 68*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 70*/
/* Saving return value */
    st          %o0, [%fp+-268]
/* line number 70*/
/* Short-circuiting || with foo3() */
/* line number 70*/
/* Loading foo3() to %l1 */
    set         -268, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_24
    nop
    call    foo3
    nop
/* line number 70*/
/* Saving return value */
    st          %o0, [%fp+-272]
/* line number 70*/
/* Prepping Arithmetic Calculations by loading */
/* line number 70*/
/* Loading foo3() to %l0 */
    set         -268, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 70*/
/* Loading foo3() to %l1 */
    set         -272, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 70*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_24
    nop
orF_24:
    set         0, %l2
    ba      orEnd_24
    nop
orT_24:
    set         1, %l2
orEnd_24:
/* line number 70*/
/* Storing result of Binary Op */
    set         -276, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 70*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 70*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -276, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_24
    nop
printTrue_24:
    set         _boolT, %o1
    ba      branchEnd_24
    nop
printFalse_24:
    set         _boolF, %o1
branchEnd_24:
    call    printf
    nop
/* line number 70*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 71*/
/* Saving return value */
    st          %o0, [%fp+-280]
/* line number 71*/
/* Short-circuiting || with foo3() */
/* line number 71*/
/* Loading foo3() to %l1 */
    set         -280, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_25
    nop
    call    foo3
    nop
/* line number 71*/
/* Saving return value */
    st          %o0, [%fp+-284]
/* line number 71*/
/* Prepping Arithmetic Calculations by loading */
/* line number 71*/
/* Loading foo3() to %l0 */
    set         -280, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 71*/
/* Loading foo3() to %l1 */
    set         -284, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 71*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_25
    nop
orF_25:
    set         0, %l2
    ba      orEnd_25
    nop
orT_25:
    set         1, %l2
orEnd_25:
/* line number 71*/
/* Storing result of Binary Op */
    set         -288, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 71*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 71*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -288, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_25
    nop
printTrue_25:
    set         _boolT, %o1
    ba      branchEnd_25
    nop
printFalse_25:
    set         _boolF, %o1
branchEnd_25:
    call    printf
    nop
/* line number 71*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 72*/
/* Saving return value */
    st          %o0, [%fp+-292]
/* line number 72*/
/* Short-circuiting || with foo3() */
/* line number 72*/
/* Loading foo3() to %l1 */
    set         -292, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_26
    nop
    call    foo3
    nop
/* line number 72*/
/* Saving return value */
    st          %o0, [%fp+-296]
/* line number 72*/
/* Prepping Arithmetic Calculations by loading */
/* line number 72*/
/* Loading foo3() to %l0 */
    set         -292, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 72*/
/* Loading foo3() to %l1 */
    set         -296, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 72*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_26
    nop
orF_26:
    set         0, %l2
    ba      orEnd_26
    nop
orT_26:
    set         1, %l2
orEnd_26:
/* line number 72*/
/* Storing result of Binary Op */
    set         -300, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 72*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 72*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -300, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_26
    nop
printTrue_26:
    set         _boolT, %o1
    ba      branchEnd_26
    nop
printFalse_26:
    set         _boolF, %o1
branchEnd_26:
    call    printf
    nop
/* line number 72*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 73*/
/* Saving return value */
    st          %o0, [%fp+-304]
/* line number 73*/
/* Short-circuiting || with foo3() */
/* line number 73*/
/* Loading foo3() to %l1 */
    set         -304, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_27
    nop
    call    foo3
    nop
/* line number 73*/
/* Saving return value */
    st          %o0, [%fp+-308]
/* line number 73*/
/* Prepping Arithmetic Calculations by loading */
/* line number 73*/
/* Loading foo3() to %l0 */
    set         -304, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 73*/
/* Loading foo3() to %l1 */
    set         -308, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 73*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_27
    nop
orF_27:
    set         0, %l2
    ba      orEnd_27
    nop
orT_27:
    set         1, %l2
orEnd_27:
/* line number 73*/
/* Storing result of Binary Op */
    set         -312, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 73*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 73*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -312, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_27
    nop
printTrue_27:
    set         _boolT, %o1
    ba      branchEnd_27
    nop
printFalse_27:
    set         _boolF, %o1
branchEnd_27:
    call    printf
    nop
/* line number 73*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 75*/
/* Saving return value */
    st          %o0, [%fp+-316]
/* line number 75*/
/* Short-circuiting || with foo3() */
/* line number 75*/
/* Loading foo3() to %l1 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_28
    nop
    call    foo3
    nop
/* line number 75*/
/* Saving return value */
    st          %o0, [%fp+-320]
/* line number 75*/
/* Prepping Arithmetic Calculations by loading */
/* line number 75*/
/* Loading foo3() to %l0 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 75*/
/* Loading foo3() to %l1 */
    set         -320, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 75*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_28
    nop
orF_28:
    set         0, %l2
    ba      orEnd_28
    nop
orT_28:
    set         1, %l2
orEnd_28:
/* line number 75*/
/* Storing result of Binary Op */
    set         -324, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 75*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 75*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -324, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_28
    nop
printTrue_28:
    set         _boolT, %o1
    ba      branchEnd_28
    nop
printFalse_28:
    set         _boolF, %o1
branchEnd_28:
    call    printf
    nop
/* line number 75*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 76*/
/* Saving return value */
    st          %o0, [%fp+-328]
/* line number 76*/
/* Short-circuiting || with foo3() */
/* line number 76*/
/* Loading foo3() to %l1 */
    set         -328, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_29
    nop
    call    foo3
    nop
/* line number 76*/
/* Saving return value */
    st          %o0, [%fp+-332]
/* line number 76*/
/* Prepping Arithmetic Calculations by loading */
/* line number 76*/
/* Loading foo3() to %l0 */
    set         -328, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 76*/
/* Loading foo3() to %l1 */
    set         -332, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 76*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_29
    nop
orF_29:
    set         0, %l2
    ba      orEnd_29
    nop
orT_29:
    set         1, %l2
orEnd_29:
/* line number 76*/
/* Storing result of Binary Op */
    set         -336, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 76*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 76*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -336, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_29
    nop
printTrue_29:
    set         _boolT, %o1
    ba      branchEnd_29
    nop
printFalse_29:
    set         _boolF, %o1
branchEnd_29:
    call    printf
    nop
/* line number 76*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 77*/
/* Saving return value */
    st          %o0, [%fp+-340]
/* line number 77*/
/* Short-circuiting || with foo3() */
/* line number 77*/
/* Loading foo3() to %l1 */
    set         -340, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_30
    nop
    call    foo3
    nop
/* line number 77*/
/* Saving return value */
    st          %o0, [%fp+-344]
/* line number 77*/
/* Prepping Arithmetic Calculations by loading */
/* line number 77*/
/* Loading foo3() to %l0 */
    set         -340, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 77*/
/* Loading foo3() to %l1 */
    set         -344, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 77*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_30
    nop
orF_30:
    set         0, %l2
    ba      orEnd_30
    nop
orT_30:
    set         1, %l2
orEnd_30:
/* line number 77*/
/* Storing result of Binary Op */
    set         -348, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 77*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 77*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -348, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_30
    nop
printTrue_30:
    set         _boolT, %o1
    ba      branchEnd_30
    nop
printFalse_30:
    set         _boolF, %o1
branchEnd_30:
    call    printf
    nop
/* line number 77*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    call    foo3
    nop
/* line number 78*/
/* Saving return value */
    st          %o0, [%fp+-352]
/* line number 78*/
/* Short-circuiting || with foo3() */
/* line number 78*/
/* Loading foo3() to %l1 */
    set         -352, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_31
    nop
    call    foo3
    nop
/* line number 78*/
/* Saving return value */
    st          %o0, [%fp+-356]
/* line number 78*/
/* Prepping Arithmetic Calculations by loading */
/* line number 78*/
/* Loading foo3() to %l0 */
    set         -352, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 78*/
/* Loading foo3() to %l1 */
    set         -356, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 78*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_31
    nop
orF_31:
    set         0, %l2
    ba      orEnd_31
    nop
orT_31:
    set         1, %l2
orEnd_31:
/* line number 78*/
/* Storing result of Binary Op */
    set         -360, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 78*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 78*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -360, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_31
    nop
printTrue_31:
    set         _boolT, %o1
    ba      branchEnd_31
    nop
printFalse_31:
    set         _boolF, %o1
branchEnd_31:
    call    printf
    nop
/* line number 78*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 360) & -8
