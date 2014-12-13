! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y,z
x:              .word        4           
y:              .word        5           
z:              .word        6           
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
/* line number 10*/
/* setting x = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 10*/
/* Done. */
/* line number 11*/
/* setting y = 2 */
    set         2, %l0
    st          %l0, [%fp-12]
/* line number 11*/
/* Done. */
/* line number 12*/
/* setting z = 3 */
    set         3, %l0
    st          %l0, [%fp-16]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 12*/
/* Loading x to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 12*/
/* Loading y to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int z */
    set         _intFmt, %o0
/* line number 12*/
/* Loading z to %o1 */
    set         -16, %l1
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
/* Printing int x */
    set         _intFmt, %o0
/* line number 13*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Printing int y */
    set         _intFmt, %o0
/* line number 13*/
/* Loading y to %o1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 13*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* Printing int z */
    set         _intFmt, %o0
/* line number 13*/
/* Loading z to %o1 */
    set         z, %l1
    add         %g0, %l1, %l1
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
SAVE.main = -(92 + 16) & -8
