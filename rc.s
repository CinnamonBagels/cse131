
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
/* Starting array access */
    set         9, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    add         1, %l0, %l0
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l0, %l2, %l4
    set         -44, %l5
    add         %fp, %l5, %l5
    st          %l4, [%l5]
    ba      arrayEnd_0
arrayOutBounds_0:
    set         1, %o0
    call    exit

    nop
    set         "Index value of %D is outside legal range [0,%D).", %o0
    mov         %l0, %o1
    set         40, %o2
    call    printf
    nop
arrayEnd_0:
! --storing constant x[9] with value 4.0
    set         -44, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* setting y = 10 */
    set         -44, %l0
    add         %fp, %l0, %l0
    set         10, %l1
    st          %l1, [%l0]
/* Done. */
/* Starting array access */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    add         1, %l0, %l0
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    add         %l0, %l2, %l4
    set         -48, %l5
    add         %fp, %l5, %l5
    st          %l4, [%l5]
    ba      arrayEnd_1
arrayOutBounds_1:
    set         1, %o0
    call    exit

    nop
    set         "Index value of %D is outside legal range [0,%D).", %o0
    mov         %l0, %o1
    set         40, %o2
    call    printf
    nop
arrayEnd_1:
/* Printing int x[y] */
    set         _intFmt, %o0
    set         -48, %l1
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
SAVE.main = -(92 + 44) & -8
