! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "this should not be printed 1"
str_1:          .asciz       "1"         
str_2:          .asciz       "y's value: "
str_3:          .asciz       "this should not be printed 2"
str_4:          .asciz       "a's value: "
str_5:          .asciz       "2"         
str_6:          .asciz       "y's value: "
str_7:          .asciz       "z's value: "
str_8:          .asciz       "b's value: "
str_9:          .asciz       "this should not be printed 3"
str_10:         .asciz       "b's value: "
str_11:         .asciz       "a's value: "
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
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 4*/
/* setting x = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 6*/
/* setting y = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting ix = 4 */
    set         4, %l0
    st          %l0, [%fp-16]
/* line number 7*/
/* Done. */
/* line number 9*/
/* setting iy = 50 */
    set         50, %l0
    st          %l0, [%fp-20]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Short-circuiting && with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
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
/* line number 9*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 15*/
/* Short-circuiting && with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
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
/* line number 15*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 22*/
/* setting z = false */
    set         0, %l0
    st          %l0, [%fp-32]
/* line number 22*/
/* Done. */
/* line number 24*/
/* setting a = false */
    set         0, %l0
    st          %l0, [%fp-36]
/* line number 24*/
/* Done. */
/* line number 24*/
/* Short-circuiting && with z */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_2
    nop
! --storing constant a with value 1.0
    set         -36, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_2
    nop
andF_2:
    set         0, %l2
    ba      andEnd_2
    nop
andT_2:
    set         1, %l2
andEnd_2:
/* line number 24*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 26*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 26*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
/* line number 30*/
/* Printing bool a */
    set         -36, %l1
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
/* line number 30*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Short-circuiting && with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_3
    nop
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 32*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_3
    nop
andF_3:
    set         0, %l2
    ba      andEnd_3
    nop
andT_3:
    set         1, %l2
andEnd_3:
/* line number 32*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 32*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_4
    nop
! --storing constant z with value 1.0
    set         -32, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 32*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_4
    nop
andF_4:
    set         0, %l2
    ba      andEnd_4
    nop
andT_4:
    set         1, %l2
andEnd_4:
/* line number 32*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -48, %l1
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
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Printing bool y */
    set         -12, %l1
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
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Printing bool z */
    set         -32, %l1
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
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 40*/
/* Short-circuiting && with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_5
    nop
/* line number 40*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 40*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_5
    nop
andF_5:
    set         0, %l2
    ba      andEnd_5
    nop
andT_5:
    set         1, %l2
andEnd_5:
/* line number 40*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 42*/
/* setting b = Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -56, %l0
    add         %fp, %l0, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 42*/
/* Done. */
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
/* line number 42*/
/* Printing bool b */
    set         -56, %l1
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
/* line number 42*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant b with value 0.0
    set         -56, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 44*/
/* Short-circuiting && with b */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_6
    nop
/* line number 44*/
/* Prepping Arithmetic Calculations by loading */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 44*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_6
    nop
andF_6:
    set         0, %l2
    ba      andEnd_6
    nop
andT_6:
    set         1, %l2
andEnd_6:
/* line number 44*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 44*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_7
    nop
/* line number 44*/
/* Prepping Arithmetic Calculations by loading */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 44*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_7
    nop
andF_7:
    set         0, %l2
    ba      andEnd_7
    nop
andT_7:
    set         1, %l2
andEnd_7:
/* line number 44*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 44*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_8
    nop
/* line number 44*/
/* Prepping Arithmetic Calculations by loading */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 44*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_8
    nop
andF_8:
    set         0, %l2
    ba      andEnd_8
    nop
andT_8:
    set         1, %l2
andEnd_8:
/* line number 44*/
/* Storing result of Binary Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 44*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_9
    nop
! --storing constant a with value 1.0
    set         -36, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 44*/
/* Prepping Arithmetic Calculations by loading */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 44*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_9
    nop
andF_9:
    set         0, %l2
    ba      andEnd_9
    nop
andT_9:
    set         1, %l2
andEnd_9:
/* line number 44*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
/* line number 50*/
/* Printing bool b */
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
/* line number 50*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 51*/
/* Done printing string. */
/* line number 51*/
/* Printing bool a */
    set         -36, %l1
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
/* line number 51*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 72) & -8
