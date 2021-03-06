! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_2:        .single      0r135.24    
float_3:        .single      0r0.0       
str_0:          .asciz       " "         
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
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 3*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 3*/
/* Storing parameter y */
    st          %i1, [%fp+72]
/* line number 3*/
/* Storing parameter z */
    st          %i2, [%fp+76]
/* line number 4*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 4*/
/* Loading x to %o1 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 4*/
/* Done printing int. */
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* printing float STO.VarSTO@cab3bf */
/* line number 4*/
/* Loading y to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 4*/
/* Done printing float. */
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* Printing bool z */
/* line number 4*/
/* Loading z to %l0 */
    set         76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 4*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 4) & -8
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
    st          %i2, [%fp+76]
/* line number 8*/
/* Preparing argument x */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o0
/* line number 8*/
/* Preparing argument y */
    set         72, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o1
/* line number 8*/
/* Preparing argument z */
    set         76, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o2
    call    foo2
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
/* setting x = 77 */
    set         77, %l0
    st          %l0, [%fp-8]
/* line number 13*/
/* Done. */
/* line number 14*/
/* setting y = 135.24 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 14*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* Done. */
/* line number 16*/
/* setting b = true */
    set         1, %l0
    st          %l0, [%fp-16]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Preparing argument x */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
/* line number 16*/
/* Preparing argument y */
    set         -12, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o1
/* line number 16*/
/* Preparing argument b */
    set         -16, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o2
    call    foo
    nop
! --storing constant x with value 0.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
! --storing constant y with value 0.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         float_3, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant b with value 0.0
    set         -16, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 22*/
/* Preparing argument x */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
/* line number 22*/
/* Preparing argument y */
    set         -12, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o1
/* line number 22*/
/* Preparing argument b */
    set         -16, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o2
    call    foo
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
