! --globals--
                .section     ".data"
                .align 4
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
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 5*/
/* Storing result of Binary Op */
    set         a, %l4
    add         %g0, %l4, %l4
    st          %l3, [%l4]
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 5*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 5*/
/* Storing result of Binary Op */
    set         int + int, %l4
    add         %g0, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Storing int + int into c */
    set         c, %l0
    add         %g0, %l0, %l0
    set         int + int, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 8*/
/* Printing int a */
    set         _intFmt, %o0
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
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
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
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
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
SAVE.main = -(92 + 16) & -8
