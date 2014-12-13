! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z,a,b,c,d,e
a:              .single      0r1.5       
b:              .single      0r0.5       
c:              .single      0r2.5       
d:              .single      0r3.5       
e:              .single      0r3.0       
float_5:        .single      0r3.0       
float_7:        .single      0r3.4       
float_8:        .single      0r3.5       
float_10:       .single      0r3.1       
float_12:       .single      0r1.5       
float_14:       .single      0r0.5       
x:              .word        1           
y:              .word        2           
z:              .word        3           
str_0:          .asciz       "1 is less than 1.5"
str_1:          .asciz       "1 is greater than 0.5"
str_2:          .asciz       "3 is less than 3.5"
str_3:          .asciz       "2 is greater than 1.5"
str_4:          .asciz       "2.5 is greater than 2"
str_6:          .asciz       "3.0 is equal to 3.0"
str_9:          .asciz       "3.5 is greater than 3.4"
str_11:         .asciz       "3.1 is greater than 3.0"
str_13:         .asciz       "1.5 is greater than or equal to 1.5"
str_15:         .asciz       "0.5 is less than or equal to 0.5"
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
/* line number 12*/
/* Prepping Comparison Calculations by loading */
/* line number 12*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Starting Less than */
/* line number 12*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading a to %f1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbl     less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 12*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
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
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Starting greater than */
/* line number 16*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading b to %f1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 17*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 20*/
/* Prepping Comparison Calculations by loading */
/* line number 20*/
/* Loading z to %l0 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Starting Less than */
/* line number 20*/
/* Loading z to %f0 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading d to %f1 */
    set         d, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbl     less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: <...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 24*/
/* Prepping Comparison Calculations by loading */
/* line number 24*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Starting greater than */
/* line number 24*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 24*/
/* Loading a to %f1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* line number 24*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Loading Validating ComparisonOp int and float as a BooleanType for operator: >...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
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
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 28*/
/* Prepping Comparison Calculations by loading */
/* line number 28*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 28*/
/* Starting greater than */
/* line number 28*/
/* Loading c to %f0 */
    set         c, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 28*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* line number 28*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: >...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 32*/
/* Prepping Comparison Calculations by loading */
/* line number 32*/
/* Starting == equal */
/* line number 32*/
/* Loading e to %f0 */
    set         e, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 32*/
/* Storing variable 3.0 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 32*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbe     equal_5
    nop
    set         0, %l3
    ba      equalEnd_5
    nop
equal_5:
    set         1, %l3
equalEnd_5:
/* line number 32*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 33*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: ==...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
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
    ba      endIf_11
    nop
else_10:
endIf_11:
/* line number 36*/
/* Prepping Comparison Calculations by loading */
/* line number 36*/
/* Starting greater than */
/* line number 36*/
/* Storing variable 3.5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 36*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 36*/
/* Storing variable 3.4 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 36*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_6
    nop
    set         0, %l3
    ba      greaterEnd_6
    nop
greater_6:
    set         1, %l3
greaterEnd_6:
/* line number 36*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_12:
endIf_13:
/* line number 40*/
/* Prepping Comparison Calculations by loading */
/* line number 40*/
/* Starting greater than */
/* line number 40*/
/* Storing variable 3.1 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_10, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 40*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 40*/
/* Loading e to %f1 */
    set         e, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_7
    nop
    set         0, %l3
    ba      greaterEnd_7
    nop
greater_7:
    set         1, %l3
greaterEnd_7:
/* line number 40*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 41*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_15
    nop
else_14:
endIf_15:
/* line number 44*/
/* Prepping Comparison Calculations by loading */
/* line number 44*/
/* Starting greater than equal */
/* line number 44*/
/* Loading a to %f0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 44*/
/* Storing variable 1.5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_12, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 44*/
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_8
    nop
    set         0, %l3
    ba      greaterEqualEnd_8
    nop
greaterEqual_8:
    set         1, %l3
greaterEqualEnd_8:
/* line number 44*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 45*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_16
    nop
if_16:
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_17
    nop
else_16:
endIf_17:
/* line number 48*/
/* Prepping Comparison Calculations by loading */
/* line number 48*/
/* Starting Less than Equal */
/* line number 48*/
/* Storing variable .5 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_14, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 48*/
/* Loading temp to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 48*/
/* Loading b to %f1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fble    lessEqual_9
    nop
    set         0, %l3
    ba      lessEqualEnd_9
    nop
lessEqual_9:
    set         1, %l3
lessEqualEnd_9:
/* line number 48*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 49*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: <=...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_18
    nop
if_18:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 50*/
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
