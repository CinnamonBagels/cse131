! --globals--
                .section     ".data"
                .align 4
str_0:          .asciz       "fooI():"   
str_1:          .asciz       "fooF():"   
float_2:        .single      0r3.14      

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
                .global      fooI
fooI:
    set         SAVE.fooI, %g1
    save        %sp, %g1, %sp
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* Done printing string. */
/* Returning value from fooI */
    set         42, %i0
    ba      fooI_end
    nop
fooI_end:
    ret 
    restore
SAVE.fooI = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      fooF
fooF:
    set         SAVE.fooF, %g1
    save        %sp, %g1, %sp
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* Done printing string. */
/* Returning value from fooF */
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    ba      fooF_end
    nop
fooF_end:
    ret 
    restore
SAVE.fooF = -(92 + 4) & -8
