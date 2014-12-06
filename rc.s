! --globals--
                .section     ".data"
                .align 4
                 .global     y,a
y:              .word        0           
a:              .word        0           
z:              .word        0           

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
    set         0, %l1
    st          %l1, [%l0]
    ret 
    restore
SAVE.main = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
    ret 
    restore
SAVE.foo = -(92 + 0) & -8
