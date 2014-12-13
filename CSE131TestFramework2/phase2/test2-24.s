! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .single      0r1.55      
y:              .single      0r20.88     
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
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
/* line number 6*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 6*/
/* Storing parameter y */
    st          %f1, [%fp+72]
/* line number 7*/
/* Incrementing */
/* line number 7*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 8*/
/* Incrementing */
/* line number 8*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 11*/
/* Storing parameter x */
    st          %f0, [%fp+68]
/* line number 11*/
/* Storing parameter y */
    st          %i1, [%fp+72]
/* line number 12*/
/* Incrementing */
/* line number 12*/
/* Loading x to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         68, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 13*/
/* Incrementing */
/* line number 13*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 12) & -8
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
/* line number 17*/
/* printing float STO.VarSTO@68bd43 */
/* line number 17*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* printing float STO.VarSTO@adb165 */
/* line number 17*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Preparing argument x */
    set         x, %l0
    add         %g0, %l0, %l0
    mov         %l0, %o0
/* line number 18*/
/* Preparing argument y */
/* line number 18*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    call    foo
    nop
/* line number 19*/
/* printing float STO.VarSTO@68bd43 */
/* line number 19*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* printing float STO.VarSTO@adb165 */
/* line number 19*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Preparing argument x */
/* line number 20*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Preparing argument y */
    set         y, %l0
    add         %g0, %l0, %l0
    mov         %l0, %o1
    call    foo2
    nop
/* line number 21*/
/* printing float STO.VarSTO@68bd43 */
/* line number 21*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* printing float STO.VarSTO@adb165 */
/* line number 21*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
