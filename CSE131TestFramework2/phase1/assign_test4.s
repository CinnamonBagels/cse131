! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     f1,f2,f3
f1:             .single      0r1.0       
f2:             .single      0r2.0       
f3:             .single      0r3.0       
float_0:        .single      0r5.0       
float_1:        .single      0r10.0      
float_2:        .single      0r15.0      
str_3:          .asciz       "::f1 is: " 
str_4:          .asciz       "::f2 is: " 
str_5:          .asciz       "::f3 is: " 
str_6:          .asciz       "f1 is: "   
str_7:          .asciz       "f2 is: "   
str_8:          .asciz       "f3 is: "   
str_9:          .asciz       "localf1 is: "
str_10:         .asciz       "localf2 is: "
str_11:         .asciz       "localf3 is: "
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
/* line number 12*/
/* setting f1 = localf1 */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 13*/
/* setting f2 = localf2 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 13*/
/* Done. */
/* line number 15*/
/* setting f3 = localf3 */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Done. */
/* line number 15*/
/* Storing variable f1 into localf1 */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         f1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 16*/
/* Storing variable f2 into localf2 */
    set         -12, %l5
    add         %fp, %l5, %l5
    set         f2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* Storing variable f3 into localf3 */
    set         -16, %l5
    add         %fp, %l5, %l5
    set         f3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* printing float STO.VarSTO@68bd43 */
/* line number 19*/
/* Loading f1 to %f0 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* printing float STO.VarSTO@10bb83e */
/* line number 20*/
/* Loading f2 to %f0 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* printing float STO.VarSTO@6d234c */
/* line number 21*/
/* Loading f3 to %f0 */
    set         f3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* printing float STO.VarSTO@16c2195 */
/* line number 23*/
/* Loading f1 to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 23*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 24*/
/* printing float STO.VarSTO@10d16b */
/* line number 24*/
/* Loading f2 to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 24*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* printing float STO.VarSTO@24de67 */
/* line number 25*/
/* Loading f3 to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* printing float STO.VarSTO@1286c71 */
/* line number 27*/
/* Loading localf1 to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 27*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@e77ca4 */
/* line number 28*/
/* Loading localf2 to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* printing float STO.VarSTO@1a83205 */
/* line number 29*/
/* Loading localf3 to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 28) & -8
