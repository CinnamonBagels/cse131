! --globals--
                .section     ".data"
                .align 4
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
    set         dream1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         dream2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         dream3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         dream4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         dream5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    ba      endIf_11
    nop
else_0:
endIf_11:
main_end:
    ret 
    restore
SAVE.main = -(92 + 24) & -8
