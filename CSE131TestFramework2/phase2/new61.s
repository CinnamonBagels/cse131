! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z,a
y:              .single      0r4.44      
float_1:        .single      0r5.55      
x:              .word        3           
z:              .word        1           
a:              .word        0           
str_0:          .asciz       "foo"       
str_2:          .asciz       "main"      
str_3:          .asciz       "end"       
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
/* line number 8*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 8*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 8*/
/* Storing parameter z */
    st          %i2, [%fp+76]
/* line number 8*/
/* Storing parameter a */
    st          %i3, [%fp+80]
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 9*/
/* Loading x to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 9*/
/* Done printing int. */
/* line number 9*/
/* printing float STO.VarSTO@132e233 */
/* line number 9*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 9*/
/* Done printing float. */
/* line number 9*/
/* Printing bool z */
/* line number 9*/
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
/* line number 9*/
/* Done printing bool. */
/* line number 9*/
/* Printing bool a */
/* line number 9*/
/* Loading a to %l0 */
    set         80, %l1
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
/* line number 9*/
/* Done printing bool. */
/* line number 11*/
/* Returning value from foo */
/* line number 11*/
/* Loading 5.55 to %f0 */
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
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
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Preparing argument x */
/* line number 15*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 15*/
/* Preparing argument y */
/* line number 15*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* line number 15*/
/* Preparing argument z */
/* line number 15*/
/* Loading z to %o2 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o2
/* line number 15*/
/* Preparing argument a */
/* line number 15*/
/* Loading a to %o3 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o3
    call    foo
    nop
/* line number 15*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 15*/
/* Preparing argument x */
/* line number 15*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 15*/
/* Preparing argument foo() */
/* line number 15*/
/* Loading foo() to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
/* line number 15*/
/* Preparing argument z */
/* line number 15*/
/* Loading z to %o2 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o2
/* line number 15*/
/* Preparing argument a */
/* line number 15*/
/* Loading a to %o3 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o3
    call    foo
    nop
/* line number 15*/
/* Saving return value on to stack */
    st          %f0, [%fp+-12]
/* line number 15*/
/* printing float STO.VarSTO@1a0c382 */
/* line number 15*/
/* Loading foo() to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
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
SAVE.main = -(92 + 12) & -8
