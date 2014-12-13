! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r44.44     
float_1:        .single      0r22.22     
str_2:          .asciz       "x is now: "
str_3:          .asciz       "y is now: "
str_4:          .asciz       "z is now: "
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %l0
    set         1, %l1
/* line number 3*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 3*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 3*/
/* Storing variable int + int into a */
    set         null, %l5
    add         null, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
! --storing constant b with value 9.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         9, %l1
    st          %l1, [%l0]
! --storing constant c with value 44.44
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 8) & -8
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
! --storing constant x with value 5.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant y with value 6.0
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         6, %l1
    st          %l1, [%l0]
! --storing constant z with value 22.22
    set         null, %l0
    add         null, %l0, %l0
    set         null, %l0
    add         null, %l0, %l0
    ld          [%l0], %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Printing int x */
    set         _intFmt, %o0
    set         null, %l1
    add         null, %l1, %l1
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
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* printing float STO.VarSTO@1d15d1c */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o0
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %f2
    call    foo
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
/* Printing int x */
    set         _intFmt, %o0
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
/* line number 22*/
/* Printing int y */
    set         _intFmt, %o0
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 22*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* printing float STO.VarSTO@1d15d1c */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 23*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
