! --globals--
                .section     ".data"
                .align 4
                 .global     i,k,b1,b2,f1,f2,f3
f1:             .single      0r1.0       
f2:             .single      0r7654321.0 
f3:             .single      0r-100.01   
float_0:        .single      0r95.95     
float_1:        .single      0r1234567.0 
float_2:        .single      0r-0.01     
float_13:       .single      0r95.95     
float_15:       .single      0r1234567.0 
float_17:       .single      0r-0.01     
i:              .word        10          
k:              .word        -50         
b1:             .word        0           
b2:             .word        1           
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " = true, false = "
str_6:          .asciz       "\n"        
str_7:          .asciz       " "         
str_8:          .asciz       " "         
str_9:          .asciz       " "         
str_10:         .asciz       " "         
str_11:         .asciz       " = true, false = "
str_12:         .asciz       "\n"        
str_14:         .asciz       " "         
str_16:         .asciz       " "         
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
/* line number 15*/
/* setting b1 = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 15*/
/* Done. */
/* line number 16*/
/* setting b2 = false */
    set         0, %l0
    st          %l0, [%fp-12]
/* line number 16*/
/* Done. */
/* line number 17*/
/* setting i = 2 */
    set         2, %l0
    st          %l0, [%fp-16]
/* line number 17*/
/* Done. */
/* line number 18*/
/* setting k = 5 */
    set         -5, %l0
    st          %l0, [%fp-20]
/* line number 18*/
/* Done. */
/* line number 19*/
/* setting f1 = 95.95 */
    set         -24, %l0
    add         %fp, %l0, %l0
/* line number 19*/
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 19*/
/* Done. */
/* line number 20*/
/* setting f2 = 1234567.0 */
    set         -28, %l0
    add         %fp, %l0, %l0
/* line number 20*/
/* setting float */
    set         float_1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 20*/
/* Done. */
/* line number 22*/
/* setting f3 = .01 */
    set         -32, %l0
    add         %fp, %l0, %l0
/* line number 22*/
/* setting float */
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 22*/
/* Done. */
/* line number 22*/
/* Printing int i */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 22*/
/* Done printing int. */
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
/* line number 22*/
/* Printing int k */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 22*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Printing bool b1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* line number 23*/
/* Done printing bool. */
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Printing bool b2 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 23*/
/* Done printing bool. */
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
/* line number 25*/
/* printing float STO.VarSTO@16ad447 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* printing float STO.VarSTO@96b555 */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* printing float STO.VarSTO@1904b13 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printf on int */
    set         _intFmt, %o0
    set         2, %o1
    call    printf
    nop

/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
/* line number 28*/
/* printf on int */
    set         _intFmt, %o0
    set         -5, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
    set         _strFmt, %o0
    set         _boolT, %o1
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
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
    set         float_13, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
    set         float_15, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 31*/
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
SAVE.main = -(92 + 32) & -8
