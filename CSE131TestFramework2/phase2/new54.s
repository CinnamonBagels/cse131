! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z,a
y:              .single      0r4.44      
float_4:        .single      0r5.55      
x:              .word        3           
z:              .word        1           
a:              .word        0           
str_0:          .asciz       "foo1"      
str_1:          .asciz       "foo2"      
str_2:          .asciz       "foo3"      
str_3:          .asciz       "main"      
str_5:          .asciz       "end"       
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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
/* line number 8*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 11*/
/* Returning value from foo1 */
/* line number 11*/
/* Loading a to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo1_end
    nop
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 14*/
/* Storing parameter y */
    st          %f0, [%fp+68]
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 17*/
/* Returning value from foo2 */
/* line number 17*/
/* Loading y to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    ba      foo2_end
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo3
foo3:
    set         SAVE.foo3, %g1
    save        %sp, %g1, %sp
/* line number 20*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 23*/
/* Returning value from foo3 */
/* line number 23*/
/* Loading a to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo3_end
    nop
foo3_end:
    ret 
    restore
SAVE.foo3 = -(92 + 4) & -8
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
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Preparing argument 5 */
/* line number 27*/
/* Loading 5 to %o0 */
    set         5, %o0
    call    foo1
    nop
/* line number 27*/
/* Saving return value on to stack */
    st          %o0, [%fp+-8]
/* line number 27*/
/* Printing int foo1() */
    set         _intFmt, %o0
/* line number 27*/
/* Loading foo1() to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
/* line number 27*/
/* Preparing argument 5.55 */
/* line number 27*/
/* Loading 5.55 to %f0 */
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    call    foo2
    nop
/* line number 27*/
/* Saving return value on to stack */
    st          %f0, [%fp+-12]
/* line number 27*/
/* printing float STO.VarSTO@1a0c382 */
/* line number 27*/
/* Loading foo2() to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 27*/
/* Done printing float. */
/* line number 27*/
/* Preparing argument false */
/* line number 27*/
/* Loading false to %o0 */
    set         0, %o0
    call    foo3
    nop
/* line number 27*/
/* Saving return value on to stack */
    st          %o0, [%fp+-16]
/* line number 27*/
/* Printing bool foo3() */
/* line number 27*/
/* Loading foo3() to %l0 */
    set         -16, %l1
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
/* line number 27*/
/* Done printing bool. */
/* line number 27*/
/* Preparing argument true */
/* line number 27*/
/* Loading true to %o0 */
    set         1, %o0
    call    foo3
    nop
/* line number 27*/
/* Saving return value on to stack */
    st          %o0, [%fp+-20]
/* line number 27*/
/* Printing bool foo3() */
/* line number 27*/
/* Loading foo3() to %l0 */
    set         -20, %l1
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
/* line number 27*/
/* Done printing bool. */
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
