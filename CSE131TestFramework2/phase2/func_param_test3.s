! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     ggg
ggg:            .word        4           
str_0:          .asciz       "y is now: "
str_1:          .asciz       "b is now: "
str_2:          .asciz       "ggg is now: "
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
                .global      foobaz
foobaz:
    set         SAVE.foobaz, %g1
    save        %sp, %g1, %sp
/* line number 4*/
/* Storing parameter k */
    st          %i0, [%fp+68]
/* line number 4*/
/* Storing parameter l */
    st          %i1, [%fp+72]
/* line number 4*/
/* Storing parameter m */
    st          %i2, [%fp+76]
! --storing constant k with value 555.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         555, %l1
    st          %l1, [%l0]
! --storing constant l with value 666.0
    set         72, %l0
    add         %fp, %l0, %l0
    set         666, %l1
    st          %l1, [%l0]
! --storing constant m with value 777.0
    set         76, %l0
    add         %fp, %l0, %l0
    set         777, %l1
    st          %l1, [%l0]
foobaz_end:
    ret 
    restore
SAVE.foobaz = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 11*/
/* Storing parameter r */
    st          %i0, [%fp+68]
/* line number 11*/
/* Storing parameter s */
    st          %i1, [%fp+72]
/* line number 11*/
/* Storing parameter t */
    st          %i2, [%fp+76]
! --storing constant r with value 7.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         7, %l1
    st          %l1, [%l0]
/* line number 13*/
/* Preparing argument r */
    set         68, %o0
    add         %fp, %o0, %o0
/* line number 13*/
/* Preparing argument s */
    set         72, %o1
    add         %fp, %o1, %o1
/* line number 13*/
/* Preparing argument t */
    set         76, %o2
    add         %fp, %o2, %o2
    call    foobaz
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 17*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 17*/
/* Storing parameter b */
    st          %i1, [%fp+72]
/* line number 17*/
/* Storing parameter c */
    st          %i2, [%fp+76]
/* line number 18*/
/* Preparing argument a */
    set         68, %o0
    add         %fp, %o0, %o0
/* line number 18*/
/* Preparing argument b */
    set         72, %o1
    add         %fp, %o1, %o1
/* line number 18*/
/* Preparing argument c */
    set         76, %o2
    add         %fp, %o2, %o2
    call    bar
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
/* line number 21*/
/* Storing parameter y */
    st          %i0, [%fp+68]
! --storing constant y with value 2.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* line number 26*/
/* setting b = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 26*/
/* Done. */
/* line number 26*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 26*/
/* Loading y to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 27*/
/* Loading b to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* Printing int ggg */
    set         _intFmt, %o0
/* line number 28*/
/* Loading ggg to %o1 */
    set         ggg, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 28*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* Preparing argument y */
    set         68, %o0
    add         %fp, %o0, %o0
/* line number 30*/
/* Preparing argument b */
    set         -8, %o1
    add         %fp, %o1, %o1
/* line number 30*/
/* Preparing argument ggg */
    set         ggg, %o2
    add         %g0, %o2, %o2
    call    foo
    nop
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 32*/
/* Loading y to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 33*/
/* Loading b to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 33*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
/* line number 34*/
/* Printing int ggg */
    set         _intFmt, %o0
/* line number 34*/
/* Loading ggg to %o1 */
    set         ggg, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 34*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
