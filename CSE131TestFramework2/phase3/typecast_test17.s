! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r512.55    
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
/* line number 11*/
/* Starting array access */
/* line number 11*/
/* Loading 400 to %l0 */
    set         400, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4016, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant c[400] with value 512.55
    set         -4016, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Starting array access */
/* line number 12*/
/* Loading 400 to %l0 */
    set         400, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 1000
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -4000, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -4020, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         1000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* getting address of c[400] */
    set         -4020, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -4024, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Storing variable &c[400] into &c[400] */
    set         -4028, %l5
    add         %fp, %l5, %l5
    set         -4024, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* initializing pointer a with the value of &c[400] */
/* line number 14*/
/* Loading &c[400] to %o0 */
    set         -4028, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 14*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-4032]
/* line number 14*/
/* Dereferencing a */
    set         -4032, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -4036, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 14*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 14*/
/* Loading *a to %o1 */
    set         -4036, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4036) & -8
