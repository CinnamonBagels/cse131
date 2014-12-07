
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
/* setting x = 0 */
        set         -4, %l0
        add         %fp, %l0, %l0
        set         0, %l1
        st          %l1, [%l0]
/* Done. */
/* Printing int */
        set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %o0
/* Done loading variable. */
        call    printf
        nop
/* Done printing int. */
        set         _endl, %o0
        call    printf
        nop
        ret 
        restore
SAVE.main = -(92 + 4) & -8
