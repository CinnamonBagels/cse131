! --globals--
                .section     ".data"
                .align 4
                 .global     pass,fail
pass:           .word        1           
fail:           .word        0           
globalInit_:    .word        0           
str_0:          .asciz       "pass"      
str_1:          .asciz       "fail"      
str_2:          .asciz       "pass"      
str_3:          .asciz       "fail"      
str_4:          .asciz       "fail"      
str_5:          .asciz       "fail"      
str_6:          .asciz       "pass"      
str_7:          .asciz       "fail"      

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
    set         pass, %l1
    add         %g0, %l1, %l1
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
    set         _endl, %o0
    call    printf
    nop
    set         fail, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_2
    nop
else_1:
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_2:
    ba      endIf_3
    nop
else_0:
    set         pass, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
endIf_5:
endIf_3:
    set         fail, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
    set         pass, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
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
    ba      endIf_9
    nop
else_8:
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
endIf_9:
endIf_7:
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
