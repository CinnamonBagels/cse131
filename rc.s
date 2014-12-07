str_1:          .asciz       "end"       

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
            .global    printFloat
printFloat:
    set         SAVE.printFloat, %g1
    save        %sp, %g1, %sp

    fstod       %f0, %f0
    std         %f0, [%fp-8]

    set         rfmt, %o0
    ld          [%fp-8], %o1
    ld          [%fp-4], %o2
    call    printf
    nop

    ret 
    restore
SAVE.printFloat = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
/* printf on int */
    set         _intFmt, %o0
    set         11, %o1
    call    printf
    nop

/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* Done printing string. */
    ret 
    restore
SAVE.main = -(92 + 0) & -8
