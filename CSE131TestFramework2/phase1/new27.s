! --globals--
                .section     ".data"
                .align 4
                 .global     x
x:              .word        6           
globalInit_:    .word        0           
str_0:          .asciz       "main"      
str_1:          .asciz       "end"       

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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
/* line number 6*/
/* Returning value from foo1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %i0
    ba      foo1_end
    nop
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
    call    foo1
    nop
/* line number 10*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 11*/
/* Returning value from foo */
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
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    call    foo
    nop
/* line number 15*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 15*/
/* Printing int foo() */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
