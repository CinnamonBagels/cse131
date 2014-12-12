! --globals--
                .section     ".data"
                .align 4
                 .global     davis,coltrane,parker,ellington,mingus,monk,brubeck
davis:          .word        0           
coltrane:       .word        0           
parker:         .word        0           
ellington:      .word        0           
mingus:         .word        0           
monk:           .word        0           
brubeck:        .word        0           
str_0:          .asciz       "jazzy jazz jazz"
str_1:          .asciz       "jazzy jazz jazz"
str_2:          .asciz       "jazzy jazz jazz"
str_3:          .asciz       "jazzy jazz jazz"
str_4:          .asciz       "no print"  
str_5:          .asciz       "jazzy jazz jazz"
str_6:          .asciz       "jazzy jazz jazz"
str_7:          .asciz       "no print"  
str_8:          .asciz       "jazzy jazz jazz"
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
! --storing constant davis with value 10.0
    set         davis, %l0
    add         %g0, %l0, %l0
    set         davis, %l0
    add         %g0, %l0, %l0
    set         10, %l1
    st          %l1, [%l0]
! --storing constant coltrane with value 9.0
    set         coltrane, %l0
    add         %g0, %l0, %l0
    set         coltrane, %l0
    add         %g0, %l0, %l0
    set         9, %l1
    st          %l1, [%l0]
! --storing constant parker with value 8.0
    set         parker, %l0
    add         %g0, %l0, %l0
    set         parker, %l0
    add         %g0, %l0, %l0
    set         8, %l1
    st          %l1, [%l0]
! --storing constant ellington with value 7.0
    set         ellington, %l0
    add         %g0, %l0, %l0
    set         ellington, %l0
    add         %g0, %l0, %l0
    set         7, %l1
    st          %l1, [%l0]
! --storing constant mingus with value 6.0
    set         mingus, %l0
    add         %g0, %l0, %l0
    set         mingus, %l0
    add         %g0, %l0, %l0
    set         6, %l1
    st          %l1, [%l0]
! --storing constant monk with value 5.0
    set         monk, %l0
    add         %g0, %l0, %l0
    set         monk, %l0
    add         %g0, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant brubeck with value 4.0
    set         brubeck, %l0
    add         %g0, %l0, %l0
    set         brubeck, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 19*/
/* Prepping Comparison Calculations by loading */
    set         davis, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         brubeck, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
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
/* line number 19*/
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
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Prepping Comparison Calculations by loading */
    set         coltrane, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         parker, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
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
/* line number 22*/
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
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_2
    nop
else_1:
endIf_2:
/* line number 26*/
/* Prepping Comparison Calculations by loading */
    set         parker, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         ellington, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 26*/
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
/* line number 26*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* Prepping Comparison Calculations by loading */
    set         ellington, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         mingus, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 29*/
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
/* line number 29*/
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
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Prepping Comparison Calculations by loading */
    set         mingus, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         ellington, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 32*/
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
/* line number 32*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
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
    ba      endIf_6
    nop
else_5:
endIf_6:
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Prepping Comparison Calculations by loading */
    set         monk, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         brubeck, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 37*/
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
/* line number 37*/
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
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_8
    nop
else_7:
endIf_8:
/* line number 41*/
/* Prepping Comparison Calculations by loading */
    set         brubeck, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         monk, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 41*/
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
/* line number 41*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_9
    nop
if_9:
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_10
    nop
else_9:
endIf_10:
    ba      endIf_11
    nop
else_4:
endIf_11:
    ba      endIf_12
    nop
else_3:
endIf_12:
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_0:
endIf_13:
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
