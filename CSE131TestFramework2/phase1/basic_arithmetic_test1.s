! --globals--
                .section     ".data"
                .align 4
                 .global     x,y,z
x:              .word        0           
y:              .word        0           
z:              .word        0           
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
/* setting localX = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
/* line number 9*/
/* setting localY = 10 */
    set         10, %l0
    st          %l0, [%fp-12]
/* line number 9*/
/* Done. */
/* line number 11*/
/* setting localZ = 50 */
    set         50, %l0
    st          %l0, [%fp-16]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Storing int + int into x */
    set         x, %l0
    add         %g0, %l0, %l0
    set         -24, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* Storing int + int into y */
    set         y, %l0
    add         %g0, %l0, %l0
    set         -32, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Storing int + int into z */
    set         z, %l0
    add         %g0, %l0, %l0
    set         -52, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 15*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Printing int y */
    set         _intFmt, %o0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Printing int z */
    set         _intFmt, %o0
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 52) & -8
