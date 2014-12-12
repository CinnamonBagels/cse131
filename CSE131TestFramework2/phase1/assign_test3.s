! --globals--
                .section     ".data"
                .align 4
                 .global     f1,f2,f3
f1:             .single      0r0.0       
f2:             .single      0r0.0       
f3:             .single      0r0.0       
float_0:        .single      0r5.0       
float_1:        .single      0r10.0      
float_2:        .single      0r15.0      
str_3:          .asciz       "f1 is: "   
str_4:          .asciz       "f2 is: "   
str_5:          .asciz       "f3 is: "   
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
/* setting localf1 = 5.0 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 8*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 9*/
/* setting localf2 = 10.0 */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 9*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 9*/
/* Done. */
/* line number 11*/
/* setting localf3 = 15.0 */
    set         -16, %l0
    add         %fp, %l0, %l0
/* line number 11*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 11*/
/* Done. */
/* line number 11*/
/* Storing localf1 into f1 */
    set         f1, %l0
    add         %g0, %l0, %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
/* line number 12*/
/* Storing localf2 into f2 */
    set         f2, %l0
    add         %g0, %l0, %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
/* line number 13*/
/* Storing localf3 into f3 */
    set         f3, %l0
    add         %g0, %l0, %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing float f1 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 15*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 16*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* printing float f2 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 16*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* printing float f3 */
    set         f3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
