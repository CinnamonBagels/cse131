! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 3*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 3*/
/* Loading x to %o1 */
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
! --storing constant x with value 2.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 7*/
/* Loading x to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 7*/
/* Done printing int. */
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
/* line number 14*/
/* setting a = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Preparing argument a */
    set         -8, %o0
    add         %fp, %o0, %o0
    call    foo
    nop
/* line number 16*/
/* Printing int a */
    set         _intFmt, %o0
/* line number 16*/
/* Loading a to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
