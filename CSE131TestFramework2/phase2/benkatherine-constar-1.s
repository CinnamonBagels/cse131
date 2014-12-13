! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     array
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
array:          .skip        20          


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
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         array, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -8, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant array[2] with value 5.0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Starting array access */
/* line number 7*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         array, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -12, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 9*/
/* setting x = array[2] */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Starting array access */
/* line number 9*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         array, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -20, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading array[2] to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 7 to %l1 */
    set         7, %l1
/* line number 9*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* setting y = int + int */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 5
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         array, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -32, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         5, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 4 to %l0 */
    set         4, %l0
/* line number 11*/
/* Loading array[2] to %l1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* setting z = int + int */
    set         -40, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 13*/
/* Done. */
/* line number 13*/
/* Printing int z */
    set         _intFmt, %o0
/* line number 13*/
/* Loading z to %o1 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 15*/
/* Loading y to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 17*/
/* Loading x to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
