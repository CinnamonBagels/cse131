! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r5.55      
main_x:         .single      0r0.0       
staticGuard_main_x:    .word        0           
float_1:        .single      0r3.12      
main_y:         .single      0r0.0       
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
! --storing constant x with value 5.55
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant y with value 3.12
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
/* line number 6*/
/* printing float x */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* printing float y */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
