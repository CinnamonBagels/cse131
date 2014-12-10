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
arrayOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d)."

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
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -1, %l1
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Adding */
    add         %l0, %l1, %l3
/* Storing result of Binary Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Subtracting */
    sub         %l0, %l1, %l3
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Printing int int - int */
    set         _intFmt, %o0
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -1, %l1
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Subtracting */
    sub         %l0, %l1, %l3
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Multiplying */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .mul
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Dividing */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .div
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Adding */
    add         %l0, %l1, %l3
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Printing int int + int */
    set         _intFmt, %o0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Arithmetic Calculations by loading */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Modding */
    mov         %l0, %o0
    mov         %l1, %o1
    call    .rem
    nop
    mov         %o0, %l0
/* Storing result of Binary Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l0, [%l4]
/* Printing int Validating int and int as an IntegerType for operator: %...
 */
    set         _intFmt, %o0
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* setting cinqcenttrentetrois = 533 */
    set         -64, %l0
    add         %fp, %l0, %l0
    set         533, %l1
    st          %l1, [%l0]
/* Done. */
/* setting vingtetun = 21 */
    set         -68, %l0
    add         %fp, %l0, %l0
    set         21, %l1
    st          %l1, [%l0]
/* Done. */
/* setting milledeuxcenttrentequatre = 1234 */
    set         -72, %l0
    add         %fp, %l0, %l0
    set         1234, %l1
    st          %l1, [%l0]
/* Done. */
/* setting deuxcenttrentecinq = 235 */
    set         -76, %l0
    add         %fp, %l0, %l0
    set         235, %l1
    st          %l1, [%l0]
/* Done. */
/* Prepping Arithmetic Calculations by loading */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Anding */
    and         %l0, %l1, %l2
/* Storing result of Binary Op */
    set         -80, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Xoring */
    xor         %l0, %l1, %l2
/* Storing result of Binary Op */
    set         -84, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* Prepping Arithmetic Calculations by loading */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -84, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Oring */
    or          %l0, %l1, %l2
/* Storing result of Binary Op */
    set         -88, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* Printing int Validating BitwiseOp int and int as an IntegerType for operator: |...
 */
    set         _intFmt, %o0
    set         -88, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %o1
    call    printf
    nop
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* Prepping Comparison Calculations by loading */
    set         300, %l0
    set         200, %l1
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
/* Storing result of Comparison Op */
    set         -92, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -92, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* Prepping Comparison Calculations by loading */
    set         210, %l0
    set         210, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* Storing result of Comparison Op */
    set         -96, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -96, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* Prepping Comparison Calculations by loading */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
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
/* Storing result of Comparison Op */
    set         -100, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -100, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_4
    nop
if_4:
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_5
    nop
else_4:
endIf_5:
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_3
    nop
    set         0, %l3
    ba      greaterEnd_3
    nop
greater_3:
    set         1, %l3
greaterEnd_3:
/* Storing result of Comparison Op */
    set         -104, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -104, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_6
    nop
if_6:
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_7
    nop
else_6:
endIf_7:
/* Prepping Comparison Calculations by loading */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* Storing result of Comparison Op */
    set         -108, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -108, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_8
    nop
if_8:
/* Prepping Comparison Calculations by loading */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_5
    nop
    set         0, %l3
    ba      greaterEnd_5
    nop
greater_5:
    set         1, %l3
greaterEnd_5:
/* Storing result of Comparison Op */
    set         -112, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -112, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_9
    nop
if_9:
/* printing string */
    set         _strFmt, %o0
    set         str_8, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_10
    nop
else_9:
endIf_10:
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_6
    nop
    set         0, %l3
    ba      greaterEnd_6
    nop
greater_6:
    set         1, %l3
greaterEnd_6:
/* Storing result of Comparison Op */
    set         -116, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -116, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_11
    nop
if_11:
/* printing string */
    set         _strFmt, %o0
    set         str_9, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_12
    nop
else_11:
endIf_12:
    ba      endIf_13
    nop
else_8:
endIf_13:
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_7
    nop
    set         0, %l3
    ba      greaterEnd_7
    nop
greater_7:
    set         1, %l3
greaterEnd_7:
/* Storing result of Comparison Op */
    set         -120, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -120, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_14
    nop
if_14:
/* Prepping Comparison Calculations by loading */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_8
    nop
    set         0, %l3
    ba      greaterEnd_8
    nop
greater_8:
    set         1, %l3
greaterEnd_8:
/* Storing result of Comparison Op */
    set         -124, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -124, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_15
    nop
if_15:
/* printing string */
    set         _strFmt, %o0
    set         str_10, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_16
    nop
else_15:
endIf_16:
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l1
/* Starting greater than */
    cmp         %l0, %l1
    bg      greater_9
    nop
    set         0, %l3
    ba      greaterEnd_9
    nop
greater_9:
    set         1, %l3
greaterEnd_9:
/* Storing result of Comparison Op */
    set         -128, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -128, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    mov         %l1, %l0
    cmp         %l0, %g0
    be      else_17
    nop
if_17:
/* printing string */
    set         _strFmt, %o0
    set         str_11, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_18
    nop
else_17:
endIf_18:
    ba      endIf_19
    nop
else_14:
endIf_19:
    ret 
    restore
SAVE.main = -(92 + 128) & -8
