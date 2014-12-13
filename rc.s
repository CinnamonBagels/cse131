! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "y's value: "
globalInit_:    .word        0           

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     
arrayOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d)."

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 4*/
/* setting x = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 6*/
/* setting y = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 6*/
/* Done. */
! --storing constant y with value 1.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
    set         1, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 6*/
/* ||-ing */
    cmp         %l1, %g0
    bne     orT_0
    nop
orF_0:
    set         0, %l2
    ba      orEnd_0
    nop
orT_0:
    set         1, %l2
orEnd_0:
/* line number 6*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 6*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 into x */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
/* line number 7*/
/* Printing bool y */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
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
/* line number 7*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
