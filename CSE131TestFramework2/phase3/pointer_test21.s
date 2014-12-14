! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     naked,vampire,juice,kiwi
naked:          .word        2222        
vampire:        .word        0           
juice:          .word        0           
str_0:          .asciz       "orange's value is: "
str_1:          .asciz       "naked's value is: "
str_2:          .asciz       "orange's value is now: "
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
kiwi:           .skip        4           


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
                .global      something
something:
    set         SAVE.something, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Storing parameter p */
    st          %i0, [%fp+68]
/* line number 8*/
/* Dereferencing p */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Dereferencing *p */
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Dereferencing **p */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Dereferencing ***p */
    set         -16, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant ****p with value 22.0
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         22, %l1
    st          %l1, [%l0]
/* line number 9*/
/* Dereferencing p */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of kiwi */
    set         kiwi, %l0
    add         %g0, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Storing variable &kiwi into *p */
    set         -24, %l5
    add         %fp, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
something_end:
    ret 
    restore
SAVE.something = -(92 + 28) & -8
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
/* getting address of naked */
    set         naked, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 3*/
/* Storing variable &naked into vampire */
    set         vampire, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* getting address of vampire */
    set         vampire, %l0
    add         %g0, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* Storing variable &vampire into juice */
    set         juice, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* getting address of juice */
    set         juice, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer apple with the value of &juice */
/* line number 15*/
/* Loading &juice to %o0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 15*/
/* Storing value of register %o0 into apple */
    st          %o0, [%fp-12]
/* getting address of apple */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer orange with the value of &apple */
/* line number 17*/
/* Loading &apple to %o0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 17*/
/* Storing value of register %o0 into orange */
    st          %o0, [%fp-20]
/* line number 18*/
/* setting pear = 132 */
    set         132, %l0
    st          %l0, [%fp-24]
/* line number 18*/
/* Done. */
/* getting address of pear */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer plum with the value of &pear */
/* line number 19*/
/* Loading &pear to %o0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 19*/
/* Storing value of register %o0 into plum */
    st          %o0, [%fp-32]
/* getting address of plum */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 19*/
/* Storing variable &plum into kiwi */
    set         kiwi, %l5
    add         %g0, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Dereferencing orange */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing *orange */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing **orange */
    set         -44, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing ***orange */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Printing int ****orange */
    set         _intFmt, %o0
/* line number 21*/
/* Loading ****orange to %o1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* Preparing argument orange */
    set         -20, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
    call    something
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* Printing int naked */
    set         _intFmt, %o0
/* line number 25*/
/* Loading naked to %o1 */
    set         naked, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 26*/
/* Done printing string. */
/* line number 26*/
/* Dereferencing orange */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Dereferencing *orange */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Dereferencing **orange */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Dereferencing ***orange */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 26*/
/* Printing int ****orange */
    set         _intFmt, %o0
/* line number 26*/
/* Loading ****orange to %o1 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 68) & -8
