! --globals--
                .section     ".data"
                .align 4
                 .global     x,y,z
x:              .word        4           
y:              .word        5           
z:              .word        0           
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
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 3*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 3*/
/* Storing result of Binary Op */
    set         x, %l4
    add         %g0, %l4, %l4
    st          %l3, [%l4]
/* line number 5*/
/* Storing int + int into z */
    set         z, %l0
    add         %g0, %l0, %l0
    set         x, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
