! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_3:        .single      0r22.22     
str_0:          .asciz       "a is: "    
str_1:          .asciz       "b is: "    
str_2:          .asciz       "c is: "    
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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 3*/
/* Done printing string. */
/* line number 3*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 3*/
/* Loading a to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 4*/
/* Loading b to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 4*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
/* line number 5*/
/* printing float STO.VarSTO@cb741e */
/* line number 5*/
/* Loading c to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 5*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
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
    set         float_3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 14*/
/* Loading x to %o1 */
    set         68, %l1
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
/* Printing int y */
    set         _intFmt, %o0
/* line number 15*/
/* Loading y to %o1 */
    set         72, %l1
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
/* printing float STO.VarSTO@1be4050 */
/* line number 16*/
/* Loading z to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Preparing argument x */
/* line number 18*/
/* Loading x to %o0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 18*/
/* Preparing argument y */
/* line number 18*/
/* Loading y to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* line number 18*/
/* Preparing argument z */
/* line number 18*/
/* Loading z to %f2 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f2
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
