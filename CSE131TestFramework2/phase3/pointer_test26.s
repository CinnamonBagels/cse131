! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     cub,bad,good
bad:            .word        0           
good:           .word        0           
str_0:          .asciz       "cub is: "  
str_1:          .asciz       "cub is now: "
str_2:          .asciz       "hyper is: "
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
cub:            .skip        4           


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
/* line number 11*/
/* Storing parameter param */
    st          %i0, [%fp+68]
/* getting address of good */
    set         good, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Storing variable &good into param */
    set         68, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 14*/
/* Returning value from foo */
/* line number 14*/
/* Loading param to %i0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 8) & -8
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
/* getting address of bad */
    set         bad, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Storing variable &bad into good */
    set         good, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 19*/
/* setting cool = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 19*/
/* Done. */
/* getting address of cool */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* initializing pointer lol with the value of &cool */
/* line number 21*/
/* Loading &cool to %o0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 21*/
/* Storing value of register %o0 into lol */
    st          %o0, [%fp-16]
/* getting address of lol */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* Storing variable &lol into cub */
    set         cub, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Dereferencing cub */
    set         cub, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Dereferencing *cub */
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Printing bool **cub */
/* line number 23*/
/* Loading **cub to %l0 */
    set         -28, %l1
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
/* line number 23*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* Preparing argument cub */
    set         cub, %l0
    add         %g0, %l0, %l0
    mov         %l0, %o0
    call    foo
    nop
/* line number 25*/
/* Saving return value on to stack */
    st          %o0, [%fp+-32]
/* initializing pointer hyper with the value of foo() */
/* line number 27*/
/* Loading foo() to %o0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
/* line number 27*/
/* Storing value of register %o0 into hyper */
    st          %o0, [%fp-36]
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Dereferencing cub */
    set         cub, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Dereferencing *cub */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 27*/
/* Printing bool **cub */
/* line number 27*/
/* Loading **cub to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* Dereferencing hyper */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Dereferencing *hyper */
    set         -48, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Printing bool **hyper */
/* line number 28*/
/* Loading **hyper to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* line number 28*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 52) & -8
