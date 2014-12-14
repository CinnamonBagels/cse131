! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     foo,bar,baz,tonic
float_0:        .single      0r99.44     
str_1:          .asciz       "baz's sword: "
str_2:          .asciz       "baz's sheld: "
str_3:          .asciz       "baz's bow: "
str_4:          .asciz       "baz's canteen at index 3: "
str_5:          .asciz       "foo's sword: "
str_6:          .asciz       "foo's sheld: "
str_7:          .asciz       "foo's bow: "
str_8:          .asciz       "foo's canteen at index 3: "
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
foo:            .skip        4           

bar:            .skip        4           

baz:            .skip        4           

tonic:          .skip        28          


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
! --storing constant sword with value 54.0
    set         -52, %l0
    add         %fp, %l0, %l0
    set         54, %l1
    st          %l1, [%l0]
! --storing constant shield with value 1.0
    set         -48, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant bow with value 99.44
    set         -44, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 28*/
/* setting linkIndex = 0 */
    set         0, %l0
    st          %l0, [%fp-60]
/* line number 28*/
/* Done. */
while_0:
/* line number 28*/
/* Prepping Comparison Calculations by loading */
/* line number 28*/
/* Loading linkIndex to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 28*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 28*/
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
/* line number 28*/
/* Storing result of Comparison Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 30*/
/* Starting array access */
/* line number 30*/
/* Loading linkIndex to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -40, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -68, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant canteen[linkIndex] with value 8.0
    set         -68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         8, %l1
    st          %l1, [%l0]
/* line number 31*/
/* Incrementing */
/* line number 31*/
/* Loading linkIndex to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -60, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 31*/
/* Post Increment */
    dec     %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
/* getting address of magic */
    set         -56, %l0
    add         %fp, %l0, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Storing variable &magic into baz */
    set         baz, %l5
    add         %g0, %l5, %l5
    set         -76, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Dereferencing baz */
    set         baz, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -128, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Printing int sword */
    set         _intFmt, %o0
/* line number 36*/
/* Loading sword to %o1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 36*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
/* line number 37*/
/* Dereferencing baz */
    set         baz, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -180, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 37*/
/* Printing bool shield */
/* line number 37*/
/* Loading shield to %l0 */
    set         -48, %l1
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
/* line number 37*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
/* line number 38*/
/* Dereferencing baz */
    set         baz, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -232, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 38*/
/* printing float STO.VarSTO@a28815 */
/* line number 38*/
/* Loading bow to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 38*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
/* line number 39*/
/* Dereferencing baz */
    set         baz, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -284, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 39*/
/* Starting array access */
/* line number 39*/
/* Loading 3 to %l0 */
    set         3, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -40, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -288, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* line number 39*/
/* Printing int canteen[3] */
    set         _intFmt, %o0
/* line number 39*/
/* Loading canteen[3] to %o1 */
    set         -288, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 39*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* getting address of baz */
    set         baz, %l0
    add         %g0, %l0, %l0
    set         -292, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 41*/
/* Storing variable &baz into foo */
    set         foo, %l5
    add         %g0, %l5, %l5
    set         -292, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Dereferencing foo */
    set         foo, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -296, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Dereferencing *foo */
    set         -296, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -348, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Printing int sword */
    set         _intFmt, %o0
/* line number 43*/
/* Loading sword to %o1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Dereferencing foo */
    set         foo, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -352, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 44*/
/* Dereferencing *foo */
    set         -352, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -404, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 44*/
/* Printing bool shield */
/* line number 44*/
/* Loading shield to %l0 */
    set         -48, %l1
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
/* line number 44*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
/* Dereferencing foo */
    set         foo, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -408, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 45*/
/* Dereferencing *foo */
    set         -408, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -460, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 45*/
/* printing float STO.VarSTO@a28815 */
/* line number 45*/
/* Loading bow to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 45*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
/* line number 46*/
/* Dereferencing foo */
    set         foo, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -464, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 46*/
/* Dereferencing *foo */
    set         -464, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -516, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 46*/
/* Starting array access */
/* line number 46*/
/* Loading 3 to %l0 */
    set         3, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -40, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -520, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 46*/
/* Printing int canteen[3] */
    set         _intFmt, %o0
/* line number 46*/
/* Loading canteen[3] to %o1 */
    set         -520, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 46*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 520) & -8
