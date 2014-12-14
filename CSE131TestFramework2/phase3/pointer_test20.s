! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     blood,vampire
blood:          .word        111         
vampire:        .word        0           
str_0:          .asciz       "white is: "
str_1:          .asciz       "white is: "
str_2:          .asciz       "cool's value is: "
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
                .global      something
something:
    set         SAVE.something, %g1
    save        %sp, %g1, %sp
/* line number 4*/
/* Storing parameter p */
    st          %i0, [%fp+68]
/* line number 5*/
/* Dereferencing p */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* Dereferencing *p */
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant **p with value 22.0
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         22, %l1
    st          %l1, [%l0]
/* getting address of vampire */
    set         vampire, %l0
    add         %g0, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Storing variable &vampire into p */
    set         68, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
something_end:
    ret 
    restore
SAVE.something = -(92 + 16) & -8
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
/* getting address of blood */
    set         blood, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 4*/
/* Storing variable &blood into vampire */
    set         vampire, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 12*/
/* setting white = 44 */
    set         44, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* getting address of white */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer whitePtr with the value of &white */
/* line number 14*/
/* Loading &white to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 14*/
/* Storing value of register %o0 into whitePtr */
    st          %o0, [%fp-16]
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* Printing int white */
    set         _intFmt, %o0
/* line number 14*/
/* Loading white to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* getting address of whitePtr */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer cool with the value of &whitePtr */
/* line number 18*/
/* Loading &whitePtr to %o0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 18*/
/* Storing value of register %o0 into cool */
    st          %o0, [%fp-24]
/* line number 18*/
/* Preparing argument cool */
/* line number 18*/
/* Loading cool to %o0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    something
    nop
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Printing int white */
    set         _intFmt, %o0
/* line number 20*/
/* Loading white to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Dereferencing cool */
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Dereferencing *cool */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Printing int **cool */
    set         _intFmt, %o0
/* line number 21*/
/* Loading **cool to %o1 */
    set         -32, %l1
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
