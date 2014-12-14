! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
y:              .word        0           
staticGuard_y:    .word        0           
main_y:         .word        0           
staticGuard_main_y:    .word        0           
str_0:          .asciz       "YES!"      
str_1:          .asciz       "GOT YOU!"  
str_2:          .asciz       "YES!"      
str_3:          .asciz       "YES!"      
str_4:          .asciz       "GOT YOU!"  
str_5:          .asciz       "GOT YOU!"  
str_6:          .asciz       "YES!"      
str_7:          .asciz       "GOT YOU!"  
str_8:          .asciz       "YES!"      
str_9:          .asciz       "YES!"      
str_10:         .asciz       "GOT YOU!"  
str_11:         .asciz       "YES!"      
str_12:         .asciz       "GOT YOU!"  
str_13:         .asciz       "GOT YOU!"  
str_14:         .asciz       "YES!"      
str_15:         .asciz       "NO!"       
str_16:         .asciz       "YES!"      
str_17:         .asciz       "YES!"      
str_18:         .asciz       "GOT YOU!"  
str_19:         .asciz       "YES!"      
str_20:         .asciz       "GOT YOU!"  
str_21:         .asciz       "YES!"      
str_22:         .asciz       "GOT YOU!"  
str_23:         .asciz       "YES!"      
str_24:         .asciz       "YES!"      
str_25:         .asciz       "GOT YOU!"  
str_26:         .asciz       "YES!"      
str_27:         .asciz       "GOT YOU!"  
str_28:         .asciz       "GOT YOU!"  
str_29:         .asciz       "YES!"      
str_30:         .asciz       "NO!"       
str_31:         .asciz       "YES!"      
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
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
    set         staticGuard_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_y:
    set         staticGuard_main_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_y
    nop
    set         staticGuard_main_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_y:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
! --storing constant y with value 1.0
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 8*/
/* setting x = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
! --storing constant y with value 1.0
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 13*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 18*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 23*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 28*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 33*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 38*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_11
    nop
else_10:
endIf_11:
/* line number 43*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_12:
endIf_13:
/* line number 48*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 49*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 49*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_15
    nop
else_14:
endIf_15:
/* line number 53*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_16
    nop
if_16:
/* line number 54*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 54*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_17
    nop
else_16:
endIf_17:
/* line number 58*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_18
    nop
if_18:
/* line number 59*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 59*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_19
    nop
else_18:
endIf_19:
/* line number 63*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_20
    nop
if_20:
/* line number 64*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 64*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_21
    nop
else_20:
endIf_21:
/* line number 68*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_22
    nop
if_22:
/* line number 69*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 69*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_23
    nop
else_22:
endIf_23:
/* line number 73*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_24
    nop
if_24:
/* line number 74*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 74*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_25
    nop
else_24:
endIf_25:
/* line number 78*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_26
    nop
if_26:
/* line number 79*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 79*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_27
    nop
else_26:
endIf_27:
/* line number 82*/
/* Prepping Comparison Calculations by loading */
/* line number 82*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 82*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 82*/
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
/* line number 82*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 83*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_28
    nop
if_28:
/* line number 84*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 84*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_29
    nop
else_28:
endIf_29:
/* line number 87*/
/* Prepping Comparison Calculations by loading */
/* line number 87*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 87*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 87*/
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
/* line number 87*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 88*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_30
    nop
if_30:
/* line number 89*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 89*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_31
    nop
else_30:
endIf_31:
/* line number 92*/
/* Prepping Comparison Calculations by loading */
/* line number 92*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 92*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 92*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_2
    nop
    set         0, %l3
    ba      greaterEqualEnd_2
    nop
greaterEqual_2:
    set         1, %l3
greaterEqualEnd_2:
/* line number 92*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 93*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >=...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_32
    nop
if_32:
/* line number 94*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 94*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_33
    nop
else_32:
endIf_33:
/* line number 97*/
/* Prepping Comparison Calculations by loading */
/* line number 97*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 97*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 97*/
/* Starting Less than Equal */
    cmp         %l0, %l1
    ble     lessEqual_3
    nop
    set         0, %l3
    ba      lessEqualEnd_3
    nop
lessEqual_3:
    set         1, %l3
lessEqualEnd_3:
/* line number 97*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 98*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <=...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_34
    nop
if_34:
/* line number 99*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 99*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_35
    nop
else_34:
endIf_35:
/* line number 102*/
/* Prepping Comparison Calculations by loading */
/* line number 102*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 102*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 102*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_4
    nop
    set         0, %l3
    ba      greaterEqualEnd_4
    nop
greaterEqual_4:
    set         1, %l3
greaterEqualEnd_4:
/* line number 102*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 103*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >=...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_36
    nop
if_36:
/* line number 104*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 104*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_37
    nop
else_36:
endIf_37:
/* line number 107*/
/* Prepping Comparison Calculations by loading */
/* line number 107*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 107*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 107*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_5
    nop
    set         0, %l3
    ba      equalEnd_5
    nop
equal_5:
    set         1, %l3
equalEnd_5:
/* line number 107*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 108*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_38
    nop
if_38:
/* line number 109*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 109*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_39
    nop
else_38:
endIf_39:
/* line number 112*/
/* Prepping Comparison Calculations by loading */
/* line number 112*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 112*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 112*/
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
/* line number 112*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 113*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_40
    nop
if_40:
/* line number 114*/
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* line number 114*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_41
    nop
else_40:
endIf_41:
/* line number 117*/
/* Prepping Comparison Calculations by loading */
/* line number 117*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 117*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 117*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_7
    nop
    set         0, %l3
    ba      nEqualEnd_7
    nop
nEqual_7:
    set         1, %l3
nEqualEnd_7:
/* line number 117*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 118*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: !=...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_42
    nop
if_42:
/* line number 119*/
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* line number 119*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_43
    nop
else_42:
endIf_43:
/* line number 122*/
/* Prepping Comparison Calculations by loading */
/* line number 122*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 122*/
/* Loading x to %l1 */
    set         0, %l1
/* line number 122*/
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
/* line number 122*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 123*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: !=...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_44
    nop
if_44:
/* line number 124*/
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
/* line number 124*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_45
    nop
else_44:
endIf_45:
/* line number 127*/
/* Short-circuiting && with true */
/* line number 127*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 127*/
/* Prepping Arithmetic Calculations by loading */
/* line number 127*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 127*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 127*/
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
/* line number 127*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 128*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_46
    nop
if_46:
/* line number 129*/
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* line number 129*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_47
    nop
else_46:
endIf_47:
/* line number 132*/
/* Prepping Comparison Calculations by loading */
/* line number 132*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 132*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 132*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_9
    nop
    set         0, %l3
    ba      equalEnd_9
    nop
equal_9:
    set         1, %l3
equalEnd_9:
/* line number 132*/
/* Storing result of Comparison Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 132*/
/* Short-circuiting && with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 132*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
/* line number 132*/
/* Prepping Comparison Calculations by loading */
/* line number 132*/
/* Loading y to %l0 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 132*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 132*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_10
    nop
    set         0, %l3
    ba      equalEnd_10
    nop
equal_10:
    set         1, %l3
equalEnd_10:
/* line number 132*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 132*/
/* Prepping Arithmetic Calculations by loading */
/* line number 132*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 132*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 132*/
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
/* line number 132*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 133*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_48
    nop
if_48:
/* line number 134*/
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* line number 134*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_49
    nop
else_48:
endIf_49:
/* line number 137*/
/* Prepping Comparison Calculations by loading */
/* line number 137*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 137*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 137*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_11
    nop
    set         0, %l3
    ba      equalEnd_11
    nop
equal_11:
    set         1, %l3
equalEnd_11:
/* line number 137*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 137*/
/* Short-circuiting && with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 137*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_2
    nop
/* line number 137*/
/* Prepping Comparison Calculations by loading */
/* line number 137*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 137*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 137*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_12
    nop
    set         0, %l3
    ba      equalEnd_12
    nop
equal_12:
    set         1, %l3
equalEnd_12:
/* line number 137*/
/* Storing result of Comparison Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 137*/
/* Prepping Arithmetic Calculations by loading */
/* line number 137*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 137*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 137*/
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
/* line number 137*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 138*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_50
    nop
if_50:
/* line number 139*/
/* printing string */
    set         _strFmt, %o0
    set         str_25, %o1
    call    printf
    nop
/* line number 139*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_51
    nop
else_50:
endIf_51:
/* line number 142*/
/* Prepping Comparison Calculations by loading */
/* line number 142*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 142*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 142*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_13
    nop
    set         0, %l3
    ba      equalEnd_13
    nop
equal_13:
    set         1, %l3
equalEnd_13:
/* line number 142*/
/* Storing result of Comparison Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 142*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 142*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 142*/
/* Prepping Comparison Calculations by loading */
/* line number 142*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 142*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 142*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_14
    nop
    set         0, %l3
    ba      equalEnd_14
    nop
equal_14:
    set         1, %l3
equalEnd_14:
/* line number 142*/
/* Storing result of Comparison Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 142*/
/* Prepping Arithmetic Calculations by loading */
/* line number 142*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 142*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 142*/
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
/* line number 142*/
/* Storing result of Binary Op */
    set         -84, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 143*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_52
    nop
if_52:
/* line number 144*/
/* printing string */
    set         _strFmt, %o0
    set         str_26, %o1
    call    printf
    nop
/* line number 144*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_53
    nop
else_52:
endIf_53:
/* line number 147*/
/* Prepping Comparison Calculations by loading */
/* line number 147*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 147*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 147*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_15
    nop
    set         0, %l3
    ba      equalEnd_15
    nop
equal_15:
    set         1, %l3
equalEnd_15:
/* line number 147*/
/* Storing result of Comparison Op */
    set         -88, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 147*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 147*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_1
    nop
/* line number 147*/
/* Prepping Comparison Calculations by loading */
/* line number 147*/
/* Loading y to %l0 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 147*/
/* Loading x to %l1 */
    set         0, %l1
/* line number 147*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_16
    nop
    set         0, %l3
    ba      equalEnd_16
    nop
equal_16:
    set         1, %l3
equalEnd_16:
/* line number 147*/
/* Storing result of Comparison Op */
    set         -92, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 147*/
/* Prepping Arithmetic Calculations by loading */
/* line number 147*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 147*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 147*/
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
/* line number 147*/
/* Storing result of Binary Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 148*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_54
    nop
if_54:
/* line number 149*/
/* printing string */
    set         _strFmt, %o0
    set         str_27, %o1
    call    printf
    nop
/* line number 149*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_55
    nop
else_54:
endIf_55:
/* line number 153*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_56
    nop
if_56:
/* line number 154*/
/* printing string */
    set         _strFmt, %o0
    set         str_28, %o1
    call    printf
    nop
/* line number 154*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_57
    nop
else_56:
endIf_57:
/* line number 158*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_58
    nop
if_58:
/* line number 159*/
/* printing string */
    set         _strFmt, %o0
    set         str_29, %o1
    call    printf
    nop
/* line number 159*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_59
    nop
else_58:
endIf_59:
/* line number 162*/
/* Prepping Comparison Calculations by loading */
/* line number 162*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 162*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 162*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_17
    nop
    set         0, %l3
    ba      equalEnd_17
    nop
equal_17:
    set         1, %l3
equalEnd_17:
/* line number 162*/
/* Storing result of Comparison Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 162*/
/* Short-circuiting || with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 162*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_2
    nop
/* line number 162*/
/* Prepping Comparison Calculations by loading */
/* line number 162*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 162*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 162*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_18
    nop
    set         0, %l3
    ba      equalEnd_18
    nop
equal_18:
    set         1, %l3
equalEnd_18:
/* line number 162*/
/* Storing result of Comparison Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 162*/
/* Prepping Arithmetic Calculations by loading */
/* line number 162*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 162*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 162*/
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
/* line number 162*/
/* Storing result of Binary Op */
    set         -108, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 162*/
/* Negating */
/* line number 162*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -108, %l1
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
    set         -112, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 163*/
/* Loading Validating UnaryOp Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 as a BooleanType for operator: !...
 to %l0 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_60
    nop
if_60:
/* line number 164*/
/* printing string */
    set         _strFmt, %o0
    set         str_30, %o1
    call    printf
    nop
/* line number 164*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_61
    nop
else_60:
endIf_61:
/* line number 167*/
/* Prepping Comparison Calculations by loading */
/* line number 167*/
/* Loading x to %l0 */
    set         0, %l0
/* line number 167*/
/* Loading x to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 167*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_19
    nop
    set         0, %l3
    ba      equalEnd_19
    nop
equal_19:
    set         1, %l3
equalEnd_19:
/* line number 167*/
/* Storing result of Comparison Op */
    set         -116, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 167*/
/* Short-circuiting && with Validating ComparisonOp int and int as a BooleanType for operator: ==...
 */
/* line number 167*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_3
    nop
/* line number 167*/
/* Prepping Comparison Calculations by loading */
/* line number 167*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 167*/
/* Loading y to %l1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 167*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_20
    nop
    set         0, %l3
    ba      equalEnd_20
    nop
equal_20:
    set         1, %l3
equalEnd_20:
/* line number 167*/
/* Storing result of Comparison Op */
    set         -120, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 167*/
/* Prepping Arithmetic Calculations by loading */
/* line number 167*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l0 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 167*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: ==...
 to %l1 */
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 167*/
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
/* line number 167*/
/* Storing result of Binary Op */
    set         -124, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 167*/
/* Negating */
/* line number 167*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -124, %l1
    add         %fp, %l1, %l1
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
    set         -128, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 168*/
/* Loading Validating UnaryOp Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 as a BooleanType for operator: !...
 to %l0 */
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_62
    nop
if_62:
/* line number 169*/
/* printing string */
    set         _strFmt, %o0
    set         str_31, %o1
    call    printf
    nop
/* line number 169*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_63
    nop
else_62:
endIf_63:
main_end:
    ret 
    restore
SAVE.main = -(92 + 128) & -8
