! --globals--
                .section     ".data"
                .align 4
                 .global     f1,f2,f3,i1,i2,i3,b1,b2,b3
f1:             .single      0r5.0       
f2:             .single      0r6.0       
f3:             .single      0r0.0       
float_2:        .single      0r7.0       
i1:             .word        0           
i2:             .word        0           
i3:             .word        0           
b1:             .word        0           
b2:             .word        0           
b3:             .word        0           
str_0:          .asciz       "f1 is: "   
str_1:          .asciz       "f2 is: "   
str_3:          .asciz       "f3 is: "   
str_4:          .asciz       "i1 is: "   
str_5:          .asciz       "i2 is: "   
str_6:          .asciz       "i3 is: "   
str_7:          .asciz       "b1 is: "   
str_8:          .asciz       "b2 is: "   
str_9:          .asciz       "b3 is: "   
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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing float STO.VarSTO@c6c084 */
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
    set         str_1, %o1
    call    printf
    nop
/* line number 16*/
/* Done printing string. */
/* line number 16*/
/* printing float STO.VarSTO@1990d96 */
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
! --storing constant f3 with value 7.0
    set         f3, %l0
    add         %g0, %l0, %l0
    set         f3, %l0
    add         %g0, %l0, %l0
    set         float_2, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* printing float STO.VarSTO@14afef4 */
    set         f3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant i1 with value 1.0
    set         i1, %l0
    add         %g0, %l0, %l0
    set         i1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant i2 with value 2.0
    set         i2, %l0
    add         %g0, %l0, %l0
    set         i2, %l0
    add         %g0, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* line number 23*/
/* Storing i1 into i3 */
    set         i3, %l0
    add         %g0, %l0, %l0
    set         i1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 25*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 25*/
/* Done printing string. */
/* line number 25*/
/* Printing int i1 */
    set         _intFmt, %o0
    set         i1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 25*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 26*/
/* Done printing string. */
/* line number 26*/
/* Printing int i2 */
    set         _intFmt, %o0
    set         i2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 26*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 27*/
/* Done printing string. */
/* line number 27*/
/* Printing int i3 */
    set         _intFmt, %o0
    set         i3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 27*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant b1 with value 1.0
    set         b1, %l0
    add         %g0, %l0, %l0
    set         b1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant b2 with value 0.0
    set         b2, %l0
    add         %g0, %l0, %l0
    set         b2, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 31*/
/* Storing b2 into b3 */
    set         b3, %l0
    add         %g0, %l0, %l0
    set         b2, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Printing bool b1 */
    set         b1, %l1
    add         %g0, %l1, %l1
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
/* line number 33*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
/* line number 34*/
/* Printing bool b2 */
    set         b2, %l1
    add         %g0, %l1, %l1
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
/* line number 34*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Printing bool b3 */
    set         b3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 35*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
