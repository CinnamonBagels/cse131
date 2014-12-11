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
str_20:         .asciz       "BAD"       
rec_x:          .word        0           
staticGuard_rec_x:    .word        0           
str_21:         .asciz       "REC: "     
str_22:         .asciz       "AFTER"     
main_x:         .word        0           
staticGuard_main_x:    .word        0           
str_23:         .asciz       "REC: "     
str_24:         .asciz       "BAD"       

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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
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
    set         str_1, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* Done printing string. */
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
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_12, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_13, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_14, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_15, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_16, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_17, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_18, %o1
    call    printf
    nop
/* Done printing string. */
/* printing string */
    set         _strFmt, %o0
    set         str_19, %o1
    call    printf
    nop
/* Done printing string. */
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
    call    fooG
    nop
/* Saving return value */
    st          %o0, [%fp+-8]
/* Printing int fooG() */
    set         _intFmt, %o0
    set         -8, %l1
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
SAVE.bar = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
    call    bar
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_20, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
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
/* printing string */
    set         _strFmt, %o0
    set         str_21, %o1
    call    printf
    nop
/* Done printing string. */
/* Printing int x */
    set         _intFmt, %o0
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Comparison Calculations by loading */
    set         rec_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
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
    ba      endIf_1
    nop
else_0:
endIf_1:
/* printing string */
    set         _strFmt, %o0
    set         str_22, %o1
    call    printf
    nop
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
/* printing string */
    set         _strFmt, %o0
    set         str_23, %o1
    call    printf
    nop
/* Done printing string. */
/* Printing int x */
    set         _intFmt, %o0
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Comparison Calculations by loading */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         5, %l1
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
    ba      endIf_3
    nop
else_2:
endIf_3:
    call    rec
    nop
    call    foo
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_24, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
