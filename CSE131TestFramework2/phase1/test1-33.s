! --globals--
                .section     ".data"
                .align 4
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
/* setting x = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting t = true */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 7*/
/* Done. */
/* line number 9*/
/* setting f = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 9*/
/* Done. */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
! --storing constant x with value 10.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         10, %l1
    st          %l1, [%l0]
    ba      endIf_2
    nop
else_1:
endIf_2:
    ba      endIf_3
    nop
else_0:
endIf_3:
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 16*/
/* setting y = 12 */
    set         12, %l0
    st          %l0, [%fp-20]
/* line number 16*/
/* Done. */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
! --storing constant x with value 14.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         14, %l1
    st          %l1, [%l0]
    ba      endIf_6
    nop
else_5:
endIf_6:
    ba      endIf_7
    nop
else_4:
endIf_7:
    set         1, %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
    set         1, %l0
    cmp         %l0, %g0
    be      else_9
    nop
if_9:
    set         1, %l0
    cmp         %l0, %g0
    be      else_10
    nop
if_10:
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         1, %l1
/* line number 23*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 23*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 23*/
/* Storing variable int + int into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -24, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      endIf_11
    nop
else_10:
endIf_11:
    ba      endIf_12
    nop
else_9:
endIf_12:
    ba      endIf_13
    nop
else_8:
endIf_13:
/* line number 28*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 28*/
/* Done printing int. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 24) & -8
