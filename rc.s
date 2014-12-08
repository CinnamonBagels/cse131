! --globals--
                .section     ".data"
                .align 4
                 .global     x1,x2,y1,y2,z1,z2,x7,x8
x1:             .word        3           
x2:             .word        0           
x4:             .word        0           
x5:             .word        0           
y1:             .single      0r3.0       
y2:             .single      0r0.0       
float_0:        .single      0r4.45      
float_1:        .single      0r0.34      
y4:             .single      0r0.0       
y5:             .single      0r0.0       
float_2:        .single      0r6.66      
z1:             .word        1           
z2:             .word        0           
z4:             .word        0           
z5:             .word        0           
x7:             .word        0           
x8:             .word        0           
float_3:        .single      0r100.001   
float_4:        .single      0r1.2       

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
/* setting x0 = 2000111 */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         2000111, %l1
    st          %l1, [%l0]
/* Done. */
/* setting y0 = 100.001 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* setting float */
    set         float_3, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* Done. */
/* setting z0 = true */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int */
    set         _intFmt, %o0
    call    printf
    nop
/* Done printing int. */
/* printing float */
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* Printing bool */
/* Loading Variable */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
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
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* Storing x1 into x2 */
    set         x2, %l0
    add         %g0, %l0, %l0
    set         x1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* Storing y2 into y4 */
    set         y4, %l0
    add         %g0, %l0, %l0
    set         y2, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
/* Storing y4 into y2 */
    set         y2, %l0
    add         %g0, %l0, %l0
    set         y4, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
/* Storing y2 into y1 */
    set         y1, %l0
    add         %g0, %l0, %l0
    set         y2, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
! --storing constant z2 with value 0.0
    set         z2, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* Printing int */
    set         _intFmt, %o0
    call    printf
    nop
/* Done printing int. */
/* printing float */
/* Loading Variable */
    set         y1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* Printing bool */
/* Loading Variable */
    set         z2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
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
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant x1 with value 1.0
    set         x1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant y1 with value 1.2
    set         y1, %l0
    add         %g0, %l0, %l0
    set         float_4, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant z1 with value 1.0
    set         z1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
    ret 
    restore
SAVE.main = -(92 + 12) & -8
