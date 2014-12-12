! --globals--
                .section     ".data"
                .align 4
                 .global     x,y,z,q
x:              .word        0           
y:              .word        0           
z:              .word        10          
q:              .single      0r5.0       
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
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
    set         5, %l0
/* line number 11*/
/* Adding */
/* line number 11*/
/* Storing w into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         q, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 13*/
/* setting c = int + float */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 13*/
/* Done. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
