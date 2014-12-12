! --globals--
                .section     ".data"
                .align 4
main_x:         .word        0           
staticGuard_main_x:    .word        0           
main_y:         .word        0           
staticGuard_main_y:    .word        0           
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
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
    set         staticGuard_main_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_y
    nop
    set         staticGuard_main_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_y:
! --storing constant x with value 3.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
! --storing constant y with value 55.0
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         55, %l1
    st          %l1, [%l0]
/* line number 6*/
/* Printing int x */
    set         _intFmt, %o0
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Printing int y */
    set         _intFmt, %o0
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 6*/
/* Done printing int. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
