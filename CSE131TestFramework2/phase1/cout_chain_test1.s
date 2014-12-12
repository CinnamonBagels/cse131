! --globals--
                .section     ".data"
                .align 4
                 .global     f1,f2,f3
float_0:        .single      0r5.0       
f1:             .single      0r5.0       
float_1:        .single      0r6.0       
f2:             .single      0r6.0       
f3:             .single      0r0         
str_2:          .asciz       "Hello"     
str_3:          .asciz       " world"    
str_4:          .asciz       "To be or not to be "
str_5:          .asciz       " that is the question"
str_6:          .asciz       " whether tis nobler to suffer"
str_7:          .asciz       " the slings and arrows of outrageous"
str_8:          .asciz       " fortune." 
str_9:          .asciz       " hi again" 
str_10:         .asciz       "shakespeare! "
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
/* line number 3*/
/* Prepping Arithmetic Calculations by loading */
/* line number 3*/
/* Adding */
    set         f1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         f2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 3*/
/* Storing result of Binary Op */
    set         f1, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 5*/
/* Storing float + float into f3 */
    set         f3, %l0
    add         %g0, %l0, %l0
    set         f1, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
/* line number 8*/
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* line number 8*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* printf on int */
    set         _intFmt, %o0
    set         5, %o1
    call    printf
    nop

/* line number 9*/
/* printf on int */
    set         _intFmt, %o0
    set         6, %o1
    call    printf
    nop

/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
