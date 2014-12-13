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
/* line number 2*/
/* Storing parameter y */
    st          %i1, [%fp+72]
/* line number 2*/
/* Storing parameter z */
    st          %i2, [%fp+76]
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
/* line number 3*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 3*/
/* Loading y to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
/* line number 3*/
/* Printing int z */
    set         _intFmt, %o0
/* line number 3*/
/* Loading z to %o1 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
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
/* line number 9*/
/* setting a = 7 */
    set         7, %l0
    st          %l0, [%fp-8]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Preparing argument 5 */
/* line number 9*/
/* Loading 5 to %o0 */
    set         5, %o0
/* line number 9*/
/* Preparing argument 6 */
/* line number 9*/
/* Loading 6 to %o1 */
    set         6, %o1
/* line number 9*/
/* Preparing argument a */
/* line number 9*/
/* Loading a to %o2 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o2
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
