! --globals--
                .section     ".data"
                .align 4
                 .global     x,y,z,a,b,c
x:              .word        10          
y:              .word        12          
z:              .word        14          
float_0:        .single      0r20.0      
a:              .single      0r20.0      
float_1:        .single      0r30.0      
b:              .single      0r30.0      
float_2:        .single      0r20.0      
c:              .single      0r20.0      
globalInit_:    .word        0           
str_3:          .asciz       "4 is less than 5"
str_4:          .asciz       "x is equal to 10"
str_5:          .asciz       "y is greater than 10"
str_6:          .asciz       "y is greater than or equal to 12"
str_7:          .asciz       "z is less than 15"
str_8:          .asciz       "z is less than or equal to 15"
str_9:          .asciz       "y is not equal to 13"
str_10:         .asciz       "a is less than b"
str_11:         .asciz       "a is less than or equal to c"

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
/* line number 10*/
/* Prepping Comparison Calculations by loading */
    set         4, %l0
    set         5, %l1
/* line number 10*/
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
/* line number 10*/
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
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 14*/
/* Prepping Comparison Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 14*/
/* whoops, Comparison Operator broke on x == 10 */
/* line number 14*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 18*/
/* Prepping Comparison Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
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
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 22*/
/* Prepping Comparison Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         12, %l1
/* line number 22*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_2
    nop
    set         0, %l3
    ba      greaterEqual_2
    nop
greaterEqual_2:
    set         1, %l3
greaterEqualEnd_2:
/* line number 22*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
/* line number 26*/
/* Prepping Comparison Calculations by loading */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         15, %l1
/* line number 26*/
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
/* line number 26*/
/* Storing result of Comparison Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
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
    ba      endIf_9
    nop
else_8:
endIf_9:
/* line number 30*/
/* Prepping Comparison Calculations by loading */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         14, %l1
/* line number 30*/
/* Starting Less than Equal */
    cmp         %l0, %l1
    ble     lessEqual_4
    nop
    set         0, %l3
    ba      lessEqualEnd_4
    nop
lessEqual_4:
    set         1, %l3
lessEqualEnd_4:
/* line number 30*/
/* Storing result of Comparison Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_11
    nop
else_10:
endIf_11:
/* line number 34*/
/* Prepping Comparison Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         13, %l1
/* line number 34*/
/* Starting not equal */
    cmp         %l0, %l1
    bne     nEqual_5
    nop
    set         0, %l3
    ba      nEqual_5
    nop
nEqual_5:
    set         1, %l3
nEqualEnd_5:
/* line number 34*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_13
    nop
else_12:
endIf_13:
/* line number 38*/
/* Prepping Comparison Calculations by loading */
/* line number 38*/
/* Starting Less than */
/* line number 38*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 40*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 40*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_15
    nop
else_14:
endIf_15:
/* line number 42*/
/* Prepping Comparison Calculations by loading */
/* line number 42*/
/* Starting Less than Equal */
/* line number 42*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_16
    nop
if_16:
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_17
    nop
else_16:
endIf_17:
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
