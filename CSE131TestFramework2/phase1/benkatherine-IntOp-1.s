! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .word        4           
b:              .word        3           
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
/* setting a = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 7*/
/* Done. */
/* line number 8*/
/* setting b = 6 */
    set         6, %l0
    st          %l0, [%fp-12]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* setting c = int - int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 11*/
/* setting d = c */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 11*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* printf on int */
    set         _intFmt, %o0
    set         10, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 12*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 13*/
/* Loading b to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Printing int int + int */
    set         _intFmt, %o0
/* line number 14*/
/* Loading int + int to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading b to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 15*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading int - int to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 15*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading int - int to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 15*/
/* Loading b to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 15*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 15*/
/* Loading int - int to %o1 */
    set         -44, %l1
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
/* Printing int c */
    set         _intFmt, %o0
/* line number 16*/
/* Loading c to %o1 */
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
/* Printing int d */
    set         _intFmt, %o0
/* line number 17*/
/* Loading d to %o1 */
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
