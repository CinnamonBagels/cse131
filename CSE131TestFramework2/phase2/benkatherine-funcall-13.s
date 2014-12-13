! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a
a:              .word        5           
str_0:          .asciz       "y is: "    
str_1:          .asciz       "y is now"  
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
                .global      woo
woo:
    set         SAVE.woo, %g1
    save        %sp, %g1, %sp
! --storing constant k with value 999.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         999, %l1
    st          %l1, [%l0]
woo_end:
    ret 
    restore
SAVE.woo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      wohoo
wohoo:
    set         SAVE.wohoo, %g1
    save        %sp, %g1, %sp
! --storing constant j with value 9.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         9, %l1
    st          %l1, [%l0]
    call    woo
    nop
wohoo_end:
    ret 
    restore
SAVE.wohoo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      woohooo2
woohooo2:
    set         SAVE.woohooo2, %g1
    save        %sp, %g1, %sp
    call    wohoo
    nop
woohooo2_end:
    ret 
    restore
SAVE.woohooo2 = -(92 + 4) & -8
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
! --storing constant y with value 6.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         6, %l1
    st          %l1, [%l0]
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Printing int y */
    set         _intFmt, %o0
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o0
    call    woohooo2
    nop
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Printing int y */
    set         _intFmt, %o0
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 23*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
