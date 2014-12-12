! --globals--
                .section     ".data"
                .align 4
                 .global     f,g
f:              .single      0r5.5       
g:              .single      0r0         
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
/* line number 4*/
/* Storing f into g */
    set         g, %l0
    add         %g0, %l0, %l0
    set         f, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
