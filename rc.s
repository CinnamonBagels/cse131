! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r420.25    
float_1:        .single      0r662.5     
float_2:        .single      0r1082.75   
str_3:          .asciz       "\n"        
str_4:          .asciz       "GOOD"      
str_5:          .asciz       "BAD"       
str_6:          .asciz       "GOOD"      
str_7:          .asciz       "BAD"       
str_8:          .asciz       "GOOD"      
str_9:          .asciz       "BAD"       
str_10:         .asciz       "BAD"       
str_11:         .asciz       "BAD"       

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     

                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
/* printf on int */
    set         _intFmt, %o0
    set         420, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         214, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_2, %l0
    ld          [%l0], %f0
    call    printFloat
    nop

/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* Done printing string. */
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         -11, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         -10, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         1085, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* setting huit = 8 */
    set         -4, %l0
    add         %fp, %l0, %l0
    set         8, %l1
    st          %l1, [%l0]
/* Done. */
/* setting trois = 3 */
    set         -8, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* Done. */
/* setting deux = 2 */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
/* Done. */
/* setting un = 1 */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int int and int as an IntegerType for operator: - */
    set         _intFmt, %o0
/* Loading Variable */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Printing int int and int as an IntegerType for operator: + */
    set         _intFmt, %o0
/* Loading Variable */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
/* Loading Variable */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* setting cinqcenttrentetrois = 533 */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         533, %l1
    st          %l1, [%l0]
/* Done. */
/* setting vingtetun = 21 */
    set         -24, %l0
    add         %fp, %l0, %l0
    set         21, %l1
    st          %l1, [%l0]
/* Done. */
/* setting milledeuxcenttrentequatre = 1234 */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         1234, %l1
    st          %l1, [%l0]
/* Done. */
/* setting deuxcenttrentecinq = 235 */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         235, %l1
    st          %l1, [%l0]
/* Done. */
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: |...
 */
    set         _intFmt, %o0
/* Loading Variable */
    set         null, %l1
    add         null, %l1, %l1
    ld          [%l1], %o1
/* Done loading variable. */
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
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
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 32) & -8
