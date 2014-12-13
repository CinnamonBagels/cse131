! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r1.1       
float_1:        .single      0r2.2       
float_2:        .single      0r3.3       
float_3:        .single      0r3.3       
float_4:        .single      0r4.4       
float_5:        .single      0r5.5       
float_6:        .single      0r4.4       
float_8:        .single      0r3.3       
float_13:       .single      0r3.3       
str_7:          .asciz       "bad! "     
str_9:          .asciz       "good "     
str_10:         .asciz       "job "      
str_11:         .asciz       "dude, "    
str_12:         .asciz       "you've "   
str_14:         .asciz       "bad! "     
str_15:         .asciz       "got "      
str_16:         .asciz       "it!"       
str_17:         .asciz       "fin~~"     
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
/* line number 6*/
/* setting onePointOne = 1.1 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 6*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting twoPointTwo = 2.2 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 7*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 7*/
/* Done. */
/* line number 9*/
/* setting threePointThree = 3.3 */
    set         -16, %l0
    add         %fp, %l0, %l0
/* line number 9*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Prepping Comparison Calculations by loading */
/* line number 9*/
/* Starting greater than */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 9*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 10*/
/* Prepping Comparison Calculations by loading */
/* line number 10*/
/* Starting Less than */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         float_3, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbl     less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 10*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 11*/
/* Prepping Comparison Calculations by loading */
/* line number 11*/
/* Starting Less than Equal */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fble    lessEqual_2
    nop
    set         0, %l3
    ba      lessEqualEnd_2
    nop
lessEqual_2:
    set         1, %l3
lessEqualEnd_2:
/* line number 11*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Starting greater than equal */
/* line number 12*/
/* Storing variable 4.4 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_6, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 12*/
/* Storing variable 5.5 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_5, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_3
    nop
    set         0, %l3
    ba      greaterEqualEnd_3
    nop
greaterEqual_3:
    set         1, %l3
greaterEqualEnd_3:
/* line number 12*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_4
    nop
else_3:
endIf_4:
/* line number 15*/
/* Prepping Comparison Calculations by loading */
/* line number 15*/
/* Starting == equal */
/* line number 15*/
/* Storing variable 3.3 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_8, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 15*/
/* Storing variable threePointThree into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_4
    nop
    set         0, %l3
    ba      equalEnd_4
    nop
equal_4:
    set         1, %l3
equalEnd_4:
/* line number 15*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    ba      endIf_6
    nop
else_5:
endIf_6:
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    ba      endIf_7
    nop
else_2:
endIf_7:
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Starting not equal */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbne    nEqual_5
    nop
    set         0, %l3
    ba      nEqualEnd_5
    nop
nEqual_5:
    set         1, %l3
nEqualEnd_5:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 24*/
/* Prepping Comparison Calculations by loading */
/* line number 24*/
/* Starting not equal */
/* line number 24*/
/* Storing variable 3.3 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_13, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         float_13, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 24*/
/* Storing variable threePointThree into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbne    nEqual_6
    nop
    set         0, %l3
    ba      nEqualEnd_6
    nop
nEqual_6:
    set         1, %l3
nEqualEnd_6:
/* line number 24*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
    ba      endIf_11
    nop
else_10:
endIf_11:
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
    ba      endIf_12
    nop
else_1:
endIf_12:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_0:
endIf_13:
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
