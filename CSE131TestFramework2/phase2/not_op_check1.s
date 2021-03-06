! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
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
/* line number 4*/
/* setting a = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 4*/
/* Negating */
/* line number 4*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_0
    nop
decrement_0:
    dec     %l0
    ba      negEnd_0
    nop
increment_0:
    inc     %l0
negEnd_0:
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 5*/
/* setting b = Validating UnaryOp a as a BooleanType for operator: !...
 */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 5*/
/* Done. */
/* line number 7*/
/* setting c = b */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 7*/
/* Done. */
/* line number 7*/
/* Printing bool a */
/* line number 7*/
/* Loading a to %l0 */
    set         -8, %l1
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
/* line number 7*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* Printing bool b */
/* line number 8*/
/* Loading b to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
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
/* line number 8*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Printing bool c */
/* line number 9*/
/* Loading c to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
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
/* line number 9*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Negating */
/* line number 10*/
/* Loading b to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_1
    nop
decrement_1:
    dec     %l0
    ba      negEnd_1
    nop
increment_1:
    inc     %l0
negEnd_1:
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Printing bool Validating UnaryOp b as a BooleanType for operator: !...
 */
/* line number 10*/
/* Loading Validating UnaryOp b as a BooleanType for operator: !...
 to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* Negating */
/* line number 11*/
/* Loading c to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_2
    nop
decrement_2:
    dec     %l0
    ba      negEnd_2
    nop
increment_2:
    inc     %l0
negEnd_2:
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 11*/
/* Printing bool Validating UnaryOp c as a BooleanType for operator: !...
 */
/* line number 11*/
/* Loading Validating UnaryOp c as a BooleanType for operator: !...
 to %l0 */
    set         -28, %l1
    add         %fp, %l1, %l1
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
/* line number 11*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Negating */
/* line number 12*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      increment_3
    nop
decrement_3:
    dec     %l0
    ba      negEnd_3
    nop
increment_3:
    inc     %l0
negEnd_3:
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 12*/
/* Printing bool Validating UnaryOp a as a BooleanType for operator: !...
 */
/* line number 12*/
/* Loading Validating UnaryOp a as a BooleanType for operator: !...
 to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
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
/* line number 12*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
