! --globals--
                .section     ".data"
                .align 4
float_2:        .single      0r3.33      
float_4:        .single      0r4.44      
float_6:        .single      0r5.55      
str_0:          .asciz       " "         
str_1:          .asciz       " "         
str_3:          .asciz       " "         
str_5:          .asciz       " "         
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
/* line number 4*/
/* printf on int */
    set         _intFmt, %o0
    set         3, %o1
    call    printf
    nop

/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

/* line number 4*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 4*/
/* Done printing string. */
/* line number 4*/
/* printf on int */
    set         _intFmt, %o0
    set         5, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_2, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
    set         float_4, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 5*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 5*/
/* Done printing string. */
    set         float_6, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
