! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "You have " 
str_1:          .asciz       "INCORRECT!"
str_2:          .asciz       "INCORRECT!"
str_3:          .asciz       "to the count of 10: "
str_4:          .asciz       " bark!"    
str_5:          .asciz       " "         
str_6:          .asciz       "Uh ooh! "  
str_7:          .asciz       "RUN!"      
str_8:          .asciz       "<death>"   
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
/* setting i = 1 */
    set         -1, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
    set         1, %l0
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
    ba      endIf_1
    nop
else_0:
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
endIf_1:
    set         0, %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    ba      endIf_3
    nop
else_2:
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_3:
/* line number 21*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         14, %l1
/* line number 21*/
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
/* line number 21*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 23*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         11, %l1
/* line number 23*/
/* Starting Less than Equal */
    cmp         %l0, %l1
    ble     lessEqual_1
    nop
    set         0, %l3
    ba      lessEqualEnd_1
    nop
lessEqual_1:
    set         1, %l3
lessEqualEnd_1:
/* line number 23*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
    set         0, %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
    ba      endIf_6
    nop
else_5:
endIf_6:
/* line number 31*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 31*/
/* Starting Less than Equal */
    cmp         %l0, %l1
    ble     lessEqual_2
    nop
    set         0, %l3
    ba      lessEqualEnd_2
    nop
lessEqual_2:
    set         1, %l3
lessEqualEnd_2:
/* line number 31*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 32*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         8, %l1
/* line number 32*/
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
/* line number 32*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_7
    nop
if_7:
/* line number 33*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    ba      endIf_8
    nop
else_7:
/* line number 37*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         2, %l1
/* line number 37*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 37*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Storing variable int + int into j */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 38*/
/* Printing int j */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 38*/
/* Done printing int. */
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
/* line number 39*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 39*/
/* Post Increment */
    dec     %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
endIf_8:
    set         1, %l0
    cmp         %l0, %g0
    be      else_9
    nop
if_9:
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 45*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      endIf_10
    nop
else_9:
endIf_10:
    ba      endIf_11
    nop
else_4:
    set         _endl, %o0
    call    printf
    nop
/* line number 50*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 50*/
/* Done printing string. */
! --storing constant i with value 100.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         100, %l1
    st          %l1, [%l0]
endIf_11:
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
