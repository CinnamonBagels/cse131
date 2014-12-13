! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z
x:              .word        5           
y:              .word        10          
z:              .word        5000        
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
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
/* line number 7*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 7*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 7*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 7*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 8*/
/* setting sinatra = Validating int and int as an IntegerType for operator: %...
 */
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
/* Loading z to %l0 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 8*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading int * int to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading z to %l1 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 8*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
/* line number 8*/
/* Loading int - int to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 8*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 8*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* setting fitzgerald = Validating int and int as an IntegerType for operator: %...
 */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 9*/
/* Done. */
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading int * int to %l0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading z to %l1 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading int * int to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading z to %l1 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading int * int to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading int * int to %l1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 9*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading int + int to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 10 to %l1 */
    set         10, %l1
/* line number 9*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 9*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 9*/
/* Loading 5 to %l1 */
    set         5, %l1
/* line number 9*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 9*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 11*/
/* setting bono = int + int */
    set         -60, %l0
    add         %fp, %l0, %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Printing int sinatra */
    set         _intFmt, %o0
/* line number 11*/
/* Loading sinatra to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int fitzgerald */
    set         _intFmt, %o0
/* line number 12*/
/* Loading fitzgerald to %o1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Printing int bono */
    set         _intFmt, %o0
/* line number 13*/
/* Loading bono to %o1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 60) & -8
