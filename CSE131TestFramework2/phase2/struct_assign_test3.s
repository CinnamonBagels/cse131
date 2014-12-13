! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     bed
float_0:        .single      0r99.33     
str_1:          .asciz       "star.barA: "
str_2:          .asciz       "star.barB: "
str_3:          .asciz       "star.barC: "
str_4:          .asciz       "cyclops.barA: "
str_5:          .asciz       "cyclops.barB: "
str_6:          .asciz       "cyclops.barC: "
str_7:          .asciz       "bed.barA: "
str_8:          .asciz       "bed.barB: "
str_9:          .asciz       "bed.barC: "
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
bed:            .skip        12          


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
/* line number 13*/
/* setting cyclops = bed */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         bed, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 13*/
/* Done. */
! --storing constant barA with value 44.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         44, %l1
    st          %l1, [%l0]
! --storing constant barB with value 99.33
    set         -8, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant barC with value 1.0
    set         -4, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant barA with value 55.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         55, %l1
    st          %l1, [%l0]
/* line number 18*/
/* Storing variable barB into barB */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 19*/
/* Short-circuiting && with barC */
/* line number 19*/
/* Loading barC to %l1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading barC to %l0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading false to %l1 */
    set         0, %l1
/* line number 19*/
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
/* line number 19*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 19*/
/* Storing variable Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 into barC */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 23*/
/* setting star = cyclops */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 23*/
/* Done. */
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Printing int barA */
    set         _intFmt, %o0
/* line number 23*/
/* Loading barA to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 23*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* printing float STO.VarSTO@944d4a */
/* line number 24*/
/* Loading barB to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 24*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* Printing bool barC */
/* line number 25*/
/* Loading barC to %l0 */
    set         -4, %l1
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
/* line number 25*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Printing int barA */
    set         _intFmt, %o0
/* line number 27*/
/* Loading barA to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@944d4a */
/* line number 28*/
/* Loading barB to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Printing bool barC */
/* line number 29*/
/* Loading barC to %l0 */
    set         -4, %l1
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
/* line number 29*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
/* Printing int barA */
    set         _intFmt, %o0
/* line number 31*/
/* Loading barA to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* printing float STO.VarSTO@944d4a */
/* line number 32*/
/* Loading barB to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 32*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Printing bool barC */
/* line number 33*/
/* Loading barC to %l0 */
    set         -4, %l1
    add         %fp, %l1, %l1
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
SAVE.main = -(92 + 32) & -8
