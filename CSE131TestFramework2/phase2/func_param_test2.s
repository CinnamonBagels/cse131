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
/* line number 2*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 2*/
/* Storing parameter b */
    st          %i1, [%fp+72]
/* line number 2*/
/* Storing parameter c */
    st          %f2, [%fp+76]
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Loading a to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 1 to %l1 */
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
    set         68, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
! --storing constant b with value 9.0
    set         72, %l0
    add         %fp, %l0, %l0
    set         9, %l1
    st          %l1, [%l0]
! --storing constant c with value 44.44
    set         76, %l0
    add         %fp, %l0, %l0
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
/* line number 10*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 10*/
/* Storing parameter y */
    st          %i1, [%fp+72]
/* line number 10*/
/* Storing parameter z */
    st          %f2, [%fp+76]
! --storing constant x with value 5.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant y with value 6.0
    set         72, %l0
    add         %fp, %l0, %l0
    set         6, %l1
    st          %l1, [%l0]
! --storing constant z with value 22.22
    set         76, %l0
    add         %fp, %l0, %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 15*/
/* Loading x to %o1 */
    set         68, %l1
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
/* Printing int y */
    set         _intFmt, %o0
/* line number 16*/
/* Loading y to %o1 */
    set         72, %l1
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
/* printing float STO.VarSTO@1be4050 */
/* line number 17*/
/* Loading z to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Preparing argument x */
    set         68, %o0
    add         %fp, %o0, %o0
/* line number 19*/
/* Preparing argument y */
    set         72, %o1
    add         %fp, %o1, %o1
/* line number 19*/
/* Preparing argument z */
    set         76, %o2
    add         %fp, %o2, %o2
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
/* line number 21*/
/* Loading x to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
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
/* line number 22*/
/* Loading y to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
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
/* printing float STO.VarSTO@1be4050 */
/* line number 23*/
/* Loading z to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
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
