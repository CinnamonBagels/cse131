! --globals--
                .section     ".data"
                .align 4
                 .global     f1,i,f2
float_0:        .single      0r5.5       
f1:             .single      0r5.5       
i:              .word        12          
f2:             .single      0r0         
str_1:          .asciz       "global: "  
str_2:          .asciz       " * "       
str_3:          .asciz       " = "       
str_4:          .asciz       "global * const: "
str_5:          .asciz       " * "       
str_6:          .asciz       " = "       
str_7:          .asciz       "local * global: "
str_8:          .asciz       " * "       
str_9:          .asciz       " = "       
str_10:         .asciz       "int const * float const: "
str_11:         .asciz       " * "       
float_12:       .single      0r191.0     
float_13:       .single      0r191.0     
str_14:         .asciz       " = "       
float_15:       .single      0r191.0     
float_16:       .single      0r1337.0    
float_17:       .single      0r1337.0    
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
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 5*/
/* Multiplying */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 5*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 7*/
/* Storing int * float into f2 */
    set         f2, %l0
    add         %g0, %l0, %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
    set         5, %l1
/* line number 9*/
/* Multiplying */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Storing 5 into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* setting f2 = float * int */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Multiplying */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 12*/
/* setting f3 = float * float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* printing float f1 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Printing int i */
    set         _intFmt, %o0
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* printing float f2 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing float f1 */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 13*/
/* Done printing float. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printf on int */
    set         _intFmt, %o0
    set         5, %o1
    call    printf
    nop

/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing float f2 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 13*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing float f2 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing float f2 */
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing float f3 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printf on int */
    set         _intFmt, %o0
    set         7, %o1
    call    printf
    nop

/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         float_13, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         float_17, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8