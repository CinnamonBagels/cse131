! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       " != "      
str_1:          .asciz       " ? "       
str_2:          .asciz       "go"        
str_3:          .asciz       "od"        
str_4:          .asciz       " n"        
str_5:          .asciz       "'"         
str_6:          .asciz       "bad!!"     
str_7:          .asciz       " done"     
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
/* setting i = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
/* line number 6*/
/* setting j = 6 */
    set         6, %l0
    st          %l0, [%fp-12]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting f = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Negating */
/* line number 7*/
/* Loading f to %l0 */
    set         -16, %l1
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
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* setting t = Validating UnaryOp f as a BooleanType for operator: !...
 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Printing bool t */
/* line number 9*/
/* Loading t to %l0 */
    set         -24, %l1
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
/* line number 9*/
/* Done printing bool. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing bool f */
/* line number 9*/
/* Loading f to %l0 */
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
/* line number 9*/
/* Done printing bool. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 12*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 14*/
/* Negating */
/* line number 14*/
/* Loading f to %l0 */
    set         -16, %l1
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
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 14*/
/* Loading Validating UnaryOp f as a BooleanType for operator: !...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 16*/
/* Loading 6 to %l1 */
    set         6, %l1
/* line number 16*/
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
/* line number 16*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Negating */
/* line number 16*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_2
    nop
decrement_2:
    dec     %l0
    ba      negEnd_2
    nop
increment_2:
    inc     %l0
negEnd_2:
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Loading Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: >...
 as a BooleanType for operator: !...
 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading j to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
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
/* line number 18*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Negating */
/* line number 18*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: >...
 to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_3
    nop
decrement_3:
    dec     %l0
    ba      negEnd_3
    nop
increment_3:
    inc     %l0
negEnd_3:
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Loading Validating UnaryOp Validating ComparisonOp int and int as a BooleanType for operator: >...
 as a BooleanType for operator: !...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 20*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    ba      endIf_5
    nop
else_4:
endIf_5:
    ba      endIf_6
    nop
else_3:
endIf_6:
    ba      endIf_7
    nop
else_2:
endIf_7:
    ba      endIf_8
    nop
else_1:
endIf_8:
    ba      endIf_9
    nop
else_0:
endIf_9:
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
