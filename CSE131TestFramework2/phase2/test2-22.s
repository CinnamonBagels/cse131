! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .word        10          
y:              .word        20          
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_2:          .asciz       " "         
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Incrementing */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         null, %l2
    add         null, %l2, %l2
    st          %l0, [%l2]
/* line number 7*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 8*/
/* Incrementing */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         null, %l2
    add         null, %l2, %l2
    st          %l0, [%l2]
/* line number 8*/
/* Post Increment */
    dec     %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 12*/
/* Incrementing */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         null, %l2
    add         null, %l2, %l2
    st          %l0, [%l2]
/* line number 12*/
/* Post Increment */
    dec     %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 13*/
/* Incrementing */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         null, %l2
    add         null, %l2, %l2
    st          %l0, [%l2]
/* line number 13*/
/* Post Increment */
    dec     %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 12) & -8
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
/* line number 17*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int y */
    set         _intFmt, %o0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foo
    nop
/* line number 19*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* Printing int y */
    set         _intFmt, %o0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 19*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    call    foo2
    nop
/* line number 21*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
/* line number 21*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 21*/
/* Done printing string. */
/* line number 21*/
/* Printing int y */
    set         _intFmt, %o0
    set         y, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 21*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8