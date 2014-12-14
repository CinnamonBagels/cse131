! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     c
main_z:         .single      0r0.0       
c:              .word        0           
staticGuard_main_z:    .word        0           
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
    set         staticGuard_main_z, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_z
    nop
    set         staticGuard_main_z, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_z:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 3*/
/* Prepping Comparison Calculations by loading */
/* line number 3*/
/* Loading c to %l0 */
    set         c, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 3*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 3*/
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
/* line number 3*/
/* Storing result of Comparison Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 3*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 5*/
/* setting y = 4 */
    set         4, %l0
    st          %l0, [%fp-12]
/* line number 5*/
/* Done. */
/* line number 6*/
/* Storing variable y into z */
    set         main_z, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 6*/
/* Incrementing */
/* line number 6*/
/* Loading y to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 6*/
/* Post Increment */
    dec     %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 7*/
/* Incrementing */
/* line number 7*/
/* Loading z to %f0 */
    set         main_z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         main_z, %l1
    add         %g0, %l1, %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 8*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 8*/
/* Loading y to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* printing float STO.VarSTO@d90727 */
/* line number 9*/
/* Loading z to %f0 */
    set         main_z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 9*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Incrementing */
/* line number 10*/
/* Loading c to %l0 */
    set         c, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         c, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 10*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    call    main
    nop
    ba      endIf_1
    nop
else_0:
    ba      main_end
    nop
endIf_1:
main_end:
    ret 
    restore
SAVE.main = -(92 + 24) & -8
