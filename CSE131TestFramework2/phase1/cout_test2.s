! --globals--
                .section     ".data"
                .align 4
                 .global     x
x:              .word        1           
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
/* line number 8*/
/* setting x = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
/* line number 10*/
/* setting y = 10 */
    set         10, %l0
    st          %l0, [%fp-12]
/* line number 10*/
/* Done. */
/* line number 10*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* printf on int */
    set         _intFmt, %o0
    set         2, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printf on int */
    set         _intFmt, %o0
    set         3, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 15*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Printing int int + int */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 16*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 16*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 16*/
/* Printing int int - int */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 17*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 17*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 17*/
/* Printing int int * int */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 18*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 18*/
/* Printing int int / int */
    set         _intFmt, %o0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 28) & -8
