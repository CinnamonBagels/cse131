! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .word        0           
y:              .word        0           
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
    st          %i1, [%fp+72]
! --storing constant x with value 1.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant y with value 1.0
    set         72, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 11*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 11*/
/* Storing parameter y */
    st          %i1, [%fp+72]
! --storing constant x with value 1.0
    set         68, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant y with value 1.0
    set         72, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 4) & -8
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
/* Printing bool x */
/* line number 17*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
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
/* line number 17*/
/* Done printing bool. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing bool y */
/* line number 17*/
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Preparing argument x */
    set         x, %o0
    add         %g0, %o0, %o0
/* line number 18*/
/* Preparing argument y */
/* line number 18*/
/* Loading y to %o1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    foo
    nop
/* line number 19*/
/* Printing bool x */
/* line number 19*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 19*/
/* Done printing bool. */
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Printing bool y */
/* line number 19*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_3
    nop
printTrue_3:
    set         _boolT, %o1
    ba      branchEnd_3
    nop
printFalse_3:
    set         _boolF, %o1
branchEnd_3:
    call    printf
    nop
/* line number 19*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Preparing argument x */
/* line number 20*/
/* Loading x to %o0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
/* line number 20*/
/* Preparing argument y */
    set         y, %o1
    add         %g0, %o1, %o1
    call    foo2
    nop
/* line number 21*/
/* Printing bool x */
/* line number 21*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_4
    nop
printTrue_4:
    set         _boolT, %o1
    ba      branchEnd_4
    nop
printFalse_4:
    set         _boolF, %o1
branchEnd_4:
    call    printf
    nop
/* line number 21*/
/* Done printing bool. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Printing bool y */
/* line number 21*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_5
    nop
printTrue_5:
    set         _boolT, %o1
    ba      branchEnd_5
    nop
printFalse_5:
    set         _boolF, %o1
branchEnd_5:
    call    printf
    nop
/* line number 21*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
