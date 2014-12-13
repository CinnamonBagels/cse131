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
/* line number 5*/
/* Starting array access */
/* line number 5*/
/* Loading 400 to %l0 */
    set         400, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 500
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -2004, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -2008, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         500, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant a[400] with value 5.0
    set         -2008, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Starting array access */
/* line number 7*/
/* Loading 499 to %l0 */
    set         499, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 500
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -2004, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -2012, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         500, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
! --storing constant a[499] with value 9.0
    set         -2012, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         9, %l1
    st          %l1, [%l0]
/* line number 11*/
/* setting b = 1 */
    set         1, %l0
    st          %l0, [%fp-2016]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 499 to %l0 */
    set         499, %l0
/* line number 11*/
/* Loading b to %l1 */
    set         -2016, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -2020, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading int + int to %l0 */
    set         -2020, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 500
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -2004, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -2024, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         500, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant a[int + int] with value 10.0
    set         -2024, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         10, %l1
    st          %l1, [%l0]
main_end:
    ret 
    restore
SAVE.main = -(92 + 2024) & -8
