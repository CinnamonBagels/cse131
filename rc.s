! --globals--
                .section     ".data"
                .align 4
main_x:         .word        0           
staticGuard_main_x:    .word        0           
str_0:          .asciz       "woah"      
str_1:          .asciz       "REC: "     
str_2:          .asciz       "BAD"       

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
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
! --storing constant x with value 0.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* Done printing string. */
/* Printing int x */
    set         _intFmt, %o0
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Comparison Calculations by loading */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    set         5, %l1
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
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
    call    main
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
