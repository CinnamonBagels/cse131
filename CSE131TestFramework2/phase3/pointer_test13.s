! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     wow,gangster,bee
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
wow:            .skip        40000       

gangster:       .skip        16004       

bee:            .skip        12          


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
/* line number 19*/
/* Starting array access */
/* line number 19*/
/* Loading 2431 to %l0 */
    set         2431, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 4000
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16004, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -8, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant dude[2431] with value 0.0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 20*/
/* Starting array access */
/* line number 20*/
/* Loading 2431 to %l0 */
    set         2431, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 4000
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -16004, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -12, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         4000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* getting address of dude[2431] */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer dudette with the value of &dude[2431] */
/* line number 22*/
/* Loading &dude[2431] to %o0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 22*/
/* Storing value of register %o0 into dudette */
    st          %o0, [%fp-20]
/* getting address of bee */
    set         bee, %l0
    add         %g0, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer bird with the value of &bee */
/* line number 24*/
/* Loading &bee to %o0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 24*/
/* Storing value of register %o0 into bird */
    st          %o0, [%fp-28]
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading 3122 to %l0 */
    set         3122, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 10000
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         wow, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -32, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
! --storing constant wow[3122] with value 3332.0
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3332, %l1
    st          %l1, [%l0]
/* line number 26*/
/* Dereferencing bird */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Prepping Arithmetic Calculations by loading */
/* line number 26*/
/* Loading 3133 to %l0 */
    set         3133, %l0
/* line number 26*/
/* Loading 11 to %l1 */
    set         11, %l1
/* line number 26*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 26*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 26*/
/* Starting array access */
/* line number 26*/
/* Loading Arithmetic Op to %l0 */
    set         3122, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 10000
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         wow, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -52, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10000, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* getting address of wow[Arithmetic Op] */
    set         -52, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Storing variable &wow[Arithmetic Op] into a */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -56, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 27*/
/* Dereferencing bird */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of dudette */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Storing variable &dudette into c */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -72, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 29*/
/* Dereferencing bird */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 29*/
/* Dereferencing a */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 29*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 29*/
/* Loading *a to %o1 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* Dereferencing bird */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing c */
    set         -4, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Dereferencing *c */
    set         -104, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -108, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Short-circuiting || with **c */
/* line number 30*/
/* Loading **c to %l1 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     orT_0
    nop
/* line number 30*/
/* Prepping Arithmetic Calculations by loading */
/* line number 30*/
/* Loading **c to %l0 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 30*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 30*/
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
/* line number 30*/
/* Storing result of Binary Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 30*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
/* line number 30*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 to %l0 */
    set         -112, %l1
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
/* line number 30*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 112) & -8
