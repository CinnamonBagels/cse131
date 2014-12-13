! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z
x:              .word        0           
y:              .word        0           
z:              .word        0           
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
/* setting localX = 3 */
    set         3, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
/* line number 9*/
/* setting localY = 6 */
    set         6, %l0
    st          %l0, [%fp-12]
/* line number 9*/
/* Done. */
/* line number 10*/
/* setting localZ = 9 */
    set         9, %l0
    st          %l0, [%fp-16]
/* line number 10*/
/* Done. */
/* line number 12*/
/* setting localA = 12 */
    set         12, %l0
    st          %l0, [%fp-20]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading localX to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading localY to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 12*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading int * int to %l0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Loading localZ to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 12*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 12*/
/* Storing variable int * int into x */
    set         x, %l5
    add         %g0, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
/* line number 13*/
/* Loading localZ to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading localX to %l1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* line number 13*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 13*/
/* Prepping Arithmetic Calculations by loading */
/* line number 13*/
/* Loading localY to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 13*/
/* Loading int / int to %l1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 13*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 13*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 13*/
/* Storing variable int + int into y */
    set         y, %l5
    add         %g0, %l5, %l5
    set         -36, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading y to %l0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading localZ to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading localA to %l0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading y to %l1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 14*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading int - int to %l0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading int * int to %l1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading int - int to %l0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 14*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 14*/
/* Loading int + int to %l1 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 14*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 14*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 14*/
/* Storing variable int * int into z */
    set         z, %l5
    add         %g0, %l5, %l5
    set         -56, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 16*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 16*/
/* Loading x to %o1 */
    set         x, %l1
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
/* Printing int y */
    set         _intFmt, %o0
/* line number 17*/
/* Loading y to %o1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Printing int z */
    set         _intFmt, %o0
/* line number 18*/
/* Loading z to %o1 */
    set         z, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 56) & -8
