! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* line number 7*/
/* setting x = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
! --storing constant x with value 10.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         10, %l1
    st          %l1, [%l0]
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 10*/
/* Loading false to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
! --storing constant x with value 12.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         12, %l1
    st          %l1, [%l0]
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 14*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 14*/
/* Loading x to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
