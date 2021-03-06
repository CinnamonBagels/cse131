! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z
z:              .single      0r1.23      
float_2:        .single      0r112233.44 
x:              .word        55          
y:              .word        0           
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
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
    st          %i0, [%fp+68]
/* line number 7*/
/* Storing parameter y */
    st          %i1, [%fp+72]
/* line number 7*/
/* Storing parameter z */
    st          %f2, [%fp+76]
/* line number 8*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 8*/
/* Loading x to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* Printing bool y */
/* line number 8*/
/* Loading y to %l0 */
    set         72, %l1
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
/* line number 8*/
/* Done printing bool. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing float STO.VarSTO@110c2e8 */
/* line number 8*/
/* Loading z to %f0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
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
/* setting a = 922 */
    set         922, %l0
    st          %l0, [%fp-8]
/* line number 13*/
/* Done. */
/* line number 14*/
/* setting b = true */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 14*/
/* Done. */
/* line number 16*/
/* setting c = 112233.44 */
    set         -16, %l0
    add         %fp, %l0, %l0
/* line number 16*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Preparing argument a */
/* line number 16*/
/* Loading a to %o0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 16*/
/* Preparing argument b */
/* line number 16*/
/* Loading b to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* line number 16*/
/* Preparing argument c */
/* line number 16*/
/* Loading c to %f2 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f2
    call    foo
    nop
/* line number 18*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 18*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Printing bool y */
/* line number 18*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
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
/* line number 18*/
/* Done printing bool. */
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* printing float STO.VarSTO@6d234c */
/* line number 18*/
/* Loading z to %f0 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 18*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
