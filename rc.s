! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     food,bed
float_0:        .single      0r88.43     
float_1:        .single      0r22.31     
float_2:        .single      0r11.55     
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
food:           .skip        12          

bed:            .skip        12          


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
! --storing constant a with value 88.43
    set         -8, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant b with value 22.31
    set         -4, %l0
    add         %fp, %l0, %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant c with value 11.55
    set         -12, %l0
    add         %fp, %l0, %l0
    set         float_2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 25*/
/* Assigning struct food to food1 */
    set         food, %o1
    add         %g0, %o1, %o1
    set         -16, %o0
    add         %fp, %o0, %o0
    set         12, %o2
    call    memcpy
    nop
/* line number 26*/
/* Assigning struct food1 to food2 */
    set         -16, %o1
    add         %fp, %o1, %o1
    set         -28, %o0
    add         %fp, %o0, %o0
    set         12, %o2
    call    memcpy
    nop
/* line number 27*/
/* Assigning struct food2 to food3 */
    set         -28, %o1
    add         %fp, %o1, %o1
    set         -40, %o0
    add         %fp, %o0, %o0
    set         12, %o2
    call    memcpy
    nop
/* line number 29*/
/* printing float STO.VarSTO@269997 */
/* line number 29*/
/* Loading a to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* printing float STO.VarSTO@2db19d */
/* line number 30*/
/* Loading b to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 30*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* printing float STO.VarSTO@1e7c5cb */
/* line number 31*/
/* Loading c to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 31*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 40) & -8
