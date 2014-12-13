! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b,c,d
a:              .word        1           
b:              .word        0           
c:              .word        0           
d:              .word        0           
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
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
/* line number 4*/
/* Short-circuiting && with a */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     andT_0
    nop
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 4*/
/* &&-ing */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
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
/* line number 4*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 5*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 into c */
    set         c, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 5*/
/* Short-circuiting || with b */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* ||-ing */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     orT_0
    nop
orF_0:
    set         0, %l2
    ba      orEnd_0
    nop
orT_0:
    set         1, %l2
orEnd_0:
/* line number 5*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 7*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 into d */
    set         d, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 9*/
/* Printing bool c */
    set         c, %l1
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
/* line number 9*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Printing bool d */
    set         d, %l1
    add         %g0, %l1, %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Short-circuiting && with a */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     andT_1
    nop
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
/* &&-ing */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
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
/* line number 11*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 11*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -8, %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Short-circuiting && with b */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     andT_2
    nop
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* &&-ing */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     andT_2
    nop
andF_2:
    set         0, %l2
    ba      andEnd_2
    nop
andT_1:
    set         1, %l2
andEnd_2:
/* line number 12*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 12*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -12, %l1
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
/* line number 12*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Short-circuiting || with a */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* ||-ing */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     orT_1
    nop
orF_1:
    set         0, %l2
    ba      orEnd_1
    nop
orT_1:
    set         1, %l2
orEnd_1:
/* line number 14*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 14*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
    set         -16, %l1
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
/* line number 14*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Short-circuiting || with b */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_2
    nop
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* ||-ing */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     orT_2
    nop
orF_2:
    set         0, %l2
    ba      orEnd_2
    nop
orT_2:
    set         1, %l2
orEnd_2:
/* line number 15*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 15*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
    set         -20, %l1
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
/* line number 15*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
