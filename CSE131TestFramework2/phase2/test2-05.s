! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
str_0:          .asciz       "bad falseFunc!"
str_1:          .asciz       "bad trueFunc!"
str_2:          .asciz       "bad, shouldn't reach here!"
str_3:          .asciz       "good!"     
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
                .global      falseFunc
falseFunc:
    set         SAVE.falseFunc, %g1
    save        %sp, %g1, %sp
/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 6*/
/* Returning value from falseFunc */
    set         0, %i0
    ba      falseFunc_end
    nop
falseFunc_end:
    ret 
    restore
SAVE.falseFunc = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      trueFunc
trueFunc:
    set         SAVE.trueFunc, %g1
    save        %sp, %g1, %sp
/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 11*/
/* Returning value from trueFunc */
    set         1, %i0
    ba      trueFunc_end
    nop
trueFunc_end:
    ret 
    restore
SAVE.trueFunc = -(92 + 4) & -8
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
    call    trueFunc
    nop
/* line number 15*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 15*/
/* Prepping Arithmetic Calculations by loading */
    set         1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 15*/
/* ||-ing */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    cmp         %l1, %g0
    bne     orT_0
    nop
orF_0:
    set         0, %l2
    ba      orEnd_0
    nop
orT_0:
    set         1, %l2
orEnd_0:
/* line number 15*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
    call    falseFunc
    nop
/* line number 16*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 16*/
/* Prepping Arithmetic Calculations by loading */
    set         0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 16*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 16*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    ba      endIf_2
    nop
else_1:
endIf_2:
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_0:
endIf_3:
main_end:
    ret 
    restore
SAVE.main = -(92 + 20) & -8
