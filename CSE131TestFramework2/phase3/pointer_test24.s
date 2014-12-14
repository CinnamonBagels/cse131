! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     kick
str_0:          .asciz       "b is: "    
str_1:          .asciz       "punch is: "
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
kick:           .skip        4           


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
                .global      moby
moby:
    set         SAVE.moby, %g1
    save        %sp, %g1, %sp
/* line number 9*/
/* setting a = 4122 */
    set         4122, %l0
    st          %l0, [%fp-8]
/* line number 9*/
/* Done. */
/* getting address of a */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer k with the value of &a */
/* line number 11*/
/* Loading &a to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 11*/
/* Storing value of register %o0 into k */
    st          %o0, [%fp-16]
/* line number 12*/
/* Returning value from moby */
/* line number 12*/
/* Loading k to %i0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      moby_end
    nop
moby_end:
    ret 
    restore
SAVE.moby = -(92 + 16) & -8
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
    call    moby
    nop
/* line number 16*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* initializing pointer b with the value of moby() */
/* line number 18*/
/* Loading moby() to %o0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 18*/
/* Storing value of register %o0 into b */
    st          %o0, [%fp-12]
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Dereferencing b */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* Printing int *b */
    set         _intFmt, %o0
/* line number 20*/
/* Loading *b to %o1 */
    set         -20, %l1
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
/* line number 23*/
/* Allocating for new punch */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -24, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 25*/
/* Deallocating for delete punch */
    set         -24, %o0
    add         %fp, %o0, %o0
    call    free
    nop
/* line number 25*/
/* Storing variable 0 into punch */
    set         -24, %l5
    add         %fp, %l5, %l5
    set         0, %l3
    st          %l3, [%l5]
    call    moby
    nop
/* line number 25*/
/* Saving return value on to stack */
    st          %o0, [%fp+-28]
/* line number 25*/
/* Assigning converted moby() to punch */
    set         -24, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Dereferencing punch */
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Printing int *punch */
    set         _intFmt, %o0
/* line number 27*/
/* Loading *punch to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
