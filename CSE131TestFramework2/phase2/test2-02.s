! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gblf
gblf:           .single      0r12.95     
float_0:        .single      0r6.0       
str_1:          .asciz       " "         
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " "         
str_6:          .asciz       " "         
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
/* setting f = 6.0 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 8*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 8*/
/* Done. */
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
    set         -1, %l1
/* line number 8*/
/* Multiplying */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 8*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 8*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 8*/
/* Storing variable float * int into f */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Storing variable f into f */
    set         -8, %l5
    add         %fp, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 10*/
/* printing float STO.VarSTO@191a42 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
    set         -1, %l1
/* line number 10*/
/* Multiplying */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* printing float STO.ExprSTO@1d15d1c */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* printing float STO.VarSTO@191a42 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printing float STO.VarSTO@195ddba */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         -1, %l1
/* line number 12*/
/* Multiplying */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 12*/
/* printing float STO.ExprSTO@380c76 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* printing float STO.VarSTO@195ddba */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
    set         -1, %l1
/* line number 14*/
/* Multiplying */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 14*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 14*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* setting f2 = float * int */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 15*/
/* Done. */
/* line number 15*/
/* Storing variable f2 into gblf */
    set         gblf, %l5
    add         %g0, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* printing float STO.VarSTO@195ddba */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
    set         -1, %l1
/* line number 17*/
/* Multiplying */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Storing variable -1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         -1, %l3
    st          %l3, [%l5]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* printing float STO.ExprSTO@176feaf */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* printing float STO.VarSTO@195ddba */
    set         gblf, %l1
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
SAVE.main = -(92 + 32) & -8
