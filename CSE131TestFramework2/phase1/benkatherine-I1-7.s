! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     b,a,c
b:              .word        6           
a:              .word        5           
c:              .word        0           
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
/* line number 2*/
/* Prepping Arithmetic Calculations by loading */
/* line number 2*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 2*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 2*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 2*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Storing variable int + int into c */
    set         c, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
