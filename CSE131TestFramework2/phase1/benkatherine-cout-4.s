! --globals--
                .section     ".data"
                .align 4
                 .global     x,a,b
x:              .single      0r0.0       
float_0:        .single      0r5.75      
a:              .single      0r5.75      
b:              .single      0r0.0       
globalInit_:    .word        0           
float_1:        .single      0r5.75      
float_2:        .single      0r5.75      

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
    set         float_2, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
