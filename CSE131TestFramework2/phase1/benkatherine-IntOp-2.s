! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,a,b,z
x:              .word        5           
y:              .word        6           
a:              .word        3           
b:              .word        4           
z:              .word        30          
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
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
/* line number 7*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 7*/
/* Loading 6 to %l1 */
    set         6, %l1
/* line number 7*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 7*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 5 to %l0 */
    set         5, %l0
/* line number 11*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 11*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 11*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading Arithmetic Op to %l0 */
    set         25, %l0
/* line number 11*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 11*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 11*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
! --storing constant x with value 125.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         125, %l1
    st          %l1, [%l0]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading 6 to %l0 */
    set         6, %l0
/* line number 12*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 12*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 12*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
! --storing constant y with value 30.0
    set         y, %l0
    add         %g0, %l0, %l0
    set         30, %l1
    st          %l1, [%l0]
/* line number 14*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 14*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 15*/
/* Loading y to %o1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading 1 to %l0 */
    set         1, %l0
/* line number 16*/
/* Loading 4 to %l1 */
    set         4, %l1
/* line number 16*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 16*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 16*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 17*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 17*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 17*/
/* Printing int int * int */
    set         _intFmt, %o0
/* line number 17*/
/* Loading int * int to %o1 */
    set         -24, %l1
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
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 18*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 18*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 18*/
/* Printing int int / int */
    set         _intFmt, %o0
/* line number 18*/
/* Loading int / int to %o1 */
    set         -28, %l1
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
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 19*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 19*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading int / int to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 19*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 19*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading int * int to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 19*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 19*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 19*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 19*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 19*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -40, %l1
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
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading a to %l0 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading b to %l1 */
    set         b, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 20*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 20*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading int * int to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Loading a to %l1 */
    set         a, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 20*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 20*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 20*/
/* Printing int int * int */
    set         _intFmt, %o0
/* line number 20*/
/* Loading int * int to %o1 */
    set         -48, %l1
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
SAVE.main = -(92 + 48) & -8
