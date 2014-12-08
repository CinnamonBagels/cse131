! --globals--
                .section     ".data"
                .align 4
                 .global     x1,y1,z1
x1:             .word        3           
y1:             .single      0r3.0       
z1:             .word        1           
float_0:        .single      0r3.3       

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
! --storing constant x1 with value 2.0
    set         x1, %l0
    add         %g0, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
! --storing constant y1 with value 3.3
    set         y1, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant z1 with value 0.0
    set         z1, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    ret 
    restore
SAVE.main = -(92 + 0) & -8
