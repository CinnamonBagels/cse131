! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r5.5       
float_7:        .single      0r5.55      
str_1:          .asciz       "Should be printed 1"
str_2:          .asciz       "should not be printed"
str_3:          .asciz       "ajax should not be assigned to false"
str_4:          .asciz       "ajax is still: "
str_5:          .asciz       "ajax's value is: "
str_6:          .asciz       "priam section should only be printed once"
str_8:          .asciz       "hector is less than 5.55"
str_9:          .asciz       "paris is: "
str_10:         .asciz       "hector section should not be printed"
str_11:         .asciz       "homer is: "
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
/* setting achilles = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 5*/
/* setting odysseus = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 5*/
/* Done. */
/* line number 6*/
/* setting ajax = true */
    set         1, %l0
    st          %l0, [%fp-16]
/* line number 6*/
/* Done. */
/* line number 8*/
/* setting priam = false */
    set         0, %l0
    st          %l0, [%fp-20]
/* line number 8*/
/* Done. */
/* line number 10*/
/* setting hector = 5.5 */
    set         -24, %l0
    add         %fp, %l0, %l0
/* line number 10*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 10*/
/* Done. */
/* line number 11*/
/* setting homer = 10 */
    set         10, %l0
    st          %l0, [%fp-28]
/* line number 11*/
/* Done. */
/* line number 13*/
/* setting paris = 99 */
    set         99, %l0
    st          %l0, [%fp-32]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Short-circuiting || with achilles */
/* line number 13*/
/* Loading achilles to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
/* line number 13*/
/* Loading achilles to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading ajax to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
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
/* line number 13*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 14*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
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
endIf_1:
/* line number 21*/
/* Negating */
/* line number 21*/
/* Loading achilles to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
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
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Short-circuiting && with Validating UnaryOp achilles as a BooleanType for operator: !...
 */
/* line number 21*/
/* Loading Validating UnaryOp achilles as a BooleanType for operator: !...
 to %l1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
! --storing constant ajax with value 0.0
    set         -16, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading Validating UnaryOp achilles as a BooleanType for operator: !...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading ajax to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 21*/
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
/* line number 21*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 22*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Printing bool ajax */
/* line number 27*/
/* Loading ajax to %l0 */
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
/* line number 27*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
while_0:
/* line number 28*/
/* Prepping Comparison Calculations by loading */
/* line number 28*/
/* Loading homer to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 28*/
/* Loading 15 to %l1 */
    set         15, %l1
/* line number 28*/
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
/* line number 28*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 30*/
/* Prepping Comparison Calculations by loading */
/* line number 30*/
/* Loading ajax to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 30*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 30*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_1
    nop
    set         0, %l3
    ba      equalEnd_1
    nop
equal_1:
    set         1, %l3
equalEnd_1:
/* line number 30*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 31*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* Printing bool ajax */
/* line number 32*/
/* Loading ajax to %l0 */
    set         -16, %l1
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
/* line number 32*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
while_1:
/* line number 33*/
/* Prepping Comparison Calculations by loading */
/* line number 33*/
/* Loading priam to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 33*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 33*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_2
    nop
    set         0, %l3
    ba      equalEnd_2
    nop
equal_2:
    set         1, %l3
equalEnd_2:
/* line number 33*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 34*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Breaking out of while loop */
    ba      whileEnd_1
    nop
    ba      while_1
    nop
whileEnd_1:
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 39*/
/* Prepping Comparison Calculations by loading */
/* line number 39*/
/* Starting Less than */
/* line number 39*/
/* Loading hector to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Storing variable 5.55 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 39*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbl     less_3
    nop
    set         0, %l3
    ba      lessEnd_3
    nop
less_3:
    set         1, %l3
lessEnd_3:
/* line number 39*/
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 40*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: <...
 to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 41*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 41*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_2:
/* line number 42*/
/* Prepping Comparison Calculations by loading */
/* line number 42*/
/* Loading paris to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 42*/
/* Loading 97 to %l1 */
    set         97, %l1
/* line number 42*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* line number 42*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 43*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_2
    nop
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int paris */
    set         _intFmt, %o0
/* line number 44*/
/* Loading paris to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Decrementing */
/* line number 45*/
/* Loading paris to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -32, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_2
    nop
whileEnd_2:
    ba      endIf_7
    nop
else_6:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_7:
/* line number 53*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 53*/
/* Done printing string. */
/* line number 53*/
/* Printing int homer */
    set         _intFmt, %o0
/* line number 53*/
/* Loading homer to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 53*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* Incrementing */
/* line number 54*/
/* Loading homer to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -28, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
endIf_3:
main_end:
    ret 
    restore
SAVE.main = -(92 + 72) & -8
