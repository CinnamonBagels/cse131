! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x
x:              .single      0r99.88     
float_0:        .single      0r123.45    
str_1:          .asciz       " "         
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
/* line number 5*/
/* Storing parameter x */
    st          %f0, [%fp+68]
/* line number 6*/
/* printing float STO.VarSTO@183bfee */
/* line number 6*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 6*/
/* Done printing float. */
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
/* line number 10*/
/* Preparing argument 123.45 */
/* line number 10*/
/* Loading 123.45 to %f0 */
    set         float_0, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    call    foo
    nop
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* printing float STO.VarSTO@e28099 */
/* line number 11*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
