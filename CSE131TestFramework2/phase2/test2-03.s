! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     gblf,gvlfConstTimesConst,gblfConstTimesGlobal,gblfTimesConst,gblfTimesGlbl,gblfConstDivConst,gblfConstDivGlobal,gblfDivConst,gblfDivGlbl
gblf:           .single      0r12.8      
float_0:        .single      0r29.44     
gvlfConstTimesConst:    .single      0r29.44     
float_1:        .single      0r2.1       
gblfConstTimesGlobal:    .single      0r0         
float_2:        .single      0r2.2       
gblfTimesConst:    .single      0r0         
gblfTimesGlbl:    .single      0r0         
float_3:        .single      0r4.0       
gblfConstDivConst:    .single      0r4.0       
float_4:        .single      0r81.92     
gblfConstDivGlobal:    .single      0r0         
float_5:        .single      0r1.9       
gblfDivConst:    .single      0r0         
gblfDivGlbl:    .single      0r0         
float_6:        .single      0r3.5       
float_7:        .single      0r10.88     
float_8:        .single      0r10.88     
float_9:        .single      0r3.0       
float_10:       .single      0r3.7       
float_11:       .single      0r3.0       
float_12:       .single      0r3.0       
float_13:       .single      0r3.8       
str_14:         .asciz       " "         
str_15:         .asciz       " "         
str_16:         .asciz       " "         
str_17:         .asciz       " "         
str_18:         .asciz       " "         
str_19:         .asciz       " "         
str_20:         .asciz       " "         
str_21:         .asciz       " "         
str_22:         .asciz       " "         
str_23:         .asciz       " "         
str_24:         .asciz       " "         
str_25:         .asciz       " "         
str_26:         .asciz       " "         
str_27:         .asciz       " "         
str_28:         .asciz       " "         
str_29:         .asciz       " "         
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
/* line number 5*/
/* Multiplying */
/* line number 5*/
/* Storing variable 2.1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 5*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 5*/
/* Loading gblf to %f1 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 5*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 6*/
/* Storing variable float * float into gblfConstTimesGlobal */
    set         gblfConstTimesGlobal, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
/* line number 6*/
/* Multiplying */
/* line number 6*/
/* Loading gblf to %f0 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 6*/
/* Storing variable 2.2 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 6*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 6*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 7*/
/* Storing variable float * float into gblfTimesConst */
    set         gblfTimesConst, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 7*/
/* Prepping Arithmetic Calculations by loading */
/* line number 7*/
/* Multiplying */
/* line number 7*/
/* Loading gblf to %f0 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 7*/
/* Loading gblfTimesConst to %f1 */
    set         gblfTimesConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 7*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 9*/
/* Storing variable float * float into gblfTimesGlbl */
    set         gblfTimesGlbl, %l5
    add         %g0, %l5, %l5
    set         -16, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Dividing */
/* line number 10*/
/* Storing variable 81.92 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 10*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 10*/
/* Loading gblf to %f1 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 10*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 11*/
/* Storing variable float / float into gblfConstDivGlobal */
    set         gblfConstDivGlobal, %l5
    add         %g0, %l5, %l5
    set         -20, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 11*/
/* Prepping Arithmetic Calculations by loading */
/* line number 11*/
/* Dividing */
/* line number 11*/
/* Loading gblf to %f0 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 11*/
/* Storing variable 1.9 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 11*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 11*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 12*/
/* Storing variable float / float into gblfDivConst */
    set         gblfDivConst, %l5
    add         %g0, %l5, %l5
    set         -24, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Dividing */
/* line number 12*/
/* Loading gblf to %f0 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Loading gblfDivConst to %f1 */
    set         gblfDivConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 14*/
/* Storing variable float / float into gblfDivGlbl */
    set         gblfDivGlbl, %l5
    add         %g0, %l5, %l5
    set         -28, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 17*/
/* setting localFloat = 3.5 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 17*/
/* setting float */
    set         float_6, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 18*/
/* setting localConstTimesConst = Arithmetic Op */
    set         -12, %l0
    add         %fp, %l0, %l0
/* line number 18*/
/* setting float */
    set         float_8, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 18*/
/* Done. */
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Multiplying */
/* line number 18*/
/* Storing variable 3.0 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_9, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 18*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading localFloat to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* setting localConstTimesLocalFloat = float * float */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 19*/
/* Done. */
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Multiplying */
/* line number 19*/
/* Loading localFloat to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Storing variable 3.7 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_10, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 19*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* setting localFloatTimesConst = float * float */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 20*/
/* Done. */
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Multiplying */
/* line number 20*/
/* Loading localFloat to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading localFloatTimesConst to %f1 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* setting localFloatTimesLocal = float * float */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 21*/
/* Done. */
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Multiplying */
/* line number 21*/
/* Loading localFloat to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Loading gblf to %f1 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* setting localFloatTimesGlobal = float * float */
    set         -44, %l0
    add         %fp, %l0, %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 23*/
/* Done. */
/* line number 24*/
/* setting localConstDivConst = Arithmetic Op */
    set         -48, %l0
    add         %fp, %l0, %l0
/* line number 24*/
/* setting float */
    set         float_12, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 24*/
/* Done. */
/* line number 24*/
/* Prepping Arithmetic Calculations by loading */
/* line number 24*/
/* Dividing */
/* line number 24*/
/* Loading localFloatTimesConst to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 24*/
/* Storing variable 3.8 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_13, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 24*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 24*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 25*/
/* setting localFloatDivConst = float / float */
    set         -56, %l0
    add         %fp, %l0, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 25*/
/* Done. */
/* line number 25*/
/* Prepping Arithmetic Calculations by loading */
/* line number 25*/
/* Dividing */
/* line number 25*/
/* Loading localFloatDivConst to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 25*/
/* Loading localFloat to %f1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 25*/
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 26*/
/* setting localFloatDivLocal = float / float */
    set         -64, %l0
    add         %fp, %l0, %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 26*/
/* Done. */
/* line number 26*/
/* Prepping Arithmetic Calculations by loading */
/* line number 26*/
/* Dividing */
/* line number 26*/
/* Loading localFloatTimesGlobal to %f0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 26*/
/* Loading gblf to %f1 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fdivs       %f0, %f1, %f3
/* line number 26*/
/* Storing result of Binary Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 28*/
/* setting localFloatDivGlobal = float / float */
    set         -72, %l0
    add         %fp, %l0, %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 28*/
/* Done. */
/* line number 28*/
/* printing float STO.VarSTO@12c0b3f */
/* line number 28*/
/* Loading gblf to %f0 */
    set         gblf, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@10d16b */
/* line number 28*/
/* Loading gvlfConstTimesConst to %f0 */
    set         gvlfConstTimesConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@24de67 */
/* line number 28*/
/* Loading gblfConstTimesGlobal to %f0 */
    set         gblfConstTimesGlobal, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@853e51 */
/* line number 28*/
/* Loading gblfTimesConst to %f0 */
    set         gblfTimesConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printing float STO.VarSTO@1be4050 */
/* line number 28*/
/* Loading gblfTimesGlbl to %f0 */
    set         gblfTimesGlbl, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing float STO.VarSTO@132e233 */
/* line number 29*/
/* Loading gblfConstDivConst to %f0 */
    set         gblfConstDivConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* printing float STO.VarSTO@1a0c382 */
/* line number 29*/
/* Loading gblfConstDivGlobal to %f0 */
    set         gblfConstDivGlobal, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* printing float STO.VarSTO@183bfee */
/* line number 29*/
/* Loading gblfDivConst to %f0 */
    set         gblfDivConst, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* printing float STO.VarSTO@adb165 */
/* line number 29*/
/* Loading gblfDivGlbl to %f0 */
    set         gblfDivGlbl, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* printing float STO.VarSTO@15978e7 */
/* line number 31*/
/* Loading localFloat to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 31*/
/* Done printing float. */
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
/* printing float STO.VarSTO@110c2e8 */
/* line number 31*/
/* Loading localConstTimesConst to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 31*/
/* Done printing float. */
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
/* printing float STO.VarSTO@16c171f */
/* line number 31*/
/* Loading localConstTimesLocalFloat to %f0 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 31*/
/* Done printing float. */
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 32*/
/* printing float STO.VarSTO@1620d92 */
/* line number 32*/
/* Loading localFloatTimesConst to %f0 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 32*/
/* Done printing float. */
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* printing float STO.VarSTO@69048b */
/* line number 32*/
/* Loading localFloatTimesLocal to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 32*/
/* Done printing float. */
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_25, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* printing float STO.VarSTO@a969e4 */
/* line number 32*/
/* Loading localFloatTimesGlobal to %f0 */
    set         -44, %l1
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
/* printing float STO.VarSTO@67211b */
/* line number 33*/
/* Loading localConstDivConst to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 33*/
/* Done printing float. */
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_26, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* printing float STO.VarSTO@ae8542 */
/* line number 33*/
/* Loading localFloatDivConst to %f0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 33*/
/* Done printing float. */
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_27, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* printing float STO.VarSTO@1aec0d1 */
/* line number 33*/
/* Loading localFloatDivLocal to %f0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 33*/
/* Done printing float. */
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_28, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* printing float STO.VarSTO@1f4ea9d */
/* line number 33*/
/* Loading localFloatDivGlobal to %f0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 33*/
/* Done printing float. */
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_29, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
main_end:
    ret 
    restore
SAVE.main = -(92 + 72) & -8
