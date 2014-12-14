! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     bee
float_0:        .single      0r9.93      
float_1:        .single      0r88.33     
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
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
/* line number 12*/
/* setting k = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* getting address of k */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Storing variable &k into a */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
! --storing constant b with value 9.93
    set         -8, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* setting snake = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 15*/
/* Done. */
/* getting address of snake */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer snake1 with the value of &snake */
/* line number 16*/
/* Loading &snake to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 16*/
/* Storing value of register %o0 into snake1 */
    st          %o0, [%fp-24]
/* getting address of snake1 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Storing variable &snake1 into c */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* getting address of bee */
    set         bee, %l0
    add         %g0, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer bird with the value of &bee */
/* line number 20*/
/* Loading &bee to %o0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 20*/
/* Storing value of register %o0 into bird */
    st          %o0, [%fp-36]
/* line number 20*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Subtracting */
/* line number 20*/
/* Loading b to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Storing variable 88.33 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 20*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* printing float STO.ExprSTO@67211b */
/* line number 20*/
/* Loading float - float to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing a */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading *a to %l0 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 77 to %l1 */
    set         77, %l1
/* line number 21*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 21*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading int * int to %l0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 21*/
/* Loading 18833 to %l1 */
    set         18833, %l1
/* line number 21*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 21*/
/* Storing result of Binary Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 21*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 21*/
/* Loading int - int to %o1 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Dereferencing bird */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Dereferencing c */
    set         -4, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Dereferencing *c */
    set         -92, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Short-circuiting && with **c */
/* line number 22*/
/* Loading **c to %l1 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading **c to %l0 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 22*/
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
/* line number 22*/
/* Storing result of Binary Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 22*/
/* Short-circuiting && with Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
/* line number 22*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l1 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 22*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 22*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_1
    nop
andF_1:
    set         0, %l2
    ba      andEnd_1
    nop
andT_1:
    set         1, %l2
andEnd_1:
/* line number 22*/
/* Storing result of Binary Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 22*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 */
/* line number 22*/
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -104, %l1
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
/* line number 22*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 104) & -8
