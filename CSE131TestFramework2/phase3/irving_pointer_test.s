! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     q,ptr
q:              .word        0           
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
                .global      lots
lots:
    set         SAVE.lots, %g1
    save        %sp, %g1, %sp
/* line number 10*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 10*/
/* Storing parameter b */
    st          %i1, [%fp+72]
/* line number 10*/
/* Storing parameter c */
    st          %i2, [%fp+76]
/* getting address of a */
    set         68, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Returning value from lots */
/* line number 12*/
/* Loading &a to %i0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      lots_end
    nop
lots_end:
    ret 
    restore
SAVE.lots = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 15*/
/* Storing parameter x */
    st          %i0, [%fp+68]
/* line number 17*/
/* Returning value from foo */
/* line number 17*/
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
/* line number 20*/
/* Storing parameter y */
    st          %i0, [%fp+68]
/* line number 24*/
/* Allocating for new x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -12, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 24*/
/* Dereferencing x */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 24*/
/* Storing variable y into *x */
    set         -16, %l5
    add         %fp, %l5, %l5
    set         68, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 27*/
/* Returning value from bar */
/* line number 27*/
/* Loading x to %i0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      bar_end
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 16) & -8
                .section     ".text"
                .align 4
                .global      bar2
bar2:
    set         SAVE.bar2, %g1
    save        %sp, %g1, %sp
/* line number 30*/
/* Storing parameter y */
    st          %i0, [%fp+68]
/* line number 33*/
/* Allocating for new x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -12, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 33*/
/* Dereferencing x */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Allocating for new *x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    st          %o0, [%l0]
/* line number 34*/
/* Dereferencing x */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 34*/
/* Dereferencing *x */
    set         -24, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Allocating for new **x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    st          %o0, [%l0]
/* line number 36*/
/* Dereferencing x */
    set         -12, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Dereferencing *x */
    set         -36, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Dereferencing **x */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 36*/
/* Storing variable y into ***x */
    set         -44, %l5
    add         %fp, %l5, %l5
    set         68, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 38*/
/* Returning value from bar2 */
/* line number 38*/
/* Loading x to %i0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      bar2_end
    nop
bar2_end:
    ret 
    restore
SAVE.bar2 = -(92 + 44) & -8
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
/* line number 47*/
/* setting y = 5 */
    set         5, %l0
    st          %l0, [%fp-12]
/* line number 47*/
/* Done. */
/* line number 51*/
/* Allocating for new x */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -60, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 52*/
/* Allocating for new z */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -64, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 52*/
/* Dereferencing z */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Allocating for new *z */
    set         1, %o0
    set         4, %o1
    call    calloc
    nop
    set         -72, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    st          %o0, [%l0]
/* line number 54*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Storing variable *x into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -76, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 55*/
/* Dereferencing z */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -80, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Dereferencing *z */
    set         -80, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Storing variable **z into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -84, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 56*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *x with value 5.0
    set         -88, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 58*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Dereferencing z */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Dereferencing *z */
    set         -96, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -108, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Storing variable *x into *x */
    set         -104, %l5
    add         %fp, %l5, %l5
    set         -108, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 58*/
/* Storing variable *x into **z */
    set         -100, %l5
    add         %fp, %l5, %l5
    set         -104, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 58*/
/* Storing variable **z into *x */
    set         -92, %l5
    add         %fp, %l5, %l5
    set         -100, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 60*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -112, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 60*/
/* Printing int *x */
    set         _intFmt, %o0
/* line number 60*/
/* Loading *x to %o1 */
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 60*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 64*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -156, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 64*/
/* Starting array access */
/* line number 64*/
/* Loading *x to %l0 */
    set         -156, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -152, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -160, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
! --storing constant a[*x] with value 3.0
    set         -160, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 66*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -164, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 66*/
/* Preparing argument *x */
/* line number 66*/
/* Loading *x to %o0 */
    set         -164, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
    call    foo
    nop
/* line number 66*/
/* Saving return value on to stack */
    st          %o0, [%fp+-168]
/* line number 66*/
/* Starting array access */
/* line number 66*/
/* Loading foo() to %l0 */
    set         -168, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -152, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -172, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
! --storing constant a[foo()] with value 3.0
    set         -172, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 66*/
/* Printing int a[foo()] */
    set         _intFmt, %o0
/* line number 66*/
/* Loading a[foo()] to %o1 */
    set         -172, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 66*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 68*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -176, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 68*/
/* Preparing argument *x */
/* line number 68*/
/* Loading *x to %o0 */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
    call    bar
    nop
/* line number 68*/
/* Saving return value on to stack */
    st          %o0, [%fp+-180]
/* line number 68*/
/* Dereferencing bar() */
    set         -180, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -184, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 68*/
/* Storing variable *bar() into y */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         -184, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 70*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 70*/
/* Loading y to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 70*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 72*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -188, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 72*/
/* Preparing argument *x */
/* line number 72*/
/* Loading *x to %o0 */
    set         -188, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
    call    bar
    nop
/* line number 72*/
/* Saving return value on to stack */
    st          %o0, [%fp+-192]
/* line number 72*/
/* Dereferencing bar() */
    set         -192, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -196, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *bar() with value 3.0
    set         -196, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 72*/
/* Printing int *bar() */
    set         _intFmt, %o0
/* line number 72*/
/* Loading *bar() to %o1 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 72*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 74*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -200, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Preparing argument *x */
/* line number 74*/
/* Loading *x to %o0 */
    set         -200, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
    call    bar2
    nop
/* line number 74*/
/* Saving return value on to stack */
    st          %o0, [%fp+-204]
/* line number 74*/
/* Dereferencing bar2() */
    set         -204, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -208, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Dereferencing *bar2() */
    set         -208, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -212, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Dereferencing **bar2() */
    set         -212, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -216, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant ***bar2() with value 30.0
    set         -216, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         30, %l1
    st          %l1, [%l0]
/* line number 74*/
/* Printing int ***bar2() */
    set         _intFmt, %o0
/* line number 74*/
/* Loading ***bar2() to %o1 */
    set         -216, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 74*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 76*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -220, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *x with value 3.0
    set         -220, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 76*/
/* Starting array access */
/* line number 76*/
/* Loading *x to %l0 */
    set         -220, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 10
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         -152, %l1
    add         %fp, %l1, %l1
    add         %l1, %l2, %l4
    set         -224, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         10, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* line number 76*/
/* Preparing argument a[*x] */
/* line number 76*/
/* Loading a[*x] to %o0 */
    set         -224, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
    call    bar
    nop
/* line number 76*/
/* Saving return value on to stack */
    st          %o0, [%fp+-228]
/* line number 76*/
/* Dereferencing bar() */
    set         -228, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -232, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *bar() with value 90.0
    set         -232, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         90, %l1
    st          %l1, [%l0]
/* line number 76*/
/* Printing int *bar() */
    set         _intFmt, %o0
/* line number 76*/
/* Loading *bar() to %o1 */
    set         -232, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 76*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 81*/
/* Allocating for new ccc */
    set         1, %o0
    set         140, %o1
    call    calloc
    nop
    set         -240, %l0
    add         %fp, %l0, %l0
    st          %o0, [%l0]
/* line number 81*/
/* Dereferencing ccc */
    set         -240, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -380, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant x with value 42.0
    set         -140, %l0
    add         %fp, %l0, %l0
    set         42, %l1
    st          %l1, [%l0]
/* line number 82*/
/* Dereferencing ccc */
    set         -240, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -520, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 82*/
/* Dereferencing ccc */
    set         -240, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -660, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 82*/
/* Storing variable x into x */
    set         -140, %l5
    add         %fp, %l5, %l5
    set         -140, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 84*/
/* Dereferencing ccc */
    set         -240, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -800, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 84*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 84*/
/* Loading x to %o1 */
    set         -140, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 84*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 86*/
/* Incrementing */
/* line number 86*/
/* Loading x to %l0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -60, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 86*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -804, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 88*/
/* Incrementing */
/* line number 88*/
/* Loading ccc to %l0 */
    set         -240, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         4, %l6
    add         %l0, %l6, %l0
    set         -240, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 88*/
/* Post Increment */
    sub         %l0, %l6, %l0
    set         -808, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 90*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -812, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 90*/
/* Dereferencing z */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -816, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 90*/
/* Dereferencing *z */
    set         -816, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -820, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 90*/
/* Dereferencing x */
    set         -60, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -824, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 90*/
/* Preparing argument *x */
/* line number 90*/
/* Loading *x to %o0 */
    set         -812, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o0
/* line number 90*/
/* Preparing argument **z */
/* line number 90*/
/* Loading **z to %o1 */
    set         -820, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
/* line number 90*/
/* Preparing argument *x */
/* line number 90*/
/* Loading *x to %o2 */
    set         -824, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o2
    call    lots
    nop
/* line number 90*/
/* Saving return value on to stack */
    st          %o0, [%fp+-828]
/* line number 90*/
/* Dereferencing lots() */
    set         -828, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -832, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *lots() with value 3.0
    set         -832, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         3, %l1
    st          %l1, [%l0]
main_end:
    ret 
    restore
SAVE.main = -(92 + 832) & -8
