! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     k,j
k:              .word        3           
j:              .word        0           
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
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
/* line number 4*/
/* Prepping Arithmetic Calculations by loading */
/* line number 4*/
/* Loading k to %l0 */
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 4*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 4*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 4*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Storing variable int + int into j */
    set         j, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
/* line number 7*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 7*/
/* Loading j to %l1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 7*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 7*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* setting l = int + int */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading 3 to %l0 */
    set         3, %l0
/* line number 8*/
/* Loading l to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* setting m = int + int */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 10*/
/* setting n = k */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading n to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading 3 to %l1 */
    set         3, %l1
/* line number 10*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 10*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 12*/
/* setting o = int + int */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Printing int k */
    set         _intFmt, %o0
/* line number 12*/
/* Loading k to %o1 */
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int j */
    set         _intFmt, %o0
/* line number 12*/
/* Loading j to %o1 */
    set         j, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int l */
    set         _intFmt, %o0
/* line number 12*/
/* Loading l to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int m */
    set         _intFmt, %o0
/* line number 12*/
/* Loading m to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int n */
    set         _intFmt, %o0
/* line number 12*/
/* Loading n to %o1 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int o */
    set         _intFmt, %o0
/* line number 12*/
/* Loading o to %o1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 32) & -8
