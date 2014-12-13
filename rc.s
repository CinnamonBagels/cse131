! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "should be printed 1"
str_1:          .asciz       "should be printed 2"
str_2:          .asciz       "should be printed 3"
str_3:          .asciz       "should be printed 4"
str_4:          .asciz       "tinafey counter: "
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
/* line number 5*/
/* setting tinafey = 5 */
    set         5, %l0
    st          %l0, [%fp-8]
/* line number 5*/
/* Done. */
while_0:
/* line number 5*/
/* Prepping Comparison Calculations by loading */
/* line number 5*/
/* Loading tinafey to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Loading 10 to %l1 */
    set         10, %l1
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
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_1:
/* line number 9*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      whileEnd_1
    nop
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_2:
/* line number 12*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      whileEnd_2
    nop
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
while_3:
/* line number 15*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      whileEnd_3
    nop
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Breaking out of while loop */
    ba      whileEnd_3
    nop
    ba      while_3
    nop
whileEnd_3:
/* line number 20*/
/* Breaking out of while loop */
    ba      whileEnd_3
    nop
    ba      while_2
    nop
whileEnd_2:
/* line number 22*/
/* Breaking out of while loop */
    ba      whileEnd_3
    nop
    ba      while_1
    nop
whileEnd_1:
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Printing int tinafey */
    set         _intFmt, %o0
/* line number 23*/
/* Loading tinafey to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 23*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* Incrementing */
/* line number 24*/
/* Loading tinafey to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 24*/
/* Post Increment */
    dec     %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
    ba      while_0
    nop
whileEnd_0:
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
