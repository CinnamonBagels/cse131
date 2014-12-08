
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
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
/* setting huit = 8 */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         8, %l1
    st          %l1, [%l0]
/* Done. */
/* setting trois = 3 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* Done. */
/* setting deux = 2 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* Done. */
/* setting un = 1 */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* Done. */
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -1, %l1
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Printing int int * int */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 20) & -8
