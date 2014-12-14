! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       " "         
str_1:          .asciz       " "         
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
                .global      printMyVars
printMyVars:
    set         SAVE.printMyVars, %g1
    save        %sp, %g1, %sp
/* line number 9*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 9*/
/* Loading i to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 9*/
/* Loading j to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 9*/
/* Loading k to %o1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
SOMESTRUCT_printMyVars_end:
    ret 
    restore
SAVE.printMyVars = -(92 + 4) & -8
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
! --storing constant i with value 15.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         15, %l1
    st          %l1, [%l0]
! --storing constant j with value 20.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         20, %l1
    st          %l1, [%l0]
! --storing constant k with value 33.0
    set         -4, %l0
    add         %fp, %l0, %l0
    set         33, %l1
    st          %l1, [%l0]
    call    SOMESTRUCT_printMyVars
    nop
! --storing constant i with value 4.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
! --storing constant j with value 5.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant k with value 9.0
    set         -4, %l0
    add         %fp, %l0, %l0
    set         9, %l1
    st          %l1, [%l0]
    call    SOMESTRUCT_printMyVars
    nop
    call    SOMESTRUCT_printMyVars
    nop
/* getting address of s1 */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Storing variable &s1 into sptr */
    set         -32, %l5
    add         %fp, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 36*/
/* Dereferencing sptr */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    call    SOMESTRUCT_printMyVars
    nop
/* getting address of s2 */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 38*/
/* Storing variable &s2 into sptr */
    set         -32, %l5
    add         %fp, %l5, %l5
    set         -52, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 40*/
/* Dereferencing sptr */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    call    SOMESTRUCT_printMyVars
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 64) & -8
