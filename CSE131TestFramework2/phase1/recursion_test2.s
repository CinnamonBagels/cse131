                .section     ".text"
                .align 4
                .global      foobaz
foobaz:
    set         SAVE.foobaz, %g1
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
/* line number 7*/
/* Incrementing */
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         foobazRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Prepping Comparison Calculations by loading */
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         52, %l1
/* line number 8*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 8*/
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
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      foobaz_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* Printing int foobazRec */
    set         _intFmt, %o0
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foobaz
    nop
foobaz_end:
    ret 
    restore
SAVE.foobaz = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 20*/
/* Incrementing */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         barRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 20*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Prepping Comparison Calculations by loading */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         8, %l1
/* line number 22*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_1
    nop
    set         0, %l3
    ba      greaterEqual_1
    nop
greaterEqual_1:
    set         1, %l3
greaterEqualEnd_1:
/* line number 22*/
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
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    foobaz
    nop
    ba      bar_end
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Printing int barRec */
    set         _intFmt, %o0
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 35*/
/* Incrementing */
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         fooRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 35*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 37*/
/* Prepping Comparison Calculations by loading */
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 37*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 37*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    bar
    nop
    ba      foo_end
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int fooRec */
    set         _intFmt, %o0
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 12) & -8
! --globals--
                .section     ".data"
                .align 4
                 .global     fooRec,barRec,foobazRec
fooRec:         .word        0           
barRec:         .word        5           
foobazRec:      .word        0           
str_0:          .asciz       "breaking out of foobaz recursive call"
str_1:          .asciz       "recursive foobaz call "
str_2:          .asciz       "breaking out of bar recursive call"
str_3:          .asciz       "recursive bar call "
str_4:          .asciz       "breaking out of foo recursive call"
str_5:          .asciz       "recursive foo call "
str_6:          .asciz       "fooRec, in the end, is: "
str_7:          .asciz       "barRec, in the end, is: "
str_8:          .asciz       "foobazRec, in the end, is: "
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
                .global      foobaz
foobaz:
    set         SAVE.foobaz, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Incrementing */
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         foobazRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Prepping Comparison Calculations by loading */
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         52, %l1
/* line number 8*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_0
    nop
    set         0, %l3
    ba      greaterEnd_0
    nop
greater_0:
    set         1, %l3
greaterEnd_0:
/* line number 8*/
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
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      foobaz_end
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* Printing int foobazRec */
    set         _intFmt, %o0
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 14*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foobaz
    nop
foobaz_end:
    ret 
    restore
SAVE.foobaz = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      bar
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
/* line number 20*/
/* Incrementing */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         barRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 20*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 22*/
/* Prepping Comparison Calculations by loading */
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         8, %l1
/* line number 22*/
/* Starting greater than equal */
    cmp         %l0, %l1
    bge     greaterEqual_1
    nop
    set         0, %l3
    ba      greaterEqual_1
    nop
greaterEqual_1:
    set         1, %l3
greaterEqualEnd_1:
/* line number 22*/
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
/* line number 24*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 24*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    foobaz
    nop
    ba      bar_end
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 29*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 29*/
/* Done printing string. */
/* line number 29*/
/* Printing int barRec */
    set         _intFmt, %o0
    set         barRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 29*/
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 35*/
/* Incrementing */
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         fooRec, %l2
    add         %g0, %l2, %l2
    st          %l0, [%l2]
/* line number 35*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 37*/
/* Prepping Comparison Calculations by loading */
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         10, %l1
/* line number 37*/
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_2
    nop
    set         0, %l3
    ba      greaterEnd_2
    nop
greater_2:
    set         1, %l3
greaterEnd_2:
/* line number 37*/
/* Storing result of Comparison Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* line number 39*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 39*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    bar
    nop
    ba      foo_end
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* line number 44*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 44*/
/* Done printing string. */
/* line number 44*/
/* Printing int fooRec */
    set         _intFmt, %o0
    set         fooRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 44*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
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
    call    foo
    nop
/* line number 55*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 55*/
/* Done printing string. */
/* line number 55*/
/* Printing int fooRec */
    set         _intFmt, %o0
    set         fooRec, %l1
    add         %g0, %l1, %l1
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
    set         str_7, %o1
    call    printf
    nop
/* line number 56*/
/* Done printing string. */
/* line number 56*/
/* Printing int barRec */
    set         _intFmt, %o0
    set         barRec, %l1
    add         %g0, %l1, %l1
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
    set         str_8, %o1
    call    printf
    nop
/* line number 57*/
/* Done printing string. */
/* line number 57*/
/* Printing int foobazRec */
    set         _intFmt, %o0
    set         foobazRec, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 57*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
