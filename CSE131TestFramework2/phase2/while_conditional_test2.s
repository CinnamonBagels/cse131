! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "Hello y"   
str_1:          .asciz       "Hello x"   
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
/* setting x = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 4*/
/* Done. */
/* line number 5*/
/* setting y = 5 */
    set         5, %l0
    st          %l0, [%fp-12]
/* line number 5*/
/* Done. */
while_0:
/* line number 5*/
/* Prepping Comparison Calculations by loading */
/* line number 5*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 5*/
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
/* line number 5*/
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
while_1:
/* line number 7*/
/* Prepping Comparison Calculations by loading */
/* line number 7*/
/* Loading y to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 7*/
/* Loading 15 to %l1 */
    set         15, %l1
/* line number 7*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 7*/
/* Storing result of Comparison Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* Incrementing */
/* line number 10*/
/* Loading y to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 10*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_1
    nop
whileEnd_1:
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Incrementing */
/* line number 13*/
/* Loading x to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 13*/
/* Post Increment */
    dec     %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
main_end:
    ret 
    restore
SAVE.main = -(92 + 28) & -8
