! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_1:        .single      0r27.29     
str_0:          .asciz       " "         
str_2:          .asciz       " "         
str_3:          .asciz       " "         
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
/* line number 6*/
/* setting i = 17 */
    set         17, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
/* getting address of i */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer iptr with the value of &i */
/* line number 7*/
/* Loading &i to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 7*/
/* Storing value of register %o0 into iptr */
    st          %o0, [%fp-16]
/* getting address of i */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Dereferencing &i */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* setting j = *&i */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Dereferencing iptr */
    set         -16, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* setting k = *iptr */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 10*/
/* Loading j to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 10*/
/* Loading k to %o1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* setting f = 27.29 */
    set         -40, %l0
    add         %fp, %l0, %l0
/* line number 13*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 13*/
/* Done. */
/* getting address of f */
    set         -40, %l0
    add         %fp, %l0, %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer fptr with the value of &f */
/* line number 14*/
/* Loading &f to %o0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 14*/
/* Storing value of register %o0 into fptr */
    st          %o0, [%fp-48]
/* getting address of f */
    set         -40, %l0
    add         %fp, %l0, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 14*/
/* Dereferencing &f */
    set         -52, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 15*/
/* setting jf = *&f */
    set         -60, %l0
    add         %fp, %l0, %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Done. */
/* line number 15*/
/* Dereferencing fptr */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* setting kf = *fptr */
    set         -68, %l0
    add         %fp, %l0, %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* printing float STO.VarSTO@69048b */
/* line number 17*/
/* Loading jf to %f0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* printing float STO.VarSTO@a969e4 */
/* line number 17*/
/* Loading kf to %f0 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* setting b = false */
    set         0, %l0
    st          %l0, [%fp-72]
/* line number 20*/
/* Done. */
/* getting address of b */
    set         -72, %l0
    add         %fp, %l0, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer bptr with the value of &b */
/* line number 21*/
/* Loading &b to %o0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 21*/
/* Storing value of register %o0 into bptr */
    st          %o0, [%fp-80]
/* getting address of b */
    set         -72, %l0
    add         %fp, %l0, %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing &b */
    set         -84, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* setting jb = *&b */
    set         -92, %l0
    add         %fp, %l0, %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 22*/
/* Done. */
/* line number 22*/
/* Dereferencing bptr */
    set         -80, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* setting kb = *bptr */
    set         -100, %l0
    add         %fp, %l0, %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 24*/
/* Done. */
/* line number 24*/
/* Printing bool jb */
/* line number 24*/
/* Loading jb to %l0 */
    set         -92, %l1
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
/* line number 24*/
/* Done printing bool. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Printing bool kb */
/* line number 24*/
/* Loading kb to %l0 */
    set         -100, %l1
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
/* line number 24*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 100) & -8
