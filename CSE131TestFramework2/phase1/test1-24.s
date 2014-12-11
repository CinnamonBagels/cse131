! --globals--
                .section     ".data"
                .align 4
                 .global     k,l
k:              .word        30          
l:              .word        40          
globalInit_:    .word        0           
str_0:          .asciz       " * "       
str_1:          .asciz       " = "       

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
/* line number 8*/
/* Prepping Arithmetic Calculations by loading */
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         l, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l1
/* line number 8*/
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* line number 8*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* line number 10*/
/* setting m = int * int */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 10*/
/* Done. */
/* line number 10*/
/* Printing int k */
    set         _intFmt, %o0
    set         k, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Printing int l */
    set         _intFmt, %o0
    set         l, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
/* line number 10*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 10*/
/* Done printing string. */
/* line number 10*/
/* Printing int m */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 10*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
