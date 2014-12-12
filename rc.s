! --globals--
                .section     ".data"
                .align 4
                 .global     fooRec,barRec,foobazRec
fooRec:         .word        0           
barRec:         .word        5           
foobazRec:      .word        0           
str_0:          .asciz       "breaking out of bar recursive call"
str_1:          .asciz       "recursive bar call "
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
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Incrementing */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         barRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 9*/
/* Prepping Comparison Calculations by loading */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         8, %l1
/* line number 9*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_0
    nop
    set         0, %l3
    ba      greaterEqual_0
    nop
greaterEqual_0:
    set         1, %l3
greaterEqualEnd_0:
/* line number 9*/
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
/* line number 11*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 11*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      bar_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 15*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 15*/
/* Done printing string. */
/* line number 15*/
/* Printing int barRec */
    set         _intFmt, %o0
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 15*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    bar
    nop
bar_end:
    ret 
    restore
SAVE.bar = -(92 + 12) & -8
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
! --storing constant fooRec with value 1.0
    set         fooRec, %l0
    add         %g0, %l0, %l0
    set         fooRec, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant foobazRec with value 50.0
    set         foobazRec, %l0
    add         %g0, %l0, %l0
    set         foobazRec, %l0
    add         %g0, %l0, %l0
    set         50, %l1
    st          %l1, [%l0]
    call    bar
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
