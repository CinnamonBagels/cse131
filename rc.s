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
str_3:          .asciz       "Hello"     
str_4:          .asciz       "World"     
float_5:        .single      0r4.34      
float_6:        .single      0r4.34      
float_7:        .single      0r4.45      
float_8:        .single      0r-6.66     
float_9:        .single      0r100.001   
float_10:       .single      0r1.2       
main_cx3:       .word        0           
main_cx6:       .word        0           
main_cy3:       .single      0r0.0       
main_cy6:       .single      0r0.0       
float_11:       .single      0r4.45      
float_12:       .single      0r4.45      
main_cz3:       .word        0           
main_cz6:       .word        0           

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
    set         x4, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_x4
    nop
! --storing constant x4 with value -5.0
    set         x4, %l0
    add         %g0, %l0, %l0
    set         -5, %l1
    st          %l1, [%l0]
    set         x4, %l2
    set         1, %l3
    st          %l3, [%l2]
static_x4:
    set         x5, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_x5
    nop
    set         x5, %l2
    set         1, %l3
    st          %l3, [%l2]
static_x5:
    set         y4, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_y4
    nop
! --storing constant y4 with value 0.34
    set         y4, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
    set         y4, %l2
    set         1, %l3
    st          %l3, [%l2]
static_y4:
    set         y5, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_y5
    nop
    set         y5, %l2
    set         1, %l3
    st          %l3, [%l2]
static_y5:
    set         z4, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_z4
    nop
! --storing constant z4 with value 0.0
    set         z4, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    set         z4, %l2
    set         1, %l3
    st          %l3, [%l2]
static_z4:
    set         z5, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_z5
    nop
    set         z5, %l2
    set         1, %l3
    st          %l3, [%l2]
static_z5:
/* Storing x1 into x7 */
    set         x7, %l0
    add         %g0, %l0, %l0
    set         x1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
! --storing constant x2 with value 0.0
    set         x2, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* Storing x2 into x2 */
    set         x2, %l0
    add         %g0, %l0, %l0
    set         x2, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* Storing x2 into x8 */
    set         x8, %l0
    add         %g0, %l0, %l0
    set         x2, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* setting x1 = 5 */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int x7 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x7, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x8 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x8, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         float_6, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* setting x2 = 4 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

/* Printing int x4 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int x5 */
    set         _intFmt, %o0
/* Loading Variable */
    set         x5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printf on int */
    set         _intFmt, %o0
    set         6, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printing float */
/* Loading Variable */
    set         y1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* printing float */
/* Loading Variable */
    set         y2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         float_7, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* printing float */
/* Loading Variable */
    set         y4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* printing float */
/* Loading Variable */
    set         y5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         float_8, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop
/* Printing bool */
/* Loading Variable */
    set         z1, %l1
    add         %g0, %l1, %l1
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
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

/* Printing bool */
/* Loading Variable */
    set         z4, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
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
/* Done printing bool. */
/* Printing bool */
/* Loading Variable */
    set         z5, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
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
/* Done printing bool. */
    set         _strFmt, %o0
    set         _boolT, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* setting x0 = 2000111 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         2000111, %l1
    st          %l1, [%l0]
/* Done. */
/* setting y0 = 100.001 */
    set         -28, %l0
    add         %fp, %l0, %l0
/* setting float */
    set         float_9, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* Done. */
/* setting z0 = true */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int x0 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printing float */
/* Loading Variable */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* Printing bool */
/* Loading Variable */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
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
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* Storing x1 into x2 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         -4, %l2
    add         %fp, %l2, %l2
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
/* Printing int x2 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printing float */
/* Loading Variable */
    set         y1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
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
    be      printFalse_5
    nop
printTrue_5:
    set         _boolT, %o1
    ba      branchEnd_5
    nop
printFalse_5:
    set         _boolF, %o1
branchEnd_5:
    call    printf
    nop
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant x1 with value 1.0
    set         -4, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant y1 with value 1.2
    set         y1, %l0
    add         %g0, %l0, %l0
    set         float_10, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant z1 with value 1.0
    set         z1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printing float */
/* Loading Variable */
    set         y1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* Printing bool */
/* Loading Variable */
    set         z1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_6
    nop
printTrue_6:
    set         _boolT, %o1
    ba      branchEnd_6
    nop
printFalse_6:
    set         _boolF, %o1
branchEnd_6:
    call    printf
    nop
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* setting cx1 = x3 */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* Done. */
    set         main_cx3, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cx3
    nop
! --storing constant cx3 with value 4.0
    set         main_cx3, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
    set         main_cx3, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cx3:
/* setting cx5 = x1 */
    set         -40, %l0
    add         %fp, %l0, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* Done. */
    set         main_cx6, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cx6
    nop
/* Storing x1 into cx6 */
    set         main_cx6, %l0
    add         %g0, %l0, %l0
    set         -4, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
    set         main_cx6, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cx6:
/* Printing int cx1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

/* Printing int cx3 */
    set         _intFmt, %o0
/* Loading Variable */
    set         main_cx3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

/* Printing int cx5 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
/* Printing int cx6 */
    set         _intFmt, %o0
/* Loading Variable */
    set         main_cx6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* setting cy1 = y3 */
    set         -44, %l0
    add         %fp, %l0, %l0
/* setting float */
    set         float_0, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* Done. */
    set         main_cy3, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cy3
    nop
! --storing constant cy3 with value 4.45
    set         main_cy3, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
    set         main_cy3, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cy3:
/* setting cy5 = y1 */
    set         -48, %l0
    add         %fp, %l0, %l0
    set         y1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* Done. */
    set         main_cy6, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cy6
    nop
/* Storing y1 into cy6 */
    set         main_cy6, %l0
    add         %g0, %l0, %l0
    set         y1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         main_cy6, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cy6:
/* printing float */
/* Loading Variable */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         float_11, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* printing float */
/* Loading Variable */
    set         main_cy3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         float_12, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* printing float */
/* Loading Variable */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
/* printing float */
/* Loading Variable */
    set         main_cy6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
/* Done loading variable. */
    call    printFloat
    nop
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* setting cz1 = z3 */
    set         -52, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* Done. */
    set         main_cz3, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cz3
    nop
! --storing constant cz3 with value 0.0
    set         main_cz3, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    set         main_cz3, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cz3:
/* setting cz5 = z1 */
    set         -56, %l0
    add         %fp, %l0, %l0
    set         z1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* Done. */
    set         main_cz6, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     static_main_cz6
    nop
/* Storing z1 into cz6 */
    set         main_cz6, %l0
    add         %g0, %l0, %l0
    set         z1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
    set         main_cz6, %l2
    set         1, %l3
    st          %l3, [%l2]
static_main_cz6:
/* Printing bool */
/* Loading Variable */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_7
    nop
printTrue_7:
    set         _boolT, %o1
    ba      branchEnd_7
    nop
printFalse_7:
    set         _boolF, %o1
branchEnd_7:
    call    printf
    nop
/* Done printing bool. */
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

/* Printing bool */
/* Loading Variable */
    set         main_cz3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_8
    nop
printTrue_8:
    set         _boolT, %o1
    ba      branchEnd_8
    nop
printFalse_8:
    set         _boolF, %o1
branchEnd_8:
    call    printf
    nop
/* Done printing bool. */
    set         _strFmt, %o0
    set         _boolF, %o1
    call    printf
    nop

/* Printing bool */
/* Loading Variable */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_9
    nop
printTrue_9:
    set         _boolT, %o1
    ba      branchEnd_9
    nop
printFalse_9:
    set         _boolF, %o1
branchEnd_9:
    call    printf
    nop
/* Done printing bool. */
/* Printing bool */
/* Loading Variable */
    set         main_cz6, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
/* Done loading variable. */
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_10
    nop
printTrue_10:
    set         _boolT, %o1
    ba      branchEnd_10
    nop
printFalse_10:
    set         _boolF, %o1
branchEnd_10:
    call    printf
    nop
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* Storing x2 into x1 */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    ld          [%l2], %l1
    st          %l1, [%l0]
/* Printing int x1 */
    set         _intFmt, %o0
/* Loading Variable */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 56) & -8
