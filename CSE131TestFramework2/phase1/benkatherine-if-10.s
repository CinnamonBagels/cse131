! --globals--
                .section     ".data"
                .align 4
                 .global     x,y
x:              .single      0r6.0       
y:              .word        5           
str_0:          .asciz       "Katherine "
str_1:          .asciz       "is "       
str_2:          .asciz       "a "        
str_3:          .asciz       "loser"     
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
/* Prepping Comparison Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 6*/
/* Starting greater than */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 6*/
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
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 9*/
/* Prepping Comparison Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Starting greater than */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fcmps       %f0, %f1
    fbg     greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 9*/
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
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    ba      endIf_2
    nop
else_1:
endIf_2:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    ba      endIf_3
    nop
else_0:
endIf_3:
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
