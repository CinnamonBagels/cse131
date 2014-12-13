! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     a,b,c
a:              .word        0           
b:              .word        1           
c:              .word        0           
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
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 4*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 4*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 4*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 6*/
/* Storing variable Validating BitwiseOp int and int as an IntegerType for operator: ^...
 into c */
    set         c, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 8*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 9*/
/* setting d = Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 9*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 10*/
/* setting e = Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading d to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 10*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 10*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 10*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 12*/
/* setting f = Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 12*/
/* Done. */
/* line number 13*/
/* setting g = 1 */
    set         1, %l0
    st          %l0, [%fp-32]
/* line number 13*/
/* Done. */
/* line number 14*/
/* setting h = 1 */
    set         1, %l0
    st          %l0, [%fp-36]
/* line number 14*/
/* Done. */
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading g to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading h to %l1 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 14*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 16*/
/* setting i = Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         -44, %l0
    add         %fp, %l0, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Printing int c */
    set         _intFmt, %o0
/* line number 16*/
/* Loading c to %o1 */
    set         c, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 16*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Printing int d */
    set         _intFmt, %o0
/* line number 17*/
/* Loading d to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Printing int e */
    set         _intFmt, %o0
/* line number 18*/
/* Loading e to %o1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* Printing int f */
    set         _intFmt, %o0
/* line number 19*/
/* Loading f to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 20*/
/* Loading i to %o1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 44) & -8
