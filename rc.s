! --globals--
                .section     ".data"
                .align 4
                 .global     g
str_0:          .asciz       "fooI():"   
str_1:          .asciz       "fooF():"   
float_2:        .single      0r3.14      
str_3:          .asciz       "fooB():"   
str_4:          .asciz       "fooV()"    
g:              .word        1           
str_5:          .asciz       "fooG()"    
str_6:          .asciz       "bar()"     
str_7:          .asciz       "F0: "      
str_8:          .asciz       " "         
str_9:          .asciz       " "         
str_10:         .asciz       "F1: "      
str_11:         .asciz       " "         
str_12:         .asciz       " "         
str_13:         .asciz       "F2: "      
str_14:         .asciz       " "         
str_15:         .asciz       " "         
str_16:         .asciz       "foo()"     
str_17:         .asciz       "ST00: "    
str_18:         .asciz       " "         
str_19:         .asciz       "OP00: "    
str_20:         .asciz       " "         
str_21:         .asciz       "ST01: "    
str_22:         .asciz       " "         
str_23:         .asciz       "OP01: "    
str_24:         .asciz       " "         
str_25:         .asciz       "ST02: "    
str_26:         .asciz       " "         
str_27:         .asciz       "OP02: "    
str_28:         .asciz       " "         
str_29:         .asciz       "ST03: "    
str_30:         .asciz       " "         
str_31:         .asciz       "OP03: "    
str_32:         .asciz       " "         
str_33:         .asciz       "ST04: "    
str_34:         .asciz       " "         
str_35:         .asciz       "OP04: "    
str_36:         .asciz       " "         
str_37:         .asciz       "ST05: "    
str_38:         .asciz       " "         
str_39:         .asciz       "OP05: "    
str_40:         .asciz       " "         
str_41:         .asciz       "ST06: "    
str_42:         .asciz       " "         
str_43:         .asciz       "OP06: "    
str_44:         .asciz       " "         
str_45:         .asciz       "ST07: "    
str_46:         .asciz       " "         
str_47:         .asciz       "OP07: "    
str_48:         .asciz       " "         
str_49:         .asciz       "ST08: "    
str_50:         .asciz       " "         
str_51:         .asciz       "OP08: "    
str_52:         .asciz       " "         
str_53:         .asciz       "ST09: "    
str_54:         .asciz       " "         
str_55:         .asciz       "OP09: "    
str_56:         .asciz       " "         
str_57:         .asciz       "ST10: "    
str_58:         .asciz       " "         
str_59:         .asciz       "OP10: "    
str_60:         .asciz       " "         
str_61:         .asciz       "ST11: "    
str_62:         .asciz       " "         
str_63:         .asciz       "OP11: "    
str_64:         .asciz       " "         
str_65:         .asciz       "ST12: "    
str_66:         .asciz       " "         
str_67:         .asciz       "BAD"       
rec_x:          .word        0           
staticGuard_rec_x:    .word        0           
str_68:         .asciz       "REC: "     
str_69:         .asciz       "AFTER"     
main_x:         .word        0           
staticGuard_main_x:    .word        0           
str_70:         .asciz       "REC: "     
str_71:         .asciz       "BAD"       

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
                .global      fooI
fooI:
    set         SAVE.fooI, %g1
    save        %sp, %g1, %sp
/* line number 2*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 2*/
/* Done printing string. */
/* line number 5*/
/* Returning value from fooI */
    set         42, %i0
    ba      fooI_end
    nop
fooI_end:
    ret 
    restore
SAVE.fooI = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      fooF
fooF:
    set         SAVE.fooF, %g1
    save        %sp, %g1, %sp
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 11*/
/* Returning value from fooF */
    set         float_2, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    ba      fooF_end
    nop
fooF_end:
    ret 
    restore
SAVE.fooF = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      fooB
fooB:
    set         SAVE.fooB, %g1
    save        %sp, %g1, %sp
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 17*/
/* Returning value from fooB */
    set         1, %i0
    ba      fooB_end
    nop
fooB_end:
    ret 
    restore
SAVE.fooB = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      fooV
fooV:
    set         SAVE.fooV, %g1
    save        %sp, %g1, %sp
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      fooV_end
    nop
fooV_end:
    ret 
    restore
SAVE.fooV = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      fooG
fooG:
    set         SAVE.fooG, %g1
    save        %sp, %g1, %sp
/* line number 28*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 28*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* Incrementing */
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         g, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 30*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 31*/
/* Returning value from fooG */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %i0
    ba      fooG_end
    nop
fooG_end:
    ret 
    restore
SAVE.fooG = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    call    fooI
    nop
/* line number 36*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 36*/
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 36*/
/* Done printing int. */
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    call    fooF
    nop
/* line number 36*/
/* Saving return value */
    st          %f0, [%fp+-12]
/* line number 36*/
/* printing float fooF() */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 36*/
/* Done printing float. */
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
    call    fooB
    nop
/* line number 36*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 36*/
/* Printing bool fooB() */
    set         -16, %l1
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
/* line number 36*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    call    fooF
    nop
/* line number 37*/
/* Saving return value */
    st          %f0, [%fp+-20]
/* line number 37*/
/* printing float fooF() */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 37*/
/* Done printing float. */
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    call    fooB
    nop
/* line number 37*/
/* Saving return value */
    st          %o0, [%fp+-24]
/* line number 37*/
/* Printing bool fooB() */
    set         -24, %l1
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
/* line number 37*/
/* Done printing bool. */
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
    call    fooI
    nop
/* line number 37*/
/* Saving return value */
    st          %o0, [%fp+-28]
/* line number 37*/
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 37*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    call    fooB
    nop
/* line number 38*/
/* Saving return value */
    st          %o0, [%fp+-32]
/* line number 38*/
/* Printing bool fooB() */
    set         -32, %l1
    add         %fp, %l1, %l1
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
/* line number 38*/
/* Done printing bool. */
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    call    fooI
    nop
/* line number 38*/
/* Saving return value */
    st          %o0, [%fp+-36]
/* line number 38*/
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 38*/
/* Done printing int. */
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    call    fooF
    nop
/* line number 38*/
/* Saving return value */
    st          %f0, [%fp+-40]
/* line number 38*/
/* printing float fooF() */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 38*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    call    fooV
    nop
/* line number 41*/
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 41*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    fooG
    nop
/* line number 42*/
/* Saving return value */
    st          %o0, [%fp+-44]
/* line number 42*/
/* Printing int fooG() */
    set         _intFmt, %o0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 42*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 43*/
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 44) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 50*/
/* setting x = 4 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 50*/
/* Done. */
/* line number 52*/
/* setting y = 3 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 52*/
/* Done. */
/* line number 52*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 52*/
/* Done printing string. */
/* line number 52*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 52*/
/* Done printing int. */
/* line number 52*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 52*/
/* Done printing string. */
/* line number 52*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 52*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 54*/
/* Done printing string. */
/* line number 54*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -16, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 54*/
/* Done printing int. */
/* line number 54*/
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* line number 54*/
/* Done printing string. */
/* line number 54*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -20, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 54*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 54*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 55*/
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* line number 55*/
/* Done printing string. */
/* line number 55*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 55*/
/* Done printing int. */
/* line number 55*/
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
/* line number 55*/
/* Done printing string. */
/* line number 55*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 55*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 56*/
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
/* line number 56*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 56*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 56*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 56*/
/* Done printing int. */
/* line number 56*/
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
/* line number 56*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 56*/
/* Post Increment */
    dec     %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 56*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 56*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 57*/
/* printing string */
    set         _strFmt, %o0
    set         str_25, %o1
    call    printf
    nop
/* line number 57*/
/* Done printing string. */
/* line number 57*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 57*/
/* Done printing int. */
/* line number 57*/
/* printing string */
    set         _strFmt, %o0
    set         str_26, %o1
    call    printf
    nop
/* line number 57*/
/* Done printing string. */
/* line number 57*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 57*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 58*/
/* printing string */
    set         _strFmt, %o0
    set         str_27, %o1
    call    printf
    nop
/* line number 58*/
/* Done printing string. */
/* line number 58*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -32, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 58*/
/* Done printing int. */
/* line number 58*/
/* printing string */
    set         _strFmt, %o0
    set         str_28, %o1
    call    printf
    nop
/* line number 58*/
/* Done printing string. */
/* line number 58*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 58*/
/* Post Increment */
    dec     %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 58*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 58*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 59*/
/* printing string */
    set         _strFmt, %o0
    set         str_29, %o1
    call    printf
    nop
/* line number 59*/
/* Done printing string. */
/* line number 59*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 59*/
/* Done printing int. */
/* line number 59*/
/* printing string */
    set         _strFmt, %o0
    set         str_30, %o1
    call    printf
    nop
/* line number 59*/
/* Done printing string. */
/* line number 59*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 59*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 60*/
/* printing string */
    set         _strFmt, %o0
    set         str_31, %o1
    call    printf
    nop
/* line number 60*/
/* Done printing string. */
/* line number 60*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 60*/
/* Post Increment */
    dec     %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 60*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 60*/
/* Done printing int. */
/* line number 60*/
/* printing string */
    set         _strFmt, %o0
    set         str_32, %o1
    call    printf
    nop
/* line number 60*/
/* Done printing string. */
/* line number 60*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 60*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 60*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 62*/
/* printing string */
    set         _strFmt, %o0
    set         str_33, %o1
    call    printf
    nop
/* line number 62*/
/* Done printing string. */
/* line number 62*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 62*/
/* Done printing int. */
/* line number 62*/
/* printing string */
    set         _strFmt, %o0
    set         str_34, %o1
    call    printf
    nop
/* line number 62*/
/* Done printing string. */
/* line number 62*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 62*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 64*/
/* printing string */
    set         _strFmt, %o0
    set         str_35, %o1
    call    printf
    nop
/* line number 64*/
/* Done printing string. */
/* line number 64*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -48, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 64*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 64*/
/* Done printing int. */
/* line number 64*/
/* printing string */
    set         _strFmt, %o0
    set         str_36, %o1
    call    printf
    nop
/* line number 64*/
/* Done printing string. */
/* line number 64*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -52, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 64*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 64*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 65*/
/* printing string */
    set         _strFmt, %o0
    set         str_37, %o1
    call    printf
    nop
/* line number 65*/
/* Done printing string. */
/* line number 65*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 65*/
/* Done printing int. */
/* line number 65*/
/* printing string */
    set         _strFmt, %o0
    set         str_38, %o1
    call    printf
    nop
/* line number 65*/
/* Done printing string. */
/* line number 65*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 65*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 66*/
/* printing string */
    set         _strFmt, %o0
    set         str_39, %o1
    call    printf
    nop
/* line number 66*/
/* Done printing string. */
/* line number 66*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 66*/
/* Post decrement */
    inc     %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 66*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 66*/
/* Done printing int. */
/* line number 66*/
/* printing string */
    set         _strFmt, %o0
    set         str_40, %o1
    call    printf
    nop
/* line number 66*/
/* Done printing string. */
/* line number 66*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 66*/
/* Post decrement */
    inc     %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 66*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 66*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 67*/
/* printing string */
    set         _strFmt, %o0
    set         str_41, %o1
    call    printf
    nop
/* line number 67*/
/* Done printing string. */
/* line number 67*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 67*/
/* Done printing int. */
/* line number 67*/
/* printing string */
    set         _strFmt, %o0
    set         str_42, %o1
    call    printf
    nop
/* line number 67*/
/* Done printing string. */
/* line number 67*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 67*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 68*/
/* printing string */
    set         _strFmt, %o0
    set         str_43, %o1
    call    printf
    nop
/* line number 68*/
/* Done printing string. */
/* line number 68*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -64, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 68*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 68*/
/* Done printing int. */
/* line number 68*/
/* printing string */
    set         _strFmt, %o0
    set         str_44, %o1
    call    printf
    nop
/* line number 68*/
/* Done printing string. */
/* line number 68*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 68*/
/* Post decrement */
    inc     %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 68*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 68*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 69*/
/* printing string */
    set         _strFmt, %o0
    set         str_45, %o1
    call    printf
    nop
/* line number 69*/
/* Done printing string. */
/* line number 69*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 69*/
/* Done printing int. */
/* line number 69*/
/* printing string */
    set         _strFmt, %o0
    set         str_46, %o1
    call    printf
    nop
/* line number 69*/
/* Done printing string. */
/* line number 69*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 69*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 70*/
/* printing string */
    set         _strFmt, %o0
    set         str_47, %o1
    call    printf
    nop
/* line number 70*/
/* Done printing string. */
/* line number 70*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 70*/
/* Post decrement */
    inc     %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 70*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 70*/
/* Done printing int. */
/* line number 70*/
/* printing string */
    set         _strFmt, %o0
    set         str_48, %o1
    call    printf
    nop
/* line number 70*/
/* Done printing string. */
/* line number 70*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -76, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 70*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 70*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 72*/
/* printing string */
    set         _strFmt, %o0
    set         str_49, %o1
    call    printf
    nop
/* line number 72*/
/* Done printing string. */
/* line number 72*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 72*/
/* Done printing int. */
/* line number 72*/
/* printing string */
    set         _strFmt, %o0
    set         str_50, %o1
    call    printf
    nop
/* line number 72*/
/* Done printing string. */
/* line number 72*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 72*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 74*/
/* printing string */
    set         _strFmt, %o0
    set         str_51, %o1
    call    printf
    nop
/* line number 74*/
/* Done printing string. */
/* line number 74*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -80, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 74*/
/* Done printing int. */
/* line number 74*/
/* printing string */
    set         _strFmt, %o0
    set         str_52, %o1
    call    printf
    nop
/* line number 74*/
/* Done printing string. */
/* line number 74*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -84, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 74*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 74*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 75*/
/* printing string */
    set         _strFmt, %o0
    set         str_53, %o1
    call    printf
    nop
/* line number 75*/
/* Done printing string. */
/* line number 75*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 75*/
/* Done printing int. */
/* line number 75*/
/* printing string */
    set         _strFmt, %o0
    set         str_54, %o1
    call    printf
    nop
/* line number 75*/
/* Done printing string. */
/* line number 75*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 75*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 76*/
/* printing string */
    set         _strFmt, %o0
    set         str_55, %o1
    call    printf
    nop
/* line number 76*/
/* Done printing string. */
/* line number 76*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 76*/
/* Post Increment */
    dec     %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 76*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 76*/
/* Done printing int. */
/* line number 76*/
/* printing string */
    set         _strFmt, %o0
    set         str_56, %o1
    call    printf
    nop
/* line number 76*/
/* Done printing string. */
/* line number 76*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 76*/
/* Post decrement */
    inc     %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 76*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 76*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 77*/
/* printing string */
    set         _strFmt, %o0
    set         str_57, %o1
    call    printf
    nop
/* line number 77*/
/* Done printing string. */
/* line number 77*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 77*/
/* Done printing int. */
/* line number 77*/
/* printing string */
    set         _strFmt, %o0
    set         str_58, %o1
    call    printf
    nop
/* line number 77*/
/* Done printing string. */
/* line number 77*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 77*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 78*/
/* printing string */
    set         _strFmt, %o0
    set         str_59, %o1
    call    printf
    nop
/* line number 78*/
/* Done printing string. */
/* line number 78*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -96, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 78*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 78*/
/* Done printing int. */
/* line number 78*/
/* printing string */
    set         _strFmt, %o0
    set         str_60, %o1
    call    printf
    nop
/* line number 78*/
/* Done printing string. */
/* line number 78*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 78*/
/* Post Increment */
    dec     %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 78*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -100, %l1
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
    set         str_61, %o1
    call    printf
    nop
/* line number 79*/
/* Done printing string. */
/* line number 79*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 79*/
/* Done printing int. */
/* line number 79*/
/* printing string */
    set         _strFmt, %o0
    set         str_62, %o1
    call    printf
    nop
/* line number 79*/
/* Done printing string. */
/* line number 79*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
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
    set         str_63, %o1
    call    printf
    nop
/* line number 80*/
/* Done printing string. */
/* line number 80*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 80*/
/* Post decrement */
    inc     %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 80*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 80*/
/* Done printing int. */
/* line number 80*/
/* printing string */
    set         _strFmt, %o0
    set         str_64, %o1
    call    printf
    nop
/* line number 80*/
/* Done printing string. */
/* line number 80*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -108, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 80*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 80*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 82*/
/* printing string */
    set         _strFmt, %o0
    set         str_65, %o1
    call    printf
    nop
/* line number 82*/
/* Done printing string. */
/* line number 82*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 82*/
/* Done printing int. */
/* line number 82*/
/* printing string */
    set         _strFmt, %o0
    set         str_66, %o1
    call    printf
    nop
/* line number 82*/
/* Done printing string. */
/* line number 82*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 82*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    set         5, %o0
    call    exit

    nop
/* line number 87*/
/* printing string */
    set         _strFmt, %o0
    set         str_67, %o1
    call    printf
    nop
/* line number 87*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 108) & -8
                .section     ".text"
                .align 4
                .global      rec
rec:
    set         SAVE.rec, %g1
    save        %sp, %g1, %sp
    set         staticGuard_rec_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_rec_x
    nop
! --storing constant x with value 0.0
    set         rec_x, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    set         staticGuard_rec_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_rec_x:
/* line number 94*/
/* Incrementing */
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         rec_x, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 96*/
/* printing string */
    set         _strFmt, %o0
    set         str_68, %o1
    call    printf
    nop
/* line number 96*/
/* Done printing string. */
/* line number 96*/
/* Printing int x */
    set         _intFmt, %o0
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 96*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 98*/
/* Prepping Comparison Calculations by loading */
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 98*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 98*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
    call    rec
    nop
    ba      rec_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 103*/
/* printing string */
    set         _strFmt, %o0
    set         str_69, %o1
    call    printf
    nop
/* line number 103*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
rec_end:
    ret 
    restore
SAVE.rec = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
! --storing constant x with value 0.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
/* line number 109*/
/* Incrementing */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         main_x, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 111*/
/* printing string */
    set         _strFmt, %o0
    set         str_70, %o1
    call    printf
    nop
/* line number 111*/
/* Done printing string. */
/* line number 111*/
/* Printing int x */
    set         _intFmt, %o0
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 111*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 113*/
/* Prepping Comparison Calculations by loading */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 113*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_1
    nop
    set         0, %l3
    ba      lessEnd_1
    nop
less_1:
    set         1, %l3
lessEnd_1:
/* line number 113*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
    call    main
    nop
    ba      main_end
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
    call    rec
    nop
    call    foo
    nop
/* line number 121*/
/* printing string */
    set         _strFmt, %o0
    set         str_71, %o1
    call    printf
    nop
/* line number 121*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
