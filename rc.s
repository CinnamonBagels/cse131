! --globals--
                .section     ".data"
                .align 4
globalInit_:    .word        0           
float_0:        .single      0r10.0      
float_1:        .single      0r15.0      
float_2:        .single      0r20.0      
float_3:        .single      0r25.0      

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
/* line number 6*/
/* Converting int Arithmetic Op to float. */
/* line number 6*/
/* Storing Arithmetic Op into promoteCasting */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         25, %l1
    st          %l1, [%l0]
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 6*/
/* Assigning converted Arithmetic Op to d */
    set         -8, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l3
    st          %f1, [%l3]
/* line number 6*/
/* printing float d */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
