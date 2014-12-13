! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "INCORRECT!"
str_1:          .asciz       "INCORRECT!"
str_2:          .asciz       "INCORRECT!"
str_3:          .asciz       "IF/ELSE WORKS "
str_4:          .asciz       "INCORRECT!"
str_5:          .asciz       "100% "     
str_6:          .asciz       "INCORRECT!"
str_7:          .asciz       "INCORRECT!"
str_8:          .asciz       "CORRECT!"  
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
/* setting f = false */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
/* line number 8*/
/* setting t = true */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 8*/
/* Done. */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
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
endIf_1:
    set         1, %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
    set         0, %l0
    cmp         %l0, %g0
    be      else_3
    nop
if_3:
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    ba      endIf_4
    nop
else_3:
    set         1, %l0
    cmp         %l0, %g0
    be      else_5
    nop
if_5:
    set         0, %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
    ba      endIf_7
    nop
else_6:
    set         1, %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
    ba      endIf_9
    nop
else_8:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
endIf_9:
endIf_7:
    ba      endIf_10
    nop
else_5:
endIf_10:
endIf_4:
    ba      endIf_11
    nop
else_2:
endIf_11:
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_12
    nop
if_12:
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
    ba      endIf_13
    nop
else_12:
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
endIf_13:
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    ba      endIf_15
    nop
else_14:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
endIf_15:
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
