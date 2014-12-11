! --globals--
                .section     ".data"
                .align 4
                 .global     g
g:              .word        1           
str_0:          .asciz       "fooG()"    
str_1:          .asciz       "bar()"     
str_2:          .asciz       "F0: "      
str_3:          .asciz       "fooI"      
str_4:          .asciz       " "         
str_5:          .asciz       "fooF"      
str_6:          .asciz       " "         
str_7:          .asciz       "fooB"      
str_8:          .asciz       "F1: "      
str_9:          .asciz       "fooF"      
str_10:         .asciz       " "         
str_11:         .asciz       "fooB"      
str_12:         .asciz       " "         
str_13:         .asciz       "fooI"      
str_14:         .asciz       "F2: "      
str_15:         .asciz       "fooB"      
str_16:         .asciz       " "         
str_17:         .asciz       "fooI"      
str_18:         .asciz       " "         
str_19:         .asciz       "fooF"      
str_20:         .asciz       "foo()"     
str_21:         .asciz       "ST00: "    
str_22:         .asciz       " "         
str_23:         .asciz       "OP00: "    
str_24:         .asciz       " "         
str_25:         .asciz       "ST01: "    
str_26:         .asciz       " "         
str_27:         .asciz       "OP01: "    
str_28:         .asciz       " "         
str_29:         .asciz       "ST02: "    
str_30:         .asciz       " "         
str_31:         .asciz       "OP02: "    
str_32:         .asciz       " "         
str_33:         .asciz       "ST03: "    
str_34:         .asciz       " "         
str_35:         .asciz       "OP03: "    
str_36:         .asciz       " "         
str_37:         .asciz       "ST04: "    
str_38:         .asciz       " "         
str_39:         .asciz       "OP04: "    
str_40:         .asciz       " "         
str_41:         .asciz       "ST05: "    
str_42:         .asciz       " "         
str_43:         .asciz       "OP05: "    
str_44:         .asciz       " "         
str_45:         .asciz       "ST06: "    
str_46:         .asciz       " "         
str_47:         .asciz       "OP06: "    
str_48:         .asciz       " "         
str_49:         .asciz       "ST07: "    
str_50:         .asciz       " "         
str_51:         .asciz       "OP07: "    
str_52:         .asciz       " "         
str_53:         .asciz       "ST08: "    
str_54:         .asciz       " "         
str_55:         .asciz       "OP08: "    
str_56:         .asciz       " "         
str_57:         .asciz       "ST09: "    
str_58:         .asciz       " "         
str_59:         .asciz       "OP09: "    
str_60:         .asciz       " "         
str_61:         .asciz       "ST10: "    
str_62:         .asciz       " "         
str_63:         .asciz       "OP10: "    
str_64:         .asciz       " "         
str_65:         .asciz       "ST11: "    
str_66:         .asciz       " "         
str_67:         .asciz       "OP11: "    
str_68:         .asciz       " "         
str_69:         .asciz       "ST12: "    
str_70:         .asciz       " "         
str_71:         .asciz       "BAD"       
rec_x:          .word        0           
staticGuard_rec_x:    .word        0           
str_72:         .asciz       "REC: "     
str_73:         .asciz       "AFTER"     
main_x:         .word        0           
staticGuard_main_x:    .word        0           
str_74:         .asciz       "REC: "     
str_75:         .asciz       "BAD"       

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
                .global      fooG
fooG:
    set         SAVE.fooG, %g1
    save        %sp, %g1, %sp
/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 7*/
/* Incrementing */
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         g, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
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
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    fooG
    nop
/* line number 19*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 19*/
/* Printing int fooG() */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 20*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* setting x = 4 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 27*/
/* Done. */
/* line number 29*/
/* setting y = 3 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 29*/
/* Done. */
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
/* Done printing int. */
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
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
/* line number 31*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
/* line number 31*/
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* line number 31*/
/* Done printing string. */
/* line number 31*/
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
/* line number 31*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_25, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
/* line number 32*/
/* printing string */
    set         _strFmt, %o0
    set         str_26, %o1
    call    printf
    nop
/* line number 32*/
/* Done printing string. */
/* line number 32*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_27, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 33*/
/* Post Increment */
    dec     %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 33*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 33*/
/* Done printing int. */
/* line number 33*/
/* printing string */
    set         _strFmt, %o0
    set         str_28, %o1
    call    printf
    nop
/* line number 33*/
/* Done printing string. */
/* line number 33*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 33*/
/* Post Increment */
    dec     %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 33*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 33*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_29, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
/* line number 34*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 34*/
/* Done printing int. */
/* line number 34*/
/* printing string */
    set         _strFmt, %o0
    set         str_30, %o1
    call    printf
    nop
/* line number 34*/
/* Done printing string. */
/* line number 34*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 34*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_31, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
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
/* line number 35*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 35*/
/* Done printing int. */
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_32, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 35*/
/* Post Increment */
    dec     %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 35*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 35*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_33, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Printing int x */
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
    set         str_34, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 36*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_35, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
/* line number 37*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 37*/
/* Post Increment */
    dec     %l0
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 37*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 37*/
/* Done printing int. */
/* line number 37*/
/* printing string */
    set         _strFmt, %o0
    set         str_36, %o1
    call    printf
    nop
/* line number 37*/
/* Done printing string. */
/* line number 37*/
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
/* line number 37*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 37*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_37, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
/* line number 39*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 39*/
/* Done printing int. */
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_38, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
/* line number 39*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 39*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 41*/
/* printing string */
    set         _strFmt, %o0
    set         str_39, %o1
    call    printf
    nop
/* line number 41*/
/* Done printing string. */
/* line number 41*/
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
/* line number 41*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 41*/
/* Done printing int. */
/* line number 41*/
/* printing string */
    set         _strFmt, %o0
    set         str_40, %o1
    call    printf
    nop
/* line number 41*/
/* Done printing string. */
/* line number 41*/
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
/* line number 41*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 41*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_41, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
/* line number 42*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 42*/
/* Done printing int. */
/* line number 42*/
/* printing string */
    set         _strFmt, %o0
    set         str_42, %o1
    call    printf
    nop
/* line number 42*/
/* Done printing string. */
/* line number 42*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
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
/* printing string */
    set         _strFmt, %o0
    set         str_43, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 43*/
/* Post decrement */
    inc     %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
/* line number 43*/
/* printing string */
    set         _strFmt, %o0
    set         str_44, %o1
    call    printf
    nop
/* line number 43*/
/* Done printing string. */
/* line number 43*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 43*/
/* Post decrement */
    inc     %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 43*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 43*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_45, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_46, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_47, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
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
/* line number 45*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 45*/
/* Done printing int. */
/* line number 45*/
/* printing string */
    set         _strFmt, %o0
    set         str_48, %o1
    call    printf
    nop
/* line number 45*/
/* Done printing string. */
/* line number 45*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 45*/
/* Post decrement */
    inc     %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 45*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 45*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_49, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
/* line number 46*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 46*/
/* Done printing int. */
/* line number 46*/
/* printing string */
    set         _strFmt, %o0
    set         str_50, %o1
    call    printf
    nop
/* line number 46*/
/* Done printing string. */
/* line number 46*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 46*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_51, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
/* line number 47*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 47*/
/* Post decrement */
    inc     %l0
    set         -72, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 47*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 47*/
/* Done printing int. */
/* line number 47*/
/* printing string */
    set         _strFmt, %o0
    set         str_52, %o1
    call    printf
    nop
/* line number 47*/
/* Done printing string. */
/* line number 47*/
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
/* line number 47*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 47*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 49*/
/* printing string */
    set         _strFmt, %o0
    set         str_53, %o1
    call    printf
    nop
/* line number 49*/
/* Done printing string. */
/* line number 49*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 49*/
/* Done printing int. */
/* line number 49*/
/* printing string */
    set         _strFmt, %o0
    set         str_54, %o1
    call    printf
    nop
/* line number 49*/
/* Done printing string. */
/* line number 49*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 49*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 51*/
/* printing string */
    set         _strFmt, %o0
    set         str_55, %o1
    call    printf
    nop
/* line number 51*/
/* Done printing string. */
/* line number 51*/
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
/* line number 51*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 51*/
/* Done printing int. */
/* line number 51*/
/* printing string */
    set         _strFmt, %o0
    set         str_56, %o1
    call    printf
    nop
/* line number 51*/
/* Done printing string. */
/* line number 51*/
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
/* line number 51*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 51*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 52*/
/* printing string */
    set         _strFmt, %o0
    set         str_57, %o1
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
    set         str_58, %o1
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
/* line number 53*/
/* printing string */
    set         _strFmt, %o0
    set         str_59, %o1
    call    printf
    nop
/* line number 53*/
/* Done printing string. */
/* line number 53*/
/* Incrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 53*/
/* Post Increment */
    dec     %l0
    set         -88, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 53*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 53*/
/* Done printing int. */
/* line number 53*/
/* printing string */
    set         _strFmt, %o0
    set         str_60, %o1
    call    printf
    nop
/* line number 53*/
/* Done printing string. */
/* line number 53*/
/* Decrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 53*/
/* Post decrement */
    inc     %l0
    set         -92, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 53*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 53*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 54*/
/* printing string */
    set         _strFmt, %o0
    set         str_61, %o1
    call    printf
    nop
/* line number 54*/
/* Done printing string. */
/* line number 54*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 54*/
/* Done printing int. */
/* line number 54*/
/* printing string */
    set         _strFmt, %o0
    set         str_62, %o1
    call    printf
    nop
/* line number 54*/
/* Done printing string. */
/* line number 54*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
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
    set         str_63, %o1
    call    printf
    nop
/* line number 55*/
/* Done printing string. */
/* line number 55*/
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
/* line number 55*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 55*/
/* Done printing int. */
/* line number 55*/
/* printing string */
    set         _strFmt, %o0
    set         str_64, %o1
    call    printf
    nop
/* line number 55*/
/* Done printing string. */
/* line number 55*/
/* Incrementing */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -12, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 55*/
/* Post Increment */
    dec     %l0
    set         -100, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 55*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -100, %l1
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
    set         str_65, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
/* line number 56*/
/* Printing int x */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 56*/
/* Done printing int. */
/* line number 56*/
/* printing string */
    set         _strFmt, %o0
    set         str_66, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
/* line number 56*/
/* Printing int y */
    set         _intFmt, %o0
    set         -12, %l1
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
    set         str_67, %o1
    call    printf
    nop
/* line number 57*/
/* Done printing string. */
/* line number 57*/
/* Decrementing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    dec     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 57*/
/* Post decrement */
    inc     %l0
    set         -104, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 57*/
/* Printing int Validating UnaryOp x as a IntegerType for operator: --...
 */
    set         _intFmt, %o0
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 57*/
/* Done printing int. */
/* line number 57*/
/* printing string */
    set         _strFmt, %o0
    set         str_68, %o1
    call    printf
    nop
/* line number 57*/
/* Done printing string. */
/* line number 57*/
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
/* line number 57*/
/* Printing int Validating UnaryOp y as a IntegerType for operator: ++...
 */
    set         _intFmt, %o0
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 57*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 59*/
/* printing string */
    set         _strFmt, %o0
    set         str_69, %o1
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
    set         str_70, %o1
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
    set         5, %o0
    call    exit

    nop
/* line number 64*/
/* printing string */
    set         _strFmt, %o0
    set         str_71, %o1
    call    printf
    nop
/* line number 64*/
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
/* line number 71*/
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
/* line number 73*/
/* printing string */
    set         _strFmt, %o0
    set         str_72, %o1
    call    printf
    nop
/* line number 73*/
/* Done printing string. */
/* line number 73*/
/* Printing int x */
    set         _intFmt, %o0
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 73*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 75*/
/* Prepping Comparison Calculations by loading */
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 75*/
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
/* line number 75*/
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
/* line number 80*/
/* printing string */
    set         _strFmt, %o0
    set         str_73, %o1
    call    printf
    nop
/* line number 80*/
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
/* line number 86*/
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
/* line number 88*/
/* printing string */
    set         _strFmt, %o0
    set         str_74, %o1
    call    printf
    nop
/* line number 88*/
/* Done printing string. */
/* line number 88*/
/* Printing int x */
    set         _intFmt, %o0
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 88*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 90*/
/* Prepping Comparison Calculations by loading */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
/* line number 90*/
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
/* line number 90*/
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
/* line number 98*/
/* printing string */
    set         _strFmt, %o0
    set         str_75, %o1
    call    printf
    nop
/* line number 98*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
