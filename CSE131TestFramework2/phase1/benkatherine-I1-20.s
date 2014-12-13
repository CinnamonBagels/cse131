! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
x:              .word        0           
staticGuard_x:    .word        0           
y:              .word        0           
staticGuard_y:    .word        0           
z:              .word        0           
staticGuard_z:    .word        0           
main_a:         .word        0           
staticGuard_main_a:    .word        0           
main_b:         .word        0           
staticGuard_main_b:    .word        0           
main_c:         .word        0           
staticGuard_main_c:    .word        0           
main_d:         .word        0           
staticGuard_main_d:    .word        0           
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
    set         staticGuard_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_x
    nop
    set         staticGuard_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_x:
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
    set         staticGuard_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_y:
    set         staticGuard_z, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_z
    nop
    set         z, %l5
    add         %g0, %l5, %l5
    set         y, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         staticGuard_z, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_z:
    set         staticGuard_main_a, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_a
    nop
    set         staticGuard_main_a, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_a:
    set         staticGuard_main_b, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_b
    nop
    set         staticGuard_main_b, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_b:
    set         staticGuard_main_c, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_c
    nop
    set         staticGuard_main_c, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_c:
    set         staticGuard_main_d, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_d
    nop
    set         staticGuard_main_d, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_d:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
! --storing constant y with value 4.0
/* line number 6*/
/* Storing variable y into z */
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
! --storing constant b with value 4.0
    set         main_b, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 11*/
/* Storing variable a into c */
    set         main_c, %l5
    add         %g0, %l5, %l5
    set         main_a, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 12*/
/* Storing variable b into d */
    set         main_d, %l5
    add         %g0, %l5, %l5
    set         main_b, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
