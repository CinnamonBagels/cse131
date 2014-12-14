! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "**b is: "  
str_1:          .asciz       "*a is: "   
str_2:          .asciz       "**b is: "  
str_3:          .asciz       "**b is: "  
str_4:          .asciz       "*a is: "   
str_5:          .asciz       "*a is: "   
str_6:          .asciz       "**b is: "  
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
/* line number 7*/
/* setting x = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
/* line number 8*/
/* setting y = 8 */
    set         8, %l0
    st          %l0, [%fp-12]
/* line number 8*/
/* Done. */
/* getting address of x */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer a with the value of &x */
/* line number 9*/
/* Loading &x to %o0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 9*/
/* Storing value of register %o0 into a */
    st          %o0, [%fp-20]
/* getting address of x */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer z with the value of &x */
/* line number 10*/
/* Loading &x to %o0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 10*/
/* Storing value of register %o0 into z */
    st          %o0, [%fp-28]
/* getting address of a */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer b with the value of &a */
/* line number 15*/
/* Loading &a to %o0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 15*/
/* Storing value of register %o0 into b */
    st          %o0, [%fp-36]
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 15*/
/* Dereferencing *b */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 15*/
/* Printing int **b */
    set         _intFmt, %o0
/* line number 15*/
/* Loading **b to %o1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* getting address of y */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 17*/
/* Storing variable &y into a */
    set         -20, %l5
    add         %fp, %l5, %l5
    set         -48, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Dereferencing a */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 19*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 19*/
/* Loading *a to %o1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* Dereferencing *b */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* Printing int **b */
    set         _intFmt, %o0
/* line number 20*/
/* Loading **b to %o1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Dereferencing *b */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Storing variable x into **b */
    set         -68, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* Dereferencing *b */
    set         -72, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* Printing int **b */
    set         _intFmt, %o0
/* line number 24*/
/* Loading **b to %o1 */
    set         -76, %l1
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
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* Dereferencing a */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -80, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 25*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 25*/
/* Loading *a to %o1 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Dereferencing *b */
    set         -84, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant **b with value 588585.0
    set         -88, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         588585, %l1
    st          %l1, [%l0]
/* line number 28*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Storing variable z into *b */
    set         -92, %l5
    add         %fp, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
/* line number 30*/
/* Dereferencing a */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 30*/
/* Printing int *a */
    set         _intFmt, %o0
/* line number 30*/
/* Loading *a to %o1 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 30*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
/* Dereferencing b */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 31*/
/* Dereferencing *b */
    set         -100, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 31*/
/* Printing int **b */
    set         _intFmt, %o0
/* line number 31*/
/* Loading **b to %o1 */
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 104) & -8
