
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
        set         0, %l0
        add         %fp, %l0, %l0
        set         0, %l1
        st          %l1, [%l0]
/* Done. */
        ret 
        restore
SAVE.main = -(92 + 4) & -8
