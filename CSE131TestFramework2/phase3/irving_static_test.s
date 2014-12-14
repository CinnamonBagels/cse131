! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,b,ptr
main_z:         .single      0r0.0       
float_0:        .single      0r3.12      
x:              .word        4           
y:              .word        0           
staticGuard_y:    .word        0           
recurse_y:      .word        0           
staticGuard_recurse_y:    .word        0           
staticGuard_main_z:    .word        0           
staticGuard_main_ptr:    .word        0           
main_y:         .word        0           
staticGuard_main_y:    .word        0           
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
b:              .skip        4           

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
                .global      recurse
recurse:
    set         SAVE.recurse, %g1
    save        %sp, %g1, %sp
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         staticGuard_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_y:
    set         staticGuard_recurse_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_recurse_y
    nop
    set         staticGuard_recurse_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_recurse_y:
    set         staticGuard_main_z, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_z
    nop
    set         staticGuard_main_z, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_z:
    set         staticGuard_main_ptr, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_ptr
    nop
    set         staticGuard_main_ptr, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_ptr:
    set         staticGuard_main_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_y
    nop
    set         staticGuard_main_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_y:
/* line number 5*/
/* Storing parameter x */
    st          %i0, [%fp+68]
! --storing constant y with value 3.0
    set         recurse_y, %l0
    add         %g0, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 7*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 7*/
/* Loading y to %o1 */
    set         recurse_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 7*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Prepping Comparison Calculations by loading */
/* line number 9*/
/* Loading y to %l0 */
    set         recurse_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 9*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 9*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 10*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 11*/
/* Incrementing */
/* line number 11*/
/* Loading y to %l0 */
    set         recurse_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         recurse_y, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 11*/
/* Post Increment */
    dec     %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Preparing argument y */
/* line number 12*/
/* Loading y to %o0 */
    set         recurse_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
    call    recurse
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
recurse_end:
    ret 
    restore
SAVE.recurse = -(92 + 12) & -8
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
/* line number 2*/
/* Prepping Arithmetic Calculations by loading */
/* line number 2*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 2*/
/* Loading 7 to %l1 */
    set         7, %l1
/* line number 2*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 2*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 4*/
/* Storing variable int + int into y */
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 22*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 22*/
/* Loading y to %o1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 22*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 24*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 24*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 24*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* setting y = int + int */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 25*/
/* Done. */
! --storing constant z with value 3.12
    set         main_z, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* getting address of y */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 28*/
/* Storing variable &y into ptr */
    set         main_ptr, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* getting address of y */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 29*/
/* Storing variable &y into b */
    set         b, %l5
    add         %g0, %l5, %l5
    set         -24, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 31*/
/* Dereferencing ptr */
    set         main_ptr, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 31*/
/* Printing int *ptr */
    set         _intFmt, %o0
/* line number 31*/
/* Loading *ptr to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Dereferencing b */
    set         b, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 32*/
/* Printing int *b */
    set         _intFmt, %o0
/* line number 32*/
/* Loading *b to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 33*/
/* Loading y to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 33*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* Prepping Arithmetic Calculations by loading */
/* line number 36*/
/* Loading y to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 36*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 36*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 36*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 37*/
/* Storing variable int + int into y */
    set         main_y, %l5
    add         %g0, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 37*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 37*/
/* Loading y to %o1 */
    set         main_y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 37*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 40*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 40*/
/* Loading y to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 40*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* printing float STO.VarSTO@1a0c382 */
/* line number 41*/
/* Loading z to %f0 */
    set         main_z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 41*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 43*/
/* Preparing argument 0 */
/* line number 43*/
/* Loading 0 to %o0 */
    set         0, %o0
    call    recurse
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
