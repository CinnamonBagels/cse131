! --globals--
                .section     ".data"
                .align 4
globalInit_:    .word        0           
str_0:          .asciz       "   ###   ###   ###   ###  ###   ######"
str_1:          .asciz       "   #### ####    #     # ##      #     "
str_2:          .asciz       "   ## ### ##    #     ###       ####  "
str_3:          .asciz       "   ## ##  ##    #     # ##      #     "
str_4:          .asciz       "   ##  #  ##   ###   ###  ###   ######"

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
/* line number 3*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 3*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 6*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
