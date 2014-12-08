
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
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* Done loading variable. */
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    .mul
    nop
    mov         %o0, %l0
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Loading Variable */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
/* Loading Variable */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    .div
    nop
    mov         %o0, %l0
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Loading Variable */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
    add         %l0, %l1, %l3
    set         -28, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
/* Loading Variable */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
    sub         %l0, %l1, %l3
    set         -32, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
/* Printing int int - int */
    set         _intFmt, %o0
/* Loading Variable */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
    sub         %l0, %l1, %l3
    set         -36, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* Done loading variable. */
/* Loading Variable */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    .mul
    nop
    mov         %o0, %l0
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Loading Variable */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
/* Loading Variable */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* Done loading variable. */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    .div
    nop
    mov         %o0, %l0
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Loading Variable */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
    add         %l0, %l1, %l3
    set         -48, %l4
    add         %fp, %l4, %l4
    st          , [%l4]
/* Printing int int + int */
    set         _intFmt, %o0
/* Loading Variable */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* Done loading variable. */
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* Done loading variable. */
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    .rem
    nop
    mov         %o0, %l0
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 52) & -8
