! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b,c
a:              .single      0r5.5       
float_1:        .single      0r5.55      
b:              .word        3           
c:              .word        0           
str_0:          .asciz       "testing"   
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
    st          %i0, [%fp+68]
/* line number 5*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 5*/
/* Storing parameter z */
    st          %i2, [%fp+76]
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
/* line number 7*/
/* printing float STO.VarSTO@110c2e8 */
/* line number 7*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 7*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 7*/
/* Printing bool z */
/* line number 7*/
/* Loading z to %l0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* line number 7*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Returning value from foo */
    set         0, %i0
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
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Preparing argument 34 */
/* line number 13*/
/* Loading 34 to %o0 */
    set         34, %o0
/* line number 13*/
/* Preparing argument 5.55 */
/* line number 13*/
/* Loading 5.55 to %f1 */
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f1
/* line number 13*/
/* Preparing argument false */
/* line number 13*/
/* Loading false to %o2 */
    set         0, %o2
    call    foo
    nop
/* line number 13*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* line number 13*/
/* Printing bool foo() */
/* line number 13*/
/* Loading foo() to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 13*/
/* Done printing bool. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
