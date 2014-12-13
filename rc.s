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
/* line number 6*/
/* setting a = false */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 6*/
/* Done. */
/* line number 7*/
/* setting b = true */
    set         1, %l0
    st          %l0, [%fp-12]
/* line number 7*/
/* Done. */
/* line number 8*/
/* setting c = false */
    set         0, %l0
    st          %l0, [%fp-16]
/* line number 8*/
/* Done. */
/* line number 10*/
/* setting d = true */
    set         1, %l0
    st          %l0, [%fp-20]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Short-circuiting || with a */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     _orOp0
    nop
/* line number 10*/
/* Short-circuiting || with b */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     _orOp0
    nop
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* ||-ing */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     _orOp0
    nop
    set         0, %l2
    ba      _orOp1
    nop
_orOp0:
    set         1, %l2
    ba      _orOp1
    nop
_orOp1:
/* line number 10*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 10*/
/* Short-circuiting || with Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    bne     _orOp2
    nop
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* ||-ing */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     _orOp2
    nop
    set         0, %l2
    ba      _orOp3
    nop
_orOp2:
    set         1, %l2
    ba      _orOp3
    nop
_orOp3:
/* line number 10*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* ||-ing */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    cmp         %l2, %g0
    bne     _orOp4
    nop
    set         0, %l2
    ba      _orOp5
    nop
_orOp4:
    set         1, %l2
    ba      _orOp5
    nop
_orOp5:
/* line number 10*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 10*/
/* Printing bool Validating BooleanOpbool and bool as a BooleanType for operator: ||...
 */
    set         -32, %l1
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
/* line number 10*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
