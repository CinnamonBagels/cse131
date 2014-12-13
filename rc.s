! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "1"         
str_1:          .asciz       "x's value: "
str_2:          .asciz       "y's value: "
str_3:          .asciz       "2"         
str_4:          .asciz       "y's value: "
str_5:          .asciz       "3"         
str_6:          .asciz       "x's value: "
str_7:          .asciz       "y's value: "
str_8:          .asciz       "this should not be printed 1"
str_9:          .asciz       "x's value: "
str_10:         .asciz       "y's value: "
str_11:         .asciz       "x's value: "
str_12:         .asciz       "x's value: "
str_13:         .asciz       "y's value: "
str_14:         .asciz       "4"         
str_15:         .asciz       "y's value: "
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
/* line number 7*/
/* setting y = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Short-circuiting || with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 7*/
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
/* line number 7*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Printing bool x */
    set         -8, %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 14*/
/* Short-circuiting || with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
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
/* line number 14*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 21*/
/* Short-circuiting || with y */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_2
    nop
! --storing constant x with value 0.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 21*/
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
/* line number 21*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing bool x */
    set         -8, %l1
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
/* line number 24*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 25*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
! --storing constant x with value 0.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 29*/
/* Short-circuiting || with x */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_3
    nop
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         0, %l1
/* line number 29*/
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
/* line number 29*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 29*/
/* Short-circuiting || with Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_4
    nop
! --storing constant y with value 0.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 29*/
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
/* line number 29*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Printing bool x */
    set         -8, %l1
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
/* line number 36*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
/* line number 37*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 37*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* Short-circuiting || with y */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_5
    nop
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 39*/
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
/* line number 39*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 39*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 41*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 41*/
/* Done printing string. */
/* line number 41*/
/* Printing bool x */
    set         -8, %l1
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
/* line number 41*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 43*/
/* Prepping Arithmetic Calculations by loading */
    set         1, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 43*/
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
/* line number 43*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 43*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -40, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
/* Printing bool x */
    set         -8, %l1
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
/* line number 45*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
/* line number 46*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 46*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 48*/
/* Storing variable x into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 48*/
/* Prepping Arithmetic Calculations by loading */
    set         0, %l0
    set         -12, %l1
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
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 51*/
/* Done printing string. */
/* line number 51*/
/* Printing bool y */
    set         -12, %l1
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
/* line number 51*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
endIf_9:
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
