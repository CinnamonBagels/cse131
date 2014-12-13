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
/* line number 3*/
/* setting x = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 3*/
/* Done. */
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 3*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 3*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Returning value from foo */
/* line number 4*/
/* Loading int + int to %i0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 12) & -8
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
    call    foo
    nop
/* line number 8*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
    call    foo
    nop
/* line number 8*/
/* Saving return value on to stack */
    st          %o0, [%fp+-12]
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading foo() to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading foo() to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* setting y = int + int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 10*/
/* Loading y to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
