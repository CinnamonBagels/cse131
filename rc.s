
! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    ret 
    restore
SAVE.main = -(92 + 4) & -8
