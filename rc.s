! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "before calling foo, i is "
str_1:          .asciz       " and j is" 
str_2:          .asciz       "after calling foo, i is modified, and is now "
str_3:          .asciz       " and j is "
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
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 2*/
/* Storing parameter b */
    st          %i0, [%fp+68]
/* line number 2*/
/* Storing parameter c */
    st          %i1, [%fp+72]
! --storing constant b with value 777.0
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         777, %l1
    st          %l1, [%l0]
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
/* line number 5*/
/* Loading b to %l0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading c to %l1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* Storing variable int + int into c */
    set         72, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 8*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 8*/
/* Storing parameter b */
    st          %i1, [%fp+72]
/* line number 9*/
/* Preparing argument a */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o0
/* line number 9*/
/* Preparing argument b */
    set         72, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o1
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
/* line number 15*/
/* setting i = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 15*/
/* Done. */
/* line number 17*/
/* setting j = 1 */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 17*/
/* Done. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 17*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 17*/
/* Loading j to %o1 */
    set         -12, %l1
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
/* Preparing argument i */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
/* line number 18*/
/* Preparing argument j */
    set         -12, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o1
    call    foo
    nop
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 20*/
/* Loading i to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 20*/
/* Loading j to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
