! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "b is: "    
str_1:          .asciz       "c is: "    
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
/* line number 4*/
/* setting b = 555 */
    set         555, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 4*/
/* Loading b to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 4*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Returning value from foo */
/* line number 6*/
/* Loading b to %i0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
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
    call    foo
    nop
/* line number 10*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* line number 12*/
/* setting c = foo() */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 12*/
/* Loading c to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
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
SAVE.main = -(92 + 12) & -8
