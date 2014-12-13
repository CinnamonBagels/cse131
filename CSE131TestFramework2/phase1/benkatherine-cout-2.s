! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b,c
a:              .word        5           
b:              .word        6           
c:              .word        0           
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
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
/* line number 5*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 5*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
/* line number 5*/
/* Loading int + int to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 5*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Storing variable int + int into c */
    set         c, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 8*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 8*/
/* Loading a to %o1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Printing int int + int */
    set         _intFmt, %o0
/* line number 9*/
/* Loading int + int to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading int - int to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 10*/
/* Loading int - int to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 11*/
/* Loading 6 to %l1 */
    set         6, %l1
/* line number 11*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 11*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* printf on int */
    set         _intFmt, %o0
    set         11, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 12*/
/* Loading c to %o1 */
    set         c, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
