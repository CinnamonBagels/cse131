! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .word        0           
y:              .word        0           
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
/* line number 8*/
/* Incrementing */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         x, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 8*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Incrementing */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         y, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant x with value 5.0
    set         x, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
