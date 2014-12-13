! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b
a:              .single      0r5.0       
b:              .single      0r0.0       
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
/* line number 8*/
/* setting c = b */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Incrementing */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         a, %l1
    add         %g0, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %f0, [%l1]
/* line number 8*/
/* Storing variable Validating UnaryOp a as a FloatType for operator: ++...
 into c */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %f0, [%l1]
/* line number 10*/
/* Incrementing */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         a, %l1
    add         %g0, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %f0, [%l1]
/* line number 10*/
/* Storing variable Validating UnaryOp a as a FloatType for operator: ++...
 into b */
    set         b, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 11*/
/* printing float STO.VarSTO@186f247 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printing float STO.VarSTO@10ab09f */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* printing float STO.VarSTO@8c4a77 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 13*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fsubs       %f0, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
    fadds       %f2, %f1, %f0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %f0, [%l1]
/* line number 14*/
/* printing float STO.ExprSTO@f30494 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* printing float STO.VarSTO@8c4a77 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 24) & -8
