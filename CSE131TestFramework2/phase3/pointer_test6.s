! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     bell,cold
float_0:        .single      0r632.11    
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
bell:           .skip        4           

cold:           .skip        8           


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
/* line number 12*/
/* setting p = 632.11 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 12*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading 522 to %l0 */
    set         522, %l0
/* line number 12*/
/* Loading 44 to %l1 */
    set         44, %l1
/* line number 12*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 12*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
! --storing constant b with value 566.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         566, %l1
    st          %l1, [%l0]
/* line number 13*/
/* Storing variable p into r */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* getting address of cold */
    set         cold, %l0
    add         %g0, %l0, %l0
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Dereferencing &cold */
    set         -20, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&cold */
    set         -28, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Dereferencing &*&cold */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&*&cold */
    set         -40, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 16*/
/* Storing variable &*&*&cold into bell */
    set         bell, %l5
    add         %g0, %l5, %l5
    set         -44, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 18*/
/* Dereferencing bell */
    set         bell, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *bell */
    set         -52, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Dereferencing &*bell */
    set         -56, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* getting address of *&*bell */
    set         -64, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Storing variable &*&*bell into bong */
    set         -16, %l5
    add         %fp, %l5, %l5
    set         -68, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 20*/
/* Dereferencing bong */
    set         -16, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 20*/
/* Printing int b */
    set         _intFmt, %o0
/* line number 20*/
/* Loading b to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* Dereferencing bong */
    set         -16, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 21*/
/* printing float STO.VarSTO@a28815 */
/* line number 21*/
/* Loading r to %f0 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 84) & -8
