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
str_16:         .asciz       "BAD"       

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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* Done printing string. */
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
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* Done printing string. */
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
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* Done printing string. */
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
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
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
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* Incrementing */
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         g, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
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
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooI
    nop
/* Saving return value */
    st          %o0, [%fp+-8]
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooF
    nop
/* Saving return value */
    st          %f0, [%fp+-12]
/* printing float fooF() */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooB
    nop
/* Saving return value */
    st          %o0, [%fp+-16]
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
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooF
    nop
/* Saving return value */
    st          %f0, [%fp+-20]
/* printing float fooF() */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooB
    nop
/* Saving return value */
    st          %o0, [%fp+-24]
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
/* Done printing bool. */
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooI
    nop
/* Saving return value */
    st          %o0, [%fp+-28]
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooB
    nop
/* Saving return value */
    st          %o0, [%fp+-32]
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
/* Done printing bool. */
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooI
    nop
/* Saving return value */
    st          %o0, [%fp+-36]
/* Printing int fooI() */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* Done printing string. */
    call    fooF
    nop
/* Saving return value */
    st          %f0, [%fp+-40]
/* printing float fooF() */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    call    fooV
    nop
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    fooG
    nop
/* Saving return value */
    st          %o0, [%fp+-44]
/* Printing int fooG() */
    set         _intFmt, %o0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Printing int g */
    set         _intFmt, %o0
    set         g, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
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
    call    bar
    nop
    set         5, %o0
    call    exit

    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
    call    foo
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
