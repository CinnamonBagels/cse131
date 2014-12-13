! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     flux,laser
staticGuard_flux:    .word        0           
staticGuard_main_laser:    .word        0           
str_0:          .asciz       "lime.lol[" 
str_1:          .asciz       "]: "       
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
flux:           .skip        292         

laser:          .skip        292         


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
    set         staticGuard_flux, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_flux
    nop
    set         staticGuard_flux, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_flux:
    set         staticGuard_main_laser, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_laser
    nop
    set         staticGuard_main_laser, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_laser:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 16*/
/* Starting array access */
/* line number 16*/
/* Loading 15 to %l0 */
    set         15, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -80, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -300, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant rofl[15] with value 1.0
    set         -300, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 17*/
/* Starting array access */
/* line number 17*/
/* Loading 15 to %l0 */
    set         15, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -80, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -304, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 17*/
/* Storing variable rofl[15] into barC */
    set         -284, %l5
    add         %fp, %l5, %l5
    set         -304, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 18*/
/* Starting array access */
/* line number 18*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -80, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -308, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 18*/
/* Short-circuiting && with barC */
/* line number 18*/
/* Loading barC to %l1 */
    set         -284, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading barC to %l0 */
    set         -284, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 18*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 18*/
/* Storing result of Binary Op */
    set         -312, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 18*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 into rofl[4] */
    set         -308, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -312, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 21*/
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-316]
/* line number 21*/
/* Done. */
while_0:
/* line number 21*/
/* Prepping Comparison Calculations by loading */
/* line number 21*/
/* Loading i to %l0 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 20 to %l1 */
    set         20, %l1
/* line number 21*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 21*/
/* Storing result of Comparison Op */
    set         -320, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -320, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 23*/
/* Starting array access */
/* line number 23*/
/* Loading i to %l0 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 50
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -280, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -324, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         50, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
! --storing constant lol[i] with value 1337.0
    set         -324, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1337, %l1
    st          %l1, [%l0]
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 24*/
/* Loading i to %o1 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Starting array access */
/* line number 24*/
/* Loading i to %l0 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 50
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -280, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -328, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         50, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* line number 24*/
/* Printing int lol[i] */
    set         _intFmt, %o0
/* line number 24*/
/* Loading lol[i] to %o1 */
    set         -328, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 24*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* Incrementing */
/* line number 25*/
/* Loading i to %l0 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -316, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 25*/
/* Post Increment */
    dec     %l0
    set         -332, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
/* line number 28*/
/* Starting array access */
/* line number 28*/
/* Loading 9 to %l0 */
    set         9, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 50
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -280, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -336, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         50, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* line number 28*/
/* Storing variable lol[9] into barA */
    set         -292, %l5
    add         %fp, %l5, %l5
    set         -336, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 30*/
/* Printing int barA */
    set         _intFmt, %o0
/* line number 30*/
/* Loading barA to %o1 */
    set         -292, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 30*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Starting array access */
/* line number 31*/
/* Loading 15 to %l0 */
    set         15, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_6
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_6
    nop
arrayInBounds_6:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -80, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -340, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_6
    nop
arrayOutBounds_6:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_6:
/* line number 31*/
/* Printing bool rofl[15] */
/* line number 31*/
/* Loading rofl[15] to %l0 */
    set         -340, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 31*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Printing bool barC */
/* line number 32*/
/* Loading barC to %l0 */
    set         -284, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 32*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* Starting array access */
/* line number 33*/
/* Loading 4 to %l0 */
    set         4, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_7
    nop
    cmp         %l0, 20
    bge     arrayOutBounds_7
    nop
arrayInBounds_7:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -80, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -344, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_7
    nop
arrayOutBounds_7:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         20, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_7:
/* line number 33*/
/* Printing bool rofl[4] */
/* line number 33*/
/* Loading rofl[4] to %l0 */
    set         -344, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 33*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 344) & -8
