! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     f1,f2,f3
f1:             .single      0r5.0       
f2:             .single      0r6.0       
f3:             .single      0r0.0       
float_2:        .single      0r7.0       
str_0:          .asciz       "f1 is: "   
str_1:          .asciz       "f2 is: "   
str_3:          .asciz       "f3 is: "   
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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
/* line number 7*/
/* printing float STO.VarSTO@68bd43 */
/* line number 7*/
/* Loading f1 to %f0 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 7*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing float STO.VarSTO@10bb83e */
/* line number 8*/
/* Loading f2 to %f0 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 8*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant f3 with value 7.0
    set         f3, %l0
    add         %g0, %l0, %l0
    set         float_2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* printing float STO.VarSTO@6d234c */
/* line number 11*/
/* Loading f3 to %f0 */
    set         f3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
