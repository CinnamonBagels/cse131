! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     rick,ankur,rickAndAnkur
rick:           .word        1           
ankur:          .word        0           
rickAndAnkur:    .word        0           
str_0:          .asciz       "rick is: " 
str_1:          .asciz       "ankur is: "
str_2:          .asciz       "rickAndAnkur is: "
str_3:          .asciz       "a is: "    
str_4:          .asciz       "b is: "    
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
/* setting a = true */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
/* line number 10*/
/* setting b = a */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Storing variable ankur into rickAndAnkur */
    set         rickAndAnkur, %l5
    add         %g0, %l5, %l5
    set         ankur, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 11*/
/* Storing variable a into ankur */
    set         ankur, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 12*/
/* Storing variable b into rick */
    set         rick, %l5
    add         %g0, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 13*/
/* Storing variable rick into rickAndAnkur */
    set         rickAndAnkur, %l5
    add         %g0, %l5, %l5
    set         rick, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Printing bool rick */
/* line number 15*/
/* Loading rick to %l0 */
    set         rick, %l1
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
/* line number 15*/
/* Done printing bool. */
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
/* Printing bool ankur */
/* line number 16*/
/* Loading ankur to %l0 */
    set         ankur, %l1
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
/* line number 16*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing bool rickAndAnkur */
/* line number 17*/
/* Loading rickAndAnkur to %l0 */
    set         rickAndAnkur, %l1
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
/* line number 17*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Printing bool a */
/* line number 18*/
/* Loading a to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_3
    nop
printTrue_3:
    set         _boolT, %o1
    ba      branchEnd_3
    nop
printFalse_3:
    set         _boolF, %o1
branchEnd_3:
    call    printf
    nop
/* line number 18*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Printing bool b */
/* line number 19*/
/* Loading b to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_4
    nop
printTrue_4:
    set         _boolT, %o1
    ba      branchEnd_4
    nop
printFalse_4:
    set         _boolF, %o1
branchEnd_4:
    call    printf
    nop
/* line number 19*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
