! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     dream1,dream2,dream3,dream4,dream5,dream6,winning
dream1:         .word        6           
dream2:         .word        5           
dream3:         .word        4           
dream4:         .word        3           
dream5:         .word        2           
dream6:         .word        1           
winning:        .word        1           
str_0:          .asciz       "First level of Inception"
str_1:          .asciz       "Second level of Inception"
str_2:          .asciz       "Third level of Inception"
str_3:          .asciz       "Fourth level of Inception"
str_4:          .asciz       "Fifth level of Inception"
str_5:          .asciz       "Bonzai!"   
str_6:          .asciz       "Second level of Inception"
str_7:          .asciz       "Third level of Inception"
str_8:          .asciz       "Fourth level of Inception"
str_9:          .asciz       "Fifth level of Inception"
str_10:         .asciz       "Bonzai!"   
str_11:         .asciz       "Third level of Inception"
str_12:         .asciz       "Fourth level of Inception"
str_13:         .asciz       "Fifth level of Inception"
str_14:         .asciz       "Bonzai!"   
str_15:         .asciz       "Fourth level of Inception"
str_16:         .asciz       "Fifth level of Inception"
str_17:         .asciz       "Bonzai!"   
str_18:         .asciz       "Fifth level of Inception"
str_19:         .asciz       "Bonzai!"   
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
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Loading dream1 to %l0 */
    set         dream1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 11*/
/* Loading dream2 to %l1 */
    set         dream2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
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
/* line number 11*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Comparison Calculations by loading */
/* line number 14*/
/* Loading dream2 to %l0 */
    set         dream2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading dream3 to %l1 */
    set         dream3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 14*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
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
/* line number 17*/
/* Prepping Comparison Calculations by loading */
/* line number 17*/
/* Loading dream3 to %l0 */
    set         dream3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading dream4 to %l1 */
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 17*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
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
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading dream4 to %l0 */
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading dream5 to %l1 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 20*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
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
/* line number 23*/
/* Prepping Comparison Calculations by loading */
/* line number 23*/
/* Loading dream5 to %l0 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 23*/
/* Loading dream6 to %l1 */
    set         dream6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 23*/
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
/* line number 23*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 24*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
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
/* line number 27*/
/* Loading winning to %l0 */
    set         winning, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_6
    nop
else_5:
endIf_6:
    ba      endIf_7
    nop
else_4:
endIf_7:
    ba      endIf_8
    nop
else_3:
endIf_8:
    ba      endIf_9
    nop
else_2:
endIf_9:
    ba      endIf_10
    nop
else_1:
endIf_10:
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
/* line number 35*/
/* Prepping Comparison Calculations by loading */
/* line number 35*/
/* Loading dream3 to %l0 */
    set         dream3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 35*/
/* Loading dream4 to %l1 */
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 35*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_5
    nop
    set         0, %l3
    ba      greaterEnd_5
    nop
greater_5:
    set         1, %l3
greaterEnd_5:
/* line number 35*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 36*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_11
    nop
if_11:
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* Prepping Comparison Calculations by loading */
/* line number 38*/
/* Loading dream4 to %l0 */
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 38*/
/* Loading dream5 to %l1 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 38*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_6
    nop
    set         0, %l3
    ba      greaterEnd_6
    nop
greater_6:
    set         1, %l3
greaterEnd_6:
/* line number 38*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 39*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 40*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 40*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* Prepping Comparison Calculations by loading */
/* line number 41*/
/* Loading dream5 to %l0 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 41*/
/* Loading dream6 to %l1 */
    set         dream6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 41*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_7
    nop
    set         0, %l3
    ba      greaterEnd_7
    nop
greater_7:
    set         1, %l3
greaterEnd_7:
/* line number 41*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 42*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_13
    nop
if_13:
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Loading winning to %l0 */
    set         winning, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_15
    nop
else_14:
endIf_15:
    ba      endIf_16
    nop
else_13:
endIf_16:
    ba      endIf_17
    nop
else_12:
endIf_17:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* Prepping Comparison Calculations by loading */
/* line number 51*/
/* Loading dream4 to %l0 */
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 51*/
/* Loading dream5 to %l1 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 51*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_8
    nop
    set         0, %l3
    ba      greaterEnd_8
    nop
greater_8:
    set         1, %l3
greaterEnd_8:
/* line number 51*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 52*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_18
    nop
if_18:
/* line number 53*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 53*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* Prepping Comparison Calculations by loading */
/* line number 54*/
/* Loading dream5 to %l0 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 54*/
/* Loading dream6 to %l1 */
    set         dream6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 54*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_9
    nop
    set         0, %l3
    ba      greaterEnd_9
    nop
greater_9:
    set         1, %l3
greaterEnd_9:
/* line number 54*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 55*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_19
    nop
if_19:
/* line number 56*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 58*/
/* Loading winning to %l0 */
    set         winning, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_20
    nop
if_20:
/* line number 59*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 59*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_21
    nop
else_20:
endIf_21:
    ba      endIf_22
    nop
else_19:
endIf_22:
/* line number 62*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 62*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 63*/
/* Prepping Comparison Calculations by loading */
/* line number 63*/
/* Loading dream5 to %l0 */
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 63*/
/* Loading dream6 to %l1 */
    set         dream6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 63*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_10
    nop
    set         0, %l3
    ba      greaterEnd_10
    nop
greater_10:
    set         1, %l3
greaterEnd_10:
/* line number 63*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 64*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_23
    nop
if_23:
/* line number 65*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 65*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 67*/
/* Loading winning to %l0 */
    set         winning, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_24
    nop
if_24:
/* line number 68*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 68*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_25
    nop
else_24:
endIf_25:
    ba      endIf_26
    nop
else_23:
endIf_26:
/* line number 71*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 71*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 73*/
/* Loading winning to %l0 */
    set         winning, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_27
    nop
if_27:
/* line number 74*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 74*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_28
    nop
else_27:
endIf_28:
    ba      endIf_29
    nop
else_18:
endIf_29:
    ba      endIf_30
    nop
else_11:
endIf_30:
    ba      endIf_31
    nop
else_0:
endIf_31:
main_end:
    ret 
    restore
SAVE.main = -(92 + 48) & -8
