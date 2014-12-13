! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_1:        .single      0r5.5       
str_0:          .asciz       "b is: "    
str_2:          .asciz       "c is: "    
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
/* Storing parameter b */
    st          %f0, [%fp+68]
/* line number 3*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 3*/
/* Done printing string. */
/* line number 3*/
/* printing float STO.VarSTO@1787a6 */
/* line number 3*/
/* Loading b to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 3*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 5*/
/* Returning value from foo */
/* line number 5*/
/* Loading b to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    ba      foo_end
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
/* Preparing argument 5.50 */
/* line number 9*/
/* Loading 5.50 to %f0 */
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    call    foo
    nop
/* line number 9*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 11*/
/* setting c = foo() */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 11*/
/* Done. */
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* printing float STO.VarSTO@183bfee */
/* line number 11*/
/* Loading c to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
