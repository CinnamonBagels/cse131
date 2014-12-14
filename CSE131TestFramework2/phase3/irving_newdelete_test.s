! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     q,ptr
q:              .word        0           
str_0:          .asciz       "Never seen."
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
ptr:            .skip        4           


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
/* line number 12*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 14*/
/* Returning value from foo */
/* line number 14*/
/* Loading x to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 17*/
/* Storing parameter y */
    st          %i0, [%fp+68]
/* line number 20*/
/* Returning value from bar */
/* line number 20*/
/* Loading x to %i0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      bar_end
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      bar2
bar2:
    set         SAVE.bar2, %g1
    save        %sp, %g1, %sp
/* line number 23*/
/* Storing parameter y */
    st          %i0, [%fp+68]
/* line number 26*/
/* Returning value from bar2 */
/* line number 26*/
/* Loading x to %i0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      bar2_end
    nop
bar2_end:
    ret 
    restore
SAVE.bar2 = -(92 + 8) & -8
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
/* line number 35*/
/* Prepping Arithmetic Calculations by loading */
/* line number 35*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 35*/
/* Loading y to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 35*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 35*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 36*/
/* setting z = int + int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 36*/
/* Done. */
/* line number 40*/
/* Allocating for new x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -32, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 40*/
/* Dereferencing x */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *x with value 5.0
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 41*/
/* Dereferencing x */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 41*/
/* Storing variable *x into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -40, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 43*/
/* Dereferencing x */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Printing int *x */
    set         _intFmt, %o0
/* line number 43*/
/* Loading *x to %o1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 44*/
/* Loading y to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 48*/
/* Deallocating for delete x */
    set         -32, %o0
    add         %fp, %o0, %o0
    call    free
    nop
/* line number 48*/
/* Storing variable 0 into x */
    set         -32, %l5
    add         %fp, %l5, %l5
    set         0, %l3
    st          %l3, [%l5]
/* line number 48*/
/* printf on int */
    set         _intFmt, %o0
    set         144, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 49*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 53*/
/* Allocating for new struct */
    set         1, %o0
    set         144, %o1
    call    calloc
    nop
    set         -48, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 53*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -192, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant x with value 3.0
    set         -144, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 54*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -336, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant z with value 1.0
    set         -136, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 55*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -480, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Storing variable x into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -144, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 57*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -624, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Loading z to %l0 */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 59*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -768, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 59*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 59*/
/* Loading x to %o1 */
    set         -144, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 59*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 60*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 60*/
/* Loading y to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 60*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 63*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -912, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 65*/
/* Allocating for new recursive */
    set         1, %o0
    set         144, %o1
    call    calloc
    nop
    set         -916, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 65*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1060, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 65*/
/* Dereferencing recursive */
    set         -916, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1204, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant x with value 53.0
    set         -144, %l0
    add         %fp, %l0, %l0
    set         53, %l1
    st          %l1, [%l0]
/* line number 67*/
/* Dereferencing struct */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1348, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 67*/
/* Dereferencing recursive */
    set         -916, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1492, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 67*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 67*/
/* Loading x to %o1 */
    set         -144, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 67*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 71*/
/* Allocating for new aa */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -1496, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 71*/
/* Dereferencing aa */
    set         -1496, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1500, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 73*/
/* Allocating for new *aa */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -1504, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    st          %o0, [%l0]
/* line number 73*/
/* Dereferencing aa */
    set         -1496, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1508, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 73*/
/* Dereferencing *aa */
    set         -1508, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -1512, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant **aa with value 1.0
    set         -1512, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 74*/
/* Dereferencing aa */
    set         -1496, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -1516, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Dereferencing *aa */
    set         -1516, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -1520, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Printing bool **aa */
/* line number 74*/
/* Loading **aa to %l0 */
    set         -1520, %l1
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
/* line number 74*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 83*/
/* Deallocating for delete x */
    set         -32, %o0
    add         %fp, %o0, %o0
    call    free
    nop
/* line number 83*/
/* Storing variable 0 into x */
    set         -32, %l5
    add         %fp, %l5, %l5
    set         0, %l3
    st          %l3, [%l5]
/* line number 83*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 83*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 1520) & -8
