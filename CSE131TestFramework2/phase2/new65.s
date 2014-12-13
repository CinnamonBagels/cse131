! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r1082.75   
float_1:        .single      0r662.5     
float_2:        .single      0r420.25    
float_3:        .single      0r1082.75   
str_4:          .asciz       "\n"        
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
/* line number 5*/
/* Prepping Arithmetic Calculations by loading */
/* line number 5*/
/* Loading 4 to %l0 */
    set         4, %l0
/* line number 5*/
/* Loading c1 to %l1 */
    set         210, %l1
/* line number 5*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 5*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* Prepping Arithmetic Calculations by loading */
/* line number 6*/
/* Loading c1 to %l0 */
    set         210, %l0
/* line number 6*/
/* Loading 210 to %l1 */
    set         210, %l1
/* line number 6*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 6*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 6*/
/* printf on int */
    set         _intFmt, %o0
    set         420, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 7*/
/* printf on int */
    set         _intFmt, %o0
    set         214, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Prepping Arithmetic Calculations by loading */
/* line number 9*/
/* Adding */
/* line number 9*/
/* Storing variable r1 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_2, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 9*/
/* Storing variable 662.50 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 9*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 9*/
/* Storing result of Binary Op */
    set         float_0, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
    set         float_3, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* line number 9*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 9*/
/* Done printing string. */
/* line number 10*/
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
