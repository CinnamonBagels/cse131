! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_3:        .single      0r5.32      
float_4:        .single      0r5.33      
float_5:        .single      0r2.5       
str_0:          .asciz       "YES!"      
str_1:          .asciz       "NO!"       
str_2:          .asciz       "YES!"      
str_6:          .asciz       "NO!"       
str_7:          .asciz       "YES!"      
str_8:          .asciz       "YES!"      
str_9:          .asciz       "NO!"       
str_10:         .asciz       "YES!"      
str_11:         .asciz       "NO!"       
str_12:         .asciz       "NO!!"      
str_13:         .asciz       "YES!"      
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
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Prepping Comparison Calculations by loading */
/* line number 6*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 6*/
/* Loading 0 to %l1 */
    set         0, %l1
/* line number 6*/
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
/* line number 6*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 7*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_2
    nop
else_1:
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Prepping Comparison Calculations by loading */
/* line number 13*/
/* Starting greater than */
/* line number 13*/
/* Storing variable 5.33 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 13*/
/* Loading 5.33 to %f0 */
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 13*/
/* Storing variable 5.32 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 13*/
/* Loading 5.32 to %f1 */
    set         float_3, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
    fcmps       %f0, %f1
    fbg     greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 13*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
/* line number 15*/
/* Prepping Comparison Calculations by loading */
/* line number 15*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 15*/
/* Starting Less than */
/* line number 15*/
/* Storing variable 2.5 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 15*/
/* Loading 2.5 to %f0 */
    set         float_5, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
/* line number 15*/
/* Storing variable 1 into temp */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 15*/
/* Loading 1 to %f1 */
    set         1, %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbl     less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 15*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Loading Validating ComparisonOp float and int as a BooleanType for operator: <...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_5:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_6
    nop
else_3:
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_6:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_2:
    ba      endIf_7
    nop
else_0:
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_7:
/* line number 38*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_9
    nop
else_8:
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_9:
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
