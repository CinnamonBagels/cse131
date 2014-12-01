! --globals--
                .section     ".data"
                .align 4
                 .global     y
y:              .word        0           
z:              .word        0           

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     

