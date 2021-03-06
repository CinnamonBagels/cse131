! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     luke,wedge,goldFive,redFive
luke:           .word        1           
wedge:          .word        0           
goldFive:       .word        1           
redFive:        .word        1           
str_0:          .asciz       "luke is true"
str_1:          .asciz       "wedge is false"
str_2:          .asciz       "luke is not false"
str_3:          .asciz       "wedge is not true"
str_4:          .asciz       "luke is red five"
str_5:          .asciz       "wedge is not gold five"
str_6:          .asciz       "true is true"
str_7:          .asciz       "false is false"
str_8:          .asciz       "true is not false"
str_9:          .asciz       "false is not true"
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
/* line number 8*/
/* Prepping Comparison Calculations by loading */
/* line number 8*/
/* Loading luke to %l0 */
    set         luke, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 8*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_0
    nop
    set         0, %l3
    ba      equalEnd_0
    nop
equal_0:
    set         1, %l3
equalEnd_0:
/* line number 8*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Loading wedge to %l0 */
    set         wedge, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 12*/
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
/* line number 12*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading luke to %l0 */
    set         luke, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 16*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_2
    nop
    set         0, %l3
    ba      nEqualEnd_2
    nop
nEqual_2:
    set         1, %l3
nEqualEnd_2:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: !=...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading wedge to %l0 */
    set         wedge, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 20*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_3
    nop
    set         0, %l3
    ba      nEqualEnd_3
    nop
nEqual_3:
    set         1, %l3
nEqualEnd_3:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: !=...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 24*/
/* Prepping Comparison Calculations by loading */
/* line number 24*/
/* Loading luke to %l0 */
    set         luke, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading redFive to %l1 */
    set         redFive, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 24*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_4
    nop
    set         0, %l3
    ba      equalEnd_4
    nop
equal_4:
    set         1, %l3
equalEnd_4:
/* line number 24*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 26*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 26*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 28*/
/* Prepping Comparison Calculations by loading */
/* line number 28*/
/* Loading wedge to %l0 */
    set         wedge, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 28*/
/* Loading goldFive to %l1 */
    set         goldFive, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 28*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_5
    nop
    set         0, %l3
    ba      nEqualEnd_5
    nop
nEqual_5:
    set         1, %l3
nEqualEnd_5:
/* line number 28*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: !=...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_11
    nop
else_10:
endIf_11:
/* line number 32*/
/* Prepping Comparison Calculations by loading */
/* line number 32*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 32*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 32*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_6
    nop
    set         0, %l3
    ba      equalEnd_6
    nop
equal_6:
    set         1, %l3
equalEnd_6:
/* line number 32*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 33*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_12:
endIf_13:
/* line number 36*/
/* Prepping Comparison Calculations by loading */
/* line number 36*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 36*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 36*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_7
    nop
    set         0, %l3
    ba      equalEnd_7
    nop
equal_7:
    set         1, %l3
equalEnd_7:
/* line number 36*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: ==...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_15
    nop
else_14:
endIf_15:
/* line number 40*/
/* Prepping Comparison Calculations by loading */
/* line number 40*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 40*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 40*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_8
    nop
    set         0, %l3
    ba      nEqualEnd_8
    nop
nEqual_8:
    set         1, %l3
nEqualEnd_8:
/* line number 40*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 41*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: !=...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_16
    nop
if_16:
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_17
    nop
else_16:
endIf_17:
/* line number 44*/
/* Prepping Comparison Calculations by loading */
/* line number 44*/
/* Loading false to %l0 */
    set         0, %l0
/* line number 44*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 44*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_9
    nop
    set         0, %l3
    ba      nEqualEnd_9
    nop
nEqual_9:
    set         1, %l3
nEqualEnd_9:
/* line number 44*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 45*/
/* Loading Validating ComparisonOp bool and bool as a BooleanType for operator: !=...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_18
    nop
if_18:
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
    ba      endIf_19
    nop
else_18:
endIf_19:
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
