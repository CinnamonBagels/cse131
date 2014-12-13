! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "BEGIN OF MAIN WHILE LOOP:"
str_1:          .asciz       " "         
str_2:          .asciz       "CONTINUE LOOP:"
str_3:          .asciz       " "         
str_4:          .asciz       "NO BREAK OR CONTINUE LOOP:"
str_5:          .asciz       " "         
str_6:          .asciz       "WHILE LOOP WITH FALSE STATEMENT:"
str_7:          .asciz       " "         
str_8:          .asciz       "BREAK LOOP:"
str_9:          .asciz       " "         
str_10:         .asciz       "END OF MAIN WHILE LOOP:\ni: "
str_11:         .asciz       ", j: "     
str_12:         .asciz       "END"       
str_13:         .asciz       "\n"        
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
/* line number 9*/
/* setting j = 1 */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 9*/
/* Done. */
while_0:
/* line number 9*/
/* Prepping Comparison Calculations by loading */
/* line number 9*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 20 to %l1 */
    set         20, %l1
/* line number 9*/
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
/* line number 9*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
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
! --storing constant i with value 1.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 13*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 13*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 13*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_1:
/* line number 16*/
/* Prepping Comparison Calculations by loading */
/* line number 16*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 16*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 17*/
/* Incrementing */
/* line number 17*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Incrementing */
/* line number 18*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 19*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 19*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 19*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Continuing while loop */
    ba      while_1
    nop
/* line number 23*/
/* Loading 1 to %o0 */
    set         1, %o0
    call    exit

    nop
    ba      while_1
    nop
whileEnd_1:
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_2:
/* line number 25*/
/* Prepping Comparison Calculations by loading */
/* line number 25*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 25*/
/* Loading 9 to %l1 */
    set         9, %l1
/* line number 25*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 25*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_2
    nop
/* line number 26*/
/* Incrementing */
/* line number 26*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Incrementing */
/* line number 27*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 28*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 28*/
/* Done printing int. */
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 28*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 28*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ba      while_2
    nop
whileEnd_2:
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_3:
/* line number 32*/
/* Prepping Comparison Calculations by loading */
/* line number 32*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 32*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 32*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_3
    nop
    set         0, %l3
    ba      lessEnd_3
    nop
less_3:
    set         1, %l3
lessEnd_3:
/* line number 32*/
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 32*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_3
    nop
/* line number 33*/
/* Incrementing */
/* line number 33*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Incrementing */
/* line number 34*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 35*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 35*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 35*/
/* Done printing int. */
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 35*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 35*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ba      main_end
    nop
    ba      while_3
    nop
whileEnd_3:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_4:
/* line number 40*/
/* Prepping Comparison Calculations by loading */
/* line number 40*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 40*/
/* Loading 12 to %l1 */
    set         12, %l1
/* line number 40*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_4
    nop
    set         0, %l3
    ba      lessEnd_4
    nop
less_4:
    set         1, %l3
lessEnd_4:
/* line number 40*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 40*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_4
    nop
/* line number 41*/
/* Incrementing */
/* line number 41*/
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 42*/
/* Incrementing */
/* line number 42*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 43*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 43*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* Breaking out of while loop */
    ba      whileEnd_4
    nop
/* line number 46*/
/* Loading 1 to %o0 */
    set         1, %o0
    call    exit

    nop
    ba      while_4
    nop
whileEnd_4:
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
/* line number 47*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 47*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 47*/
/* Done printing int. */
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
/* line number 47*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 47*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 47*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 48*/
/* Incrementing */
/* line number 48*/
/* Loading j to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 68) & -8
