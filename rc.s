! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     arr
float_0:        .single      0r2.99      
float_1:        .single      0r3.01      
float_3:        .single      0r18.99     
float_4:        .single      0r19.01     
str_2:          .asciz       "C"         
str_5:          .asciz       "B"         
str_6:          .asciz       " "         
str_7:          .asciz       " "         
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
arr:            .skip        12          


! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     
arrayOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d)."
nullptrexception:    .asciz       "Attempt to dereference NULL pointer."

                .section     ".text"
                .align 4
                .global      output
output:
    set         SAVE.output, %g1
    save        %sp, %g1, %sp
/* Storing parameter val */
    st          %i0, [%fp+68]
/* printing float STO.VarSTO@b05acd */
/* Loading val to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
output_end:
    ret 
    restore
SAVE.output = -(92 + 4) & -8
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
/* setting i = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* Done. */
while_0:
/* Incrementing */
/* Loading i to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* Prepping Comparison Calculations by loading */
/* Loading Validating UnaryOp i as a IntegerType for operator: ++...
 to %l0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Loading 3 to %l1 */
    set         3, %l1
/* Starting Less than Equal */
    cmp         %l0, %l1
    ble     lessEqual_0
    nop
    set         0, %l3
    ba      lessEqualEnd_0
    nop
lessEqual_0:
    set         1, %l3
lessEqualEnd_0:
/* Storing result of Comparison Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Loading Validating ComparisonOp int and int as a BooleanType for operator: <=...
 to %l0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      whileEnd_0
    nop
/* Starting array access */
/* Loading 0 to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_0
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_0
    nop
arrayInBounds_0:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -20, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_0
    nop
arrayOutBounds_0:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_0:
/* Starting cin */
    set         -20, %l5
    add         %fp, %l5, %l5
    call    inputFloat
    nop
    st          %f0, [%l5]
/* Starting array access */
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_1
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_1
    nop
arrayInBounds_1:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -24, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_1
    nop
arrayOutBounds_1:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_1:
/* Starting cin */
    set         -24, %l5
    add         %fp, %l5, %l5
    call    inputFloat
    nop
    st          %f0, [%l5]
/* Starting array access */
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_2
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_2
    nop
arrayInBounds_2:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -28, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_2
    nop
arrayOutBounds_2:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_2:
/* Starting cin */
    set         -28, %l5
    add         %fp, %l5, %l5
    call    inputFloat
    nop
    st          %f0, [%l5]
/* doing foreach */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
for_1:
/* Loading f_0 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         12, %l1
    cmp         %l0, %l1
    be      forEnd_1
    nop
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l0, %l1
    set         -32, %l2
    add         %fp, %l2, %l2
    ld          [%l1], %l2
/* Incrementing */
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    st          %f2, [%l1]
    set         -40, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* Prepping Comparison Calculations by loading */
/* Starting greater than equal */
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* Storing variable 2.99 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_0, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_1
    nop
    set         0, %l3
    ba      greaterEqualEnd_1
    nop
greaterEqual_1:
    set         1, %l3
greaterEqualEnd_1:
/* Storing result of Comparison Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Short-circuiting && with Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l1 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* Prepping Comparison Calculations by loading */
/* Starting Less than Equal */
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* Storing variable 3.01 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_1, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fble    lessEqual_2
    nop
    set         0, %l3
    ba      lessEqualEnd_2
    nop
lessEqual_2:
    set         1, %l3
lessEqualEnd_2:
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Prepping Arithmetic Calculations by loading */
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: <=...
 to %l1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
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
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* Continuing for loop */
    ba      for_1
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
/* Prepping Comparison Calculations by loading */
/* Starting greater than equal */
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* Storing variable 18.99 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_3, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbge    greaterEqual_3
    nop
    set         0, %l3
    ba      greaterEqualEnd_3
    nop
greaterEqual_3:
    set         1, %l3
greaterEqualEnd_3:
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Short-circuiting && with Validating ComparisonOp float and float as a BooleanType for operator: >=...
 */
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l1 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    cmp         %l1, %g0
    be      andF_1
    nop
/* Prepping Comparison Calculations by loading */
/* Starting Less than Equal */
/* Loading f to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
/* Storing variable 19.01 into temp */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* Loading temp to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fble    lessEqual_4
    nop
    set         0, %l3
    ba      lessEqualEnd_4
    nop
lessEqual_4:
    set         1, %l3
lessEqualEnd_4:
/* Storing result of Comparison Op */
    set         -60, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* Prepping Arithmetic Calculations by loading */
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: >=...
 to %l0 */
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* Loading Validating ComparisonOp float and float as a BooleanType for operator: <=...
 to %l1 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_1
    nop
andF_1:
    set         0, %l2
    ba      andEnd_1
    nop
andT_1:
    set         1, %l2
andEnd_1:
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %l2, [%l4]
/* Loading Validating BooleanOpbool and bool as a BooleanType for operator: &&...
 to %l0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
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
/* breaking out of for loop */
    ba      forEnd_1
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* Preparing argument f */
    set         -32, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %o0
    call    output
    nop
/* Loading f_0 to %l0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    add         %l0, 4, %l0
    set         -36, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l5]
    ba      for_1
    nop
forEnd_1:
/* Starting array access */
/* Loading 0 to %l0 */
    set         0, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_3
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_3
    nop
arrayInBounds_3:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -68, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_3
    nop
arrayOutBounds_3:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_3:
/* printing float STO.ExprSTO@1777b1 */
/* Loading arr[0] to %f0 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* Done printing string. */
/* Starting array access */
/* Loading 1 to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_4
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_4
    nop
arrayInBounds_4:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -72, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_4
    nop
arrayOutBounds_4:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_4:
/* printing float STO.ExprSTO@b3319f */
/* Loading arr[1] to %f0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
/* printing string */
    set         _strFmt, %o0
    set         str_7, %o1
    call    printf
    nop
/* Done printing string. */
/* Starting array access */
/* Loading 2 to %l0 */
    set         2, %l0
    cmp         %l0, %g0
    bl      arrayOutBounds_5
    nop
    cmp         %l0, 3
    bge     arrayOutBounds_5
    nop
arrayInBounds_5:
    mov         %l0, %o0
    set         4, %o1
    call    .mul
    nop
    mov         %o0, %l2
    set         arr, %l1
    add         %g0, %l1, %l1
    add         %l1, %l2, %l4
    set         -76, %l5
    add         %fp, %l5, %l6
    st          %l4, [%l6]
    ba      arrayEnd_5
    nop
arrayOutBounds_5:
    set         arrayOutOfBounds, %o0
    mov         %l0, %o1
    set         3, %o2
    call    printf
    nop
    set         _endl, %o0
    call    printf
    nop
    set         1, %o0
    call    exit

    nop
arrayEnd_5:
/* printing float STO.ExprSTO@7ecd78 */
/* Loading arr[2] to %f0 */
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
    ba      while_0
    nop
whileEnd_0:
main_end:
    ret 
    restore
SAVE.main = -(92 + 76) & -8
