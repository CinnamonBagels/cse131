! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     ab,bc
ab:             .word        5           
bc:             .word        6           
str_0:          .asciz       "COMES IN foobar successfully"
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
/* line number 7*/
/* Storing parameter x */
    st          %i0, [%fp+-8]
/* line number 7*/
/* Storing parameter y */
    st          %i1, [%fp+-12]
/* line number 7*/
/* Storing parameter z */
    st          %i2, [%fp+-16]
/* line number 7*/
/* Storing parameter a */
    st          %i3, [%fp+-20]
/* line number 7*/
/* Storing parameter b */
    st          %i4, [%fp+-24]
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foobar
foobar:
    set         SAVE.foobar, %g1
    save        %sp, %g1, %sp
/* line number 9*/
/* Storing parameter x */
    st          %i0, [%fp+-8]
/* line number 9*/
/* Storing parameter y */
    st          %i1, [%fp+-12]
/* line number 9*/
/* Storing parameter z */
    st          %i2, [%fp+-16]
/* line number 9*/
/* Storing parameter a */
    st          %i3, [%fp+-20]
/* line number 9*/
/* Storing parameter b */
    st          %i4, [%fp+-24]
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
foobar_end:
    ret 
    restore
SAVE.foobar = -(92 + 4) & -8
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
    call    foobar
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
