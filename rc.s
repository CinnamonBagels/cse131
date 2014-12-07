
! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     

                .section     ".text"
                .align 4
                .global      foo
foo:
        set         SAVE.foo, %g1
        save        %sp, %g1, %sp
        ret 
        restore
SAVE.foo = -(92 + 0) & -8
                .section     ".text"
                .align 4
                .global      main
main:
        set         SAVE.main, %g1
        save        %sp, %g1, %sp
/* setting x = false */
        set         0, %l0
        add         %fp, %l0, %l0
        set         0, %l1
        st          %l1, [%l0]
/* Done. */
/* Printing bool */
/* Loading Variable */
    set         0, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* Done printing bool. */
        set         _endl, %o0
        call    printf
        nop
        ret 
        restore
SAVE.main = -(92 + 4) & -8
