! --globals--
                .section     ".data"
                .align 4
                 .global     x
x:              .single      0r0.0       
float_0:        .single      0r1.0       

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
! --storing constant x with value 1.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
/* printing float */
/* Loading Variable */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 0) & -8