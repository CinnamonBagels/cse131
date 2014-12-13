! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .word        5           
b:              .word        0           
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
/* line number 7*/
/* Loading a to %o0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
    call    exit

    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* Loading int + int to %o0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    exit

    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 15*/
/* setting c = int + int */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 15*/
/* Done. */
/* line number 16*/
/* Loading c to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    exit

    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      foobar
foobar:
    set         SAVE.foobar, %g1
    save        %sp, %g1, %sp
/* line number 20*/
/* Loading 4 to %o0 */
    set         4, %o0
    call    exit

    nop
foobar_end:
    ret 
    restore
SAVE.foobar = -(92 + 4) & -8
