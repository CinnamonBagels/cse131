! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
y:              .single      0r1.11      
float_0:        .single      0r1.11      
float_27:       .single      0r4.0       
float_28:       .single      0r4.0       
float_30:       .single      0r4.0       
float_31:       .single      0r4.0       
float_39:       .single      0r2.11      
float_40:       .single      0r2.11      
float_41:       .single      0r0.47393364
float_42:       .single      0r0.47393364928909953
float_43:       .single      0r1.0       
float_44:       .single      0r0.5       
float_45:       .single      0r0.5       
x:              .word        5           
str_1:          .asciz       "should be 6.33: "
str_2:          .asciz       "should be 6.33: "
str_3:          .asciz       "should be 6.33: "
str_4:          .asciz       "should be 2.11: "
str_5:          .asciz       "should be 1.11: "
str_6:          .asciz       "should be 2.11: "
str_7:          .asciz       "should be 2.11: "
str_8:          .asciz       "should be 6.11: "
str_9:          .asciz       "should be 7.22: "
str_10:         .asciz       "should be 7.22: "
str_11:         .asciz       "should be 7.22: "
str_12:         .asciz       "should be 7.22: "
str_13:         .asciz       "should be 7.22: "
str_14:         .asciz       "should be 7.22: "
str_15:         .asciz       "should be 4.44: "
str_16:         .asciz       "should be 0: "
str_17:         .asciz       "should be -1: "
str_18:         .asciz       "should be 1: "
str_19:         .asciz       "should be 4: "
str_20:         .asciz       "should be -4: "
str_21:         .asciz       "should be 3.89: "
str_22:         .asciz       "should be 3.89: "
str_23:         .asciz       "should be -3.89: "
str_24:         .asciz       "shoudl be -3.89: "
str_25:         .asciz       "should be 4: "
str_26:         .asciz       "should be 4.00: "
str_29:         .asciz       "should be 4.00: "
str_32:         .asciz       "should be 6.16: "
str_33:         .asciz       "should be 6.16: "
str_34:         .asciz       "should be 6.16: "
str_35:         .asciz       "should be 6.16: "
str_36:         .asciz       "should be 6.16: "
str_37:         .asciz       "should be 6.16: "
str_38:         .asciz       "should be "
str_46:         .asciz       "testing mod"
str_47:         .asciz       "1 % 2 = "  
str_48:         .asciz       "2 % 1 = "  
str_49:         .asciz       "5 % 15 = " 
str_50:         .asciz       "1 % 3 = "  
str_51:         .asciz       "2 % 3 = "  
str_52:         .asciz       "3 % 3 = "  
str_53:         .asciz       "0 % 3 = "  
str_54:         .asciz       "x % a = "  
str_55:         .asciz       "a % x = "  
str_56:         .asciz       "a % x % x = "
str_57:         .asciz       "x % a % a = "
str_58:         .asciz       "testing bitwise or"
str_59:         .asciz       "testing bitwise xor"
str_60:         .asciz       "testing bitwise and"
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
/* setting z = 1.11 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 7*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 7*/
/* Done. */
/* line number 9*/
/* setting a = 2 */
    set         2, %l0
    st          %l0, [%fp-12]
/* line number 9*/
/* Done. */
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading 1 to %l0 */
    set         1, %l0
/* line number 9*/
/* Adding */
/* line number 9*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 9*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Adding */
/* line number 9*/
/* Loading int + float to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 9*/
/* Adding */
/* line number 9*/
/* Loading float + float to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 9*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 9*/
/* Adding */
/* line number 9*/
/* Loading float + int to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 9*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Adding */
/* line number 9*/
/* Loading float + int to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* printing float STO.ExprSTO@1a0c382 */
/* line number 9*/
/* Loading float + float to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 9*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading Arithmetic Op to %l0 */
    set         3, %l0
/* line number 10*/
/* Adding */
/* line number 10*/
/* Storing variable Arithmetic Op into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         3, %l3
    st          %l3, [%l5]
/* line number 10*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Adding */
/* line number 10*/
/* Loading int + float to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Adding */
/* line number 10*/
/* Loading float + float to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 10*/
/* printing float STO.ExprSTO@183bfee */
/* line number 10*/
/* Loading float + float to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 10*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 11*/
/* Adding */
/* line number 11*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 11*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 11*/
/* Adding */
/* line number 11*/
/* Loading float + int to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 11*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Adding */
/* line number 11*/
/* Loading float + int to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Adding */
/* line number 11*/
/* Loading float + float to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 11*/
/* Adding */
/* line number 11*/
/* Loading float + float to %f0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 11*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* printing float STO.ExprSTO@adb165 */
/* line number 11*/
/* Loading float + int to %f0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 11*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Loading 1 to %l0 */
    set         1, %l0
/* line number 12*/
/* Adding */
/* line number 12*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 12*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 12*/
/* printing float STO.ExprSTO@15978e7 */
/* line number 12*/
/* Loading int + float to %f0 */
    set         -68, %l1
    add         %fp, %l1, %l1
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
    set         str_5, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing float STO.VarSTO@1be4050 */
/* line number 13*/
/* Loading z to %f0 */
    set         -8, %l1
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
    set         str_6, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* Prepping Arithmetic Calculations by loading */
/* line number 14*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 14*/
/* Adding */
/* line number 14*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 14*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 14*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 14*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 14*/
/* printing float STO.ExprSTO@110c2e8 */
/* line number 14*/
/* Loading float + int to %f0 */
    set         -72, %l1
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
    set         str_7, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
/* line number 15*/
/* Loading 1 to %l0 */
    set         1, %l0
/* line number 15*/
/* Adding */
/* line number 15*/
/* Storing variable 1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         1, %l3
    st          %l3, [%l5]
/* line number 15*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 15*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 15*/
/* Storing result of Binary Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 15*/
/* printing float STO.ExprSTO@16c171f */
/* line number 15*/
/* Loading int + float to %f0 */
    set         -76, %l1
    add         %fp, %l1, %l1
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
    set         str_8, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
/* line number 16*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 16*/
/* Adding */
/* line number 16*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 16*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 16*/
/* Storing result of Binary Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 16*/
/* printing float STO.ExprSTO@1620d92 */
/* line number 16*/
/* Loading int + float to %f0 */
    set         -80, %l1
    add         %fp, %l1, %l1
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
    set         str_9, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Adding */
/* line number 17*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -84, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Adding */
/* line number 17*/
/* Loading int + float to %f0 */
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -88, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* printing float STO.ExprSTO@69048b */
/* line number 17*/
/* Loading float + float to %f0 */
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Adding */
/* line number 18*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -92, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Adding */
/* line number 18*/
/* Loading float + float to %f0 */
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* printing float STO.ExprSTO@a969e4 */
/* line number 18*/
/* Loading float + int to %f0 */
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 18*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
/* Adding */
/* line number 19*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Adding */
/* line number 19*/
/* Loading float + int to %f0 */
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* printing float STO.ExprSTO@67211b */
/* line number 19*/
/* Loading float + float to %f0 */
    set         -104, %l1
    add         %fp, %l1, %l1
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
    set         str_12, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 20*/
/* Adding */
/* line number 20*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -108, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Adding */
/* line number 20*/
/* Loading int + float to %f0 */
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* printing float STO.ExprSTO@ae8542 */
/* line number 20*/
/* Loading float + float to %f0 */
    set         -112, %l1
    add         %fp, %l1, %l1
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
    set         str_13, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 21*/
/* Adding */
/* line number 21*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -116, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Adding */
/* line number 21*/
/* Loading float + int to %f0 */
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -120, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* printing float STO.ExprSTO@1aec0d1 */
/* line number 21*/
/* Loading float + float to %f0 */
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 21*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Adding */
/* line number 22*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 22*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 22*/
/* Storing result of Binary Op */
    set         -124, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 22*/
/* Prepping Arithmetic Calculations by loading */
/* line number 22*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 22*/
/* Adding */
/* line number 22*/
/* Loading float + float to %f0 */
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 22*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 22*/
/* Storing result of Binary Op */
    set         -128, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 22*/
/* printing float STO.ExprSTO@1f4ea9d */
/* line number 22*/
/* Loading float + int to %f0 */
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 22*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
/* line number 23*/
/* Adding */
/* line number 23*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 23*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 23*/
/* Storing result of Binary Op */
    set         -132, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
/* line number 23*/
/* Adding */
/* line number 23*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 23*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 23*/
/* Storing result of Binary Op */
    set         -136, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* Prepping Arithmetic Calculations by loading */
/* line number 23*/
/* Adding */
/* line number 23*/
/* Loading float + float to %f0 */
    set         -132, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 23*/
/* Loading float + float to %f1 */
    set         -136, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 23*/
/* Storing result of Binary Op */
    set         -140, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* printing float STO.ExprSTO@571688 */
/* line number 23*/
/* Loading float + float to %f0 */
    set         -140, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 23*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 26*/
/* Done printing string. */
/* line number 26*/
/* printf on int */
    set         _intFmt, %o0
    set         -1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* Prepping Arithmetic Calculations by loading */
/* line number 28*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 28*/
/* Loading 1 to %l1 */
    set         1, %l1
/* line number 28*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 28*/
/* Storing result of Binary Op */
    set         -144, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 28*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 28*/
/* Loading int - int to %o1 */
    set         -144, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 28*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Prepping Arithmetic Calculations by loading */
/* line number 29*/
/* Loading 1 to %l0 */
    set         1, %l0
/* line number 29*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 29*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 29*/
/* Storing result of Binary Op */
    set         -148, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 29*/
/* Printing int int - int */
    set         _intFmt, %o0
/* line number 29*/
/* Loading int - int to %o1 */
    set         -148, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
/* line number 30*/
/* Prepping Arithmetic Calculations by loading */
/* line number 30*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 30*/
/* Subtracting */
/* line number 30*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 30*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fsubs       %f0, %f1, %f3
/* line number 30*/
/* Storing result of Binary Op */
    set         -152, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 30*/
/* printing float STO.ExprSTO@ed41f8 */
/* line number 30*/
/* Loading int - float to %f0 */
    set         -152, %l1
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
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
/* line number 31*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 31*/
/* Subtracting */
/* line number 31*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 31*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fsubs       %f0, %f1, %f3
/* line number 31*/
/* Storing result of Binary Op */
    set         -156, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 31*/
/* printing float STO.ExprSTO@863cc1 */
/* line number 31*/
/* Loading int - float to %f0 */
    set         -156, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 31*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* Prepping Arithmetic Calculations by loading */
/* line number 32*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 32*/
/* Subtracting */
/* line number 32*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 32*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fsubs       %f0, %f1, %f3
/* line number 32*/
/* Storing result of Binary Op */
    set         -160, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 32*/
/* printing float STO.ExprSTO@fea539 */
/* line number 32*/
/* Loading float - int to %f0 */
    set         -160, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 32*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Prepping Arithmetic Calculations by loading */
/* line number 33*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 33*/
/* Subtracting */
/* line number 33*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 33*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fsubs       %f0, %f1, %f3
/* line number 33*/
/* Storing result of Binary Op */
    set         -164, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 33*/
/* printing float STO.ExprSTO@1145cc */
/* line number 33*/
/* Loading float - int to %f0 */
    set         -164, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 33*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_25, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_26, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    set         float_28, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_29, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    set         float_31, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_32, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
/* line number 38*/
/* Prepping Arithmetic Calculations by loading */
/* line number 38*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 38*/
/* Multiplying */
/* line number 38*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 38*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 38*/
/* Storing result of Binary Op */
    set         -168, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 38*/
/* printing float STO.ExprSTO@1fd5730 */
/* line number 38*/
/* Loading int * float to %f0 */
    set         -168, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 38*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_33, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
/* line number 39*/
/* Prepping Arithmetic Calculations by loading */
/* line number 39*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 39*/
/* Multiplying */
/* line number 39*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 39*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 39*/
/* Storing result of Binary Op */
    set         -172, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 39*/
/* printing float STO.ExprSTO@1673d71 */
/* line number 39*/
/* Loading float * int to %f0 */
    set         -172, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 39*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 40*/
/* printing string */
    set         _strFmt, %o0
    set         str_34, %o1
    call    printf
    nop
/* line number 40*/
/* Done printing string. */
/* line number 40*/
/* Prepping Arithmetic Calculations by loading */
/* line number 40*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 40*/
/* Multiplying */
/* line number 40*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 40*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 40*/
/* Storing result of Binary Op */
    set         -176, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 40*/
/* printing float STO.ExprSTO@f2e328 */
/* line number 40*/
/* Loading int * float to %f0 */
    set         -176, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 40*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* printing string */
    set         _strFmt, %o0
    set         str_35, %o1
    call    printf
    nop
/* line number 41*/
/* Done printing string. */
/* line number 41*/
/* Prepping Arithmetic Calculations by loading */
/* line number 41*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 41*/
/* Multiplying */
/* line number 41*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 41*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 41*/
/* Storing result of Binary Op */
    set         -180, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 41*/
/* Prepping Arithmetic Calculations by loading */
/* line number 41*/
/* Multiplying */
/* line number 41*/
/* Loading int * float to %f0 */
    set         -180, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 41*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 41*/
/* Storing result of Binary Op */
    set         -184, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 41*/
/* printing float STO.ExprSTO@1f6c18 */
/* line number 41*/
/* Loading float * float to %f0 */
    set         -184, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 41*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_36, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
/* line number 42*/
/* Prepping Arithmetic Calculations by loading */
/* line number 42*/
/* Multiplying */
/* line number 42*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 42*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 42*/
/* Storing result of Binary Op */
    set         -188, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 42*/
/* Prepping Arithmetic Calculations by loading */
/* line number 42*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 42*/
/* Multiplying */
/* line number 42*/
/* Loading float * float to %f0 */
    set         -188, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 42*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fmuls       %f0, %f1, %f3
/* line number 42*/
/* Storing result of Binary Op */
    set         -192, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 42*/
/* printing float STO.ExprSTO@f1cdfb */
/* line number 42*/
/* Loading float * int to %f0 */
    set         -192, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 42*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_37, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Prepping Arithmetic Calculations by loading */
/* line number 43*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 43*/
/* Multiplying */
/* line number 43*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 43*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 43*/
/* Storing result of Binary Op */
    set         -196, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 43*/
/* Prepping Arithmetic Calculations by loading */
/* line number 43*/
/* Multiplying */
/* line number 43*/
/* Loading int * float to %f0 */
    set         -196, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 43*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 43*/
/* Storing result of Binary Op */
    set         -200, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 43*/
/* printing float STO.ExprSTO@10a59d2 */
/* line number 43*/
/* Loading float * float to %f0 */
    set         -200, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 43*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_38, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 47*/
/* printf on int */
    set         _intFmt, %o0
    set         2, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_40, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_42, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 50*/
/* Prepping Arithmetic Calculations by loading */
/* line number 50*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 50*/
/* Dividing */
/* line number 50*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 50*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 50*/
/* Storing result of Binary Op */
    set         -204, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 50*/
/* printing float STO.ExprSTO@31e2ad */
/* line number 50*/
/* Loading int / float to %f0 */
    set         -204, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 50*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* Prepping Arithmetic Calculations by loading */
/* line number 51*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 51*/
/* Dividing */
/* line number 51*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 51*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fdivs       %f0, %f1, %f3
/* line number 51*/
/* Storing result of Binary Op */
    set         -208, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 51*/
/* printing float STO.ExprSTO@118da51 */
/* line number 51*/
/* Loading int / float to %f0 */
    set         -208, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 51*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 52*/
/* Prepping Arithmetic Calculations by loading */
/* line number 52*/
/* Dividing */
/* line number 52*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 52*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 52*/
/* Storing result of Binary Op */
    set         -212, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 52*/
/* printing float STO.ExprSTO@a50395 */
/* line number 52*/
/* Loading float / float to %f0 */
    set         -212, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 52*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 53*/
/* Prepping Arithmetic Calculations by loading */
/* line number 53*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 53*/
/* Dividing */
/* line number 53*/
/* Loading y to %f0 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 53*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fdivs       %f0, %f1, %f3
/* line number 53*/
/* Storing result of Binary Op */
    set         -216, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 53*/
/* printing float STO.ExprSTO@18e400b */
/* line number 53*/
/* Loading float / int to %f0 */
    set         -216, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 53*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* Prepping Arithmetic Calculations by loading */
/* line number 54*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 54*/
/* Dividing */
/* line number 54*/
/* Loading z to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 54*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fdivs       %f0, %f1, %f3
/* line number 54*/
/* Storing result of Binary Op */
    set         -220, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 54*/
/* printing float STO.ExprSTO@ec850 */
/* line number 54*/
/* Loading float / int to %f0 */
    set         -220, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 54*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 56*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 57*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 59*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 61*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_45, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 63*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 64*/
/* Prepping Arithmetic Calculations by loading */
/* line number 64*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 64*/
/* Adding */
/* line number 64*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 64*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 64*/
/* Storing result of Binary Op */
    set         -224, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 64*/
/* Prepping Arithmetic Calculations by loading */
/* line number 64*/
/* Dividing */
/* line number 64*/
/* Loading int + float to %f0 */
    set         -224, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 64*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 64*/
/* Storing result of Binary Op */
    set         -228, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 64*/
/* printing float STO.ExprSTO@813aca */
/* line number 64*/
/* Loading float / float to %f0 */
    set         -228, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 64*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 65*/
/* Prepping Arithmetic Calculations by loading */
/* line number 65*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 65*/
/* Adding */
/* line number 65*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 65*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 65*/
/* Storing result of Binary Op */
    set         -232, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 65*/
/* Prepping Arithmetic Calculations by loading */
/* line number 65*/
/* Dividing */
/* line number 65*/
/* Loading int + float to %f0 */
    set         -232, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 65*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 65*/
/* Storing result of Binary Op */
    set         -236, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 65*/
/* printing float STO.ExprSTO@3ad545 */
/* line number 65*/
/* Loading float / float to %f0 */
    set         -236, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 65*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 66*/
/* Prepping Arithmetic Calculations by loading */
/* line number 66*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 66*/
/* Multiplying */
/* line number 66*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 66*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 66*/
/* Storing result of Binary Op */
    set         -240, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 66*/
/* Prepping Arithmetic Calculations by loading */
/* line number 66*/
/* Dividing */
/* line number 66*/
/* Loading int * float to %f0 */
    set         -240, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 66*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 66*/
/* Storing result of Binary Op */
    set         -244, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 66*/
/* printing float STO.ExprSTO@87c801 */
/* line number 66*/
/* Loading float / float to %f0 */
    set         -244, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 66*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 67*/
/* Prepping Arithmetic Calculations by loading */
/* line number 67*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 67*/
/* Multiplying */
/* line number 67*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 67*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 67*/
/* Storing result of Binary Op */
    set         -248, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 67*/
/* Prepping Arithmetic Calculations by loading */
/* line number 67*/
/* Dividing */
/* line number 67*/
/* Loading int * float to %f0 */
    set         -248, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 67*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 67*/
/* Storing result of Binary Op */
    set         -252, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 67*/
/* printing float STO.ExprSTO@5bf465 */
/* line number 67*/
/* Loading float / float to %f0 */
    set         -252, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 67*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 68*/
/* Subtracting */
/* line number 68*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fsubs       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -256, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Adding */
/* line number 68*/
/* Loading int - float to %f0 */
    set         -256, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -260, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 68*/
/* Multiplying */
/* line number 68*/
/* Loading x to %f0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading y to %f1 */
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fmuls       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -264, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Dividing */
/* line number 68*/
/* Loading int * float to %f0 */
    set         -264, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading z to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -268, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Adding */
/* line number 68*/
/* Loading float + float to %f0 */
    set         -260, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading float / float to %f1 */
    set         -268, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -272, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* Prepping Arithmetic Calculations by loading */
/* line number 68*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 68*/
/* Dividing */
/* line number 68*/
/* Loading float + float to %f0 */
    set         -272, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 68*/
/* Loading x to %f1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fdivs       %f0, %f1, %f3
/* line number 68*/
/* Storing result of Binary Op */
    set         -276, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 68*/
/* printing float STO.ExprSTO@ba63a2 */
/* line number 68*/
/* Loading float / int to %f0 */
    set         -276, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 68*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 70*/
/* printing string */
    set         _strFmt, %o0
    set         str_46, %o1
    call    printf
    nop
/* line number 70*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 71*/
/* printing string */
    set         _strFmt, %o0
    set         str_47, %o1
    call    printf
    nop
/* line number 71*/
/* Done printing string. */
/* line number 71*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 72*/
/* printing string */
    set         _strFmt, %o0
    set         str_48, %o1
    call    printf
    nop
/* line number 72*/
/* Done printing string. */
/* line number 72*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 73*/
/* printing string */
    set         _strFmt, %o0
    set         str_49, %o1
    call    printf
    nop
/* line number 73*/
/* Done printing string. */
/* line number 73*/
/* printf on int */
    set         _intFmt, %o0
    set         5, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 74*/
/* printing string */
    set         _strFmt, %o0
    set         str_50, %o1
    call    printf
    nop
/* line number 74*/
/* Done printing string. */
/* line number 74*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 75*/
/* printing string */
    set         _strFmt, %o0
    set         str_51, %o1
    call    printf
    nop
/* line number 75*/
/* Done printing string. */
/* line number 75*/
/* printf on int */
    set         _intFmt, %o0
    set         2, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 76*/
/* printing string */
    set         _strFmt, %o0
    set         str_52, %o1
    call    printf
    nop
/* line number 76*/
/* Done printing string. */
/* line number 76*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 77*/
/* printing string */
    set         _strFmt, %o0
    set         str_53, %o1
    call    printf
    nop
/* line number 77*/
/* Done printing string. */
/* line number 77*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 78*/
/* printing string */
    set         _strFmt, %o0
    set         str_54, %o1
    call    printf
    nop
/* line number 78*/
/* Done printing string. */
/* line number 78*/
/* Prepping Arithmetic Calculations by loading */
/* line number 78*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 78*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 78*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 78*/
/* Storing result of Binary Op */
    set         -280, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 78*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 78*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -280, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 78*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 79*/
/* printing string */
    set         _strFmt, %o0
    set         str_55, %o1
    call    printf
    nop
/* line number 79*/
/* Done printing string. */
/* line number 79*/
/* Prepping Arithmetic Calculations by loading */
/* line number 79*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 79*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 79*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 79*/
/* Storing result of Binary Op */
    set         -284, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 79*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 79*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -284, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 79*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 80*/
/* printing string */
    set         _strFmt, %o0
    set         str_56, %o1
    call    printf
    nop
/* line number 80*/
/* Done printing string. */
/* line number 80*/
/* Prepping Arithmetic Calculations by loading */
/* line number 80*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 80*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 80*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 80*/
/* Storing result of Binary Op */
    set         -288, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 80*/
/* Prepping Arithmetic Calculations by loading */
/* line number 80*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %l0 */
    set         -288, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 80*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 80*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 80*/
/* Storing result of Binary Op */
    set         -292, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 80*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 80*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -292, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 80*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 81*/
/* printing string */
    set         _strFmt, %o0
    set         str_57, %o1
    call    printf
    nop
/* line number 81*/
/* Done printing string. */
/* line number 81*/
/* Prepping Arithmetic Calculations by loading */
/* line number 81*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 81*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 81*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 81*/
/* Storing result of Binary Op */
    set         -296, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 81*/
/* Prepping Arithmetic Calculations by loading */
/* line number 81*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %l0 */
    set         -296, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 81*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 81*/
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* line number 81*/
/* Storing result of Binary Op */
    set         -300, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 81*/
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* line number 81*/
/* Loading Validating int and int as an IntegerType for operator: %...
 to %o1 */
    set         -300, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 81*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 83*/
/* printing string */
    set         _strFmt, %o0
    set         str_58, %o1
    call    printf
    nop
/* line number 83*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 84*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 85*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 86*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 87*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 88*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 89*/
/* Prepping Arithmetic Calculations by loading */
/* line number 89*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 89*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 89*/
/* Oring */
    or          %l0, %l1, %l2
/* line number 89*/
/* Storing result of Binary Op */
    set         -304, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 89*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: |...
 */
    set         _intFmt, %o0
/* line number 89*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: |...
 to %o1 */
    set         -304, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 89*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 90*/
/* Prepping Arithmetic Calculations by loading */
/* line number 90*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 90*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 90*/
/* Oring */
    or          %l0, %l1, %l2
/* line number 90*/
/* Storing result of Binary Op */
    set         -308, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 90*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: |...
 */
    set         _intFmt, %o0
/* line number 90*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: |...
 to %o1 */
    set         -308, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 90*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 91*/
/* Prepping Arithmetic Calculations by loading */
/* line number 91*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 91*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 91*/
/* Oring */
    or          %l0, %l1, %l2
/* line number 91*/
/* Storing result of Binary Op */
    set         -312, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 91*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: |...
 */
    set         _intFmt, %o0
/* line number 91*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: |...
 to %o1 */
    set         -312, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 91*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 93*/
/* printing string */
    set         _strFmt, %o0
    set         str_59, %o1
    call    printf
    nop
/* line number 93*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 94*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 95*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 96*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 97*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 98*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 99*/
/* Prepping Arithmetic Calculations by loading */
/* line number 99*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 99*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 99*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 99*/
/* Storing result of Binary Op */
    set         -316, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 99*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         _intFmt, %o0
/* line number 99*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: ^...
 to %o1 */
    set         -316, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 99*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 100*/
/* Prepping Arithmetic Calculations by loading */
/* line number 100*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 100*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 100*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 100*/
/* Storing result of Binary Op */
    set         -320, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 100*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         _intFmt, %o0
/* line number 100*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: ^...
 to %o1 */
    set         -320, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 100*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 101*/
/* Prepping Arithmetic Calculations by loading */
/* line number 101*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 101*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 101*/
/* Xoring */
    xor         %l0, %l1, %l2
/* line number 101*/
/* Storing result of Binary Op */
    set         -324, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 101*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: ^...
 */
    set         _intFmt, %o0
/* line number 101*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: ^...
 to %o1 */
    set         -324, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 101*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 103*/
/* printing string */
    set         _strFmt, %o0
    set         str_60, %o1
    call    printf
    nop
/* line number 103*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 104*/
/* printf on int */
    set         _intFmt, %o0
    set         1, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 105*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 106*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 107*/
/* printf on int */
    set         _intFmt, %o0
    set         0, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 108*/
/* Prepping Arithmetic Calculations by loading */
/* line number 108*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 108*/
/* Loading x to %l1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 108*/
/* Anding */
    and         %l0, %l1, %l2
/* line number 108*/
/* Storing result of Binary Op */
    set         -328, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 108*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: &...
 */
    set         _intFmt, %o0
/* line number 108*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: &...
 to %o1 */
    set         -328, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 108*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 109*/
/* Prepping Arithmetic Calculations by loading */
/* line number 109*/
/* Loading x to %l0 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* line number 109*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 109*/
/* Anding */
    and         %l0, %l1, %l2
/* line number 109*/
/* Storing result of Binary Op */
    set         -332, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 109*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: &...
 */
    set         _intFmt, %o0
/* line number 109*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: &...
 to %o1 */
    set         -332, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 109*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 110*/
/* Prepping Arithmetic Calculations by loading */
/* line number 110*/
/* Loading a to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 110*/
/* Loading a to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 110*/
/* Anding */
    and         %l0, %l1, %l2
/* line number 110*/
/* Storing result of Binary Op */
    set         -336, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* line number 110*/
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: &...
 */
    set         _intFmt, %o0
/* line number 110*/
/* Loading Validating BitwiseOp int and int as an IntegerType for operator: &...
 to %o1 */
    set         -336, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 110*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 336) & -8
