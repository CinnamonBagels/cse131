! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* setting x = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
while_0:
/* line number 4*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 4*/
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
/* line number 4*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 6*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         2, %l1
/* line number 6*/
/* Starting == equal */
    cmp         %l0, %l1
    be      equal_1
    nop
    set         0, %l3
    ba      equalEnd_1
    nop
equal_1:
    set         1, %l3
equalEnd_1:
/* line number 6*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 9*/
/* Breaking out of while loop */
    ba      whileEnd_0
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         1, %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Storing variable int + int into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      while_0
    nop
whileEnd_0:
/* line number 14*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
