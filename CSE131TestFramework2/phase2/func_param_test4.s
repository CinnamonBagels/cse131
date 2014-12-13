! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     ggg
ggg:            .word        4           
str_0:          .asciz       "bee is now: "
str_1:          .asciz       "y is now: "
str_2:          .asciz       "b is now: "
str_3:          .asciz       "ggg is now: "
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
                .global      color
color:
    set         SAVE.color, %g1
    save        %sp, %g1, %sp
/* line number 6*/
/* Returning value from color */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      color_end
    nop
color_end:
    ret 
    restore
SAVE.color = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foobaz
foobaz:
    set         SAVE.foobaz, %g1
    save        %sp, %g1, %sp
! --storing constant k with value 555.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         555, %l1
    st          %l1, [%l0]
! --storing constant l with value 666.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         666, %l1
    st          %l1, [%l0]
! --storing constant m with value 777.0
    set         -16, %l0
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
! --storing constant r with value 7.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         7, %l1
    st          %l1, [%l0]
/* line number 18*/
/* Preparing argument r */
/* line number 18*/
/* Preparing argument s */
/* line number 18*/
/* Preparing argument t */
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
/* line number 23*/
/* Preparing argument a */
/* line number 23*/
/* Preparing argument b */
/* line number 23*/
/* Preparing argument c */
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
! --storing constant y with value 2.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* line number 32*/
/* setting b = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 32*/
/* Done. */
/* line number 34*/
/* Preparing argument 4 */
    set         4, %o0
    call    color
    nop
/* line number 34*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 34*/
/* Storing variable color() into bee */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 36*/
/* Printing int y */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 36*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* Printing int b */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 37*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* Printing int ggg */
    set         _intFmt, %o0
    set         ggg, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 38*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
/* line number 39*/
/* Printing int bee */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 39*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* Preparing argument y */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    foo
    nop
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Printing int y */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int b */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
/* Printing int ggg */
    set         _intFmt, %o0
    set         ggg, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 45*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
