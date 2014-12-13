! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     shakespeare,marlowe,goethe,shelley
shakespeare:    .single      0r0.0       
marlowe:        .single      0r0.0       
goethe:         .single      0r0.0       
shelley:        .single      0r0.0       
float_0:        .single      0r9000.0    
float_1:        .single      0r5000.0    
float_2:        .single      0r12000.0   
float_3:        .single      0r7000.0    
float_4:        .single      0r51.52     
float_5:        .single      0r9.2       
float_6:        .single      0r5.6       
float_7:        .single      0r1.0       
float_8:        .single      0r9999.5    
float_9:        .single      0r1.0       
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
! --storing constant shakespeare with value 9000.0
    set         shakespeare, %l0
    add         %g0, %l0, %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant marlowe with value 5000.0
    set         marlowe, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant goethe with value 12000.0
    set         goethe, %l0
    add         %g0, %l0, %l0
    set         float_2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant shelley with value 7000.0
    set         shelley, %l0
    add         %g0, %l0, %l0
    set         float_3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* setting twilightSeries = 5000 */
    set         5000, %l0
    st          %l0, [%fp-8]
/* line number 14*/
/* Done. */
/* line number 15*/
/* setting reallyReally = 1000 */
    set         1000, %l0
    st          %l0, [%fp-12]
/* line number 15*/
/* Done. */
/* line number 17*/
/* setting sucksAlot = 9000 */
    set         9000, %l0
    st          %l0, [%fp-16]
/* line number 17*/
/* Done. */
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Subtracting */
/* line number 17*/
/* Loading shakespeare to %f0 */
    set         shakespeare, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading marlowe to %f1 */
    set         marlowe, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Loading twilightSeries to %l0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 17*/
/* Adding */
/* line number 17*/
/* Loading twilightSeries to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Loading float - float to %f1 */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Multiplying */
/* line number 17*/
/* Storing variable 5.60 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_6, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* Loading  to %f0 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Storing variable 9.20 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_5, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         float_4, %l4
    add         %g0, %l4, %l4
    st          %f3, [%l4]
/* line number 17*/
/* Prepping Arithmetic Calculations by loading */
/* line number 17*/
/* Subtracting */
/* line number 17*/
/* Loading int + float to %f0 */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 17*/
/* Storing variable Arithmetic Op into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_4, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 17*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 17*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* setting byron = float - float */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 18*/
/* Done. */
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Subtracting */
/* line number 18*/
/* Loading byron to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading shelley to %f1 */
    set         shelley, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Multiplying */
/* line number 18*/
/* Loading float - float to %f0 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Storing variable 1.0 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_7, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 18*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Loading reallyReally to %l1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 18*/
/* Subtracting */
/* line number 18*/
/* Loading float * float to %f0 */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Loading reallyReally to %f1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fsubs       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* setting tennyson = float - int */
    set         -48, %l0
    add         %fp, %l0, %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 19*/
/* Done. */
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Subtracting */
/* line number 19*/
/* Loading tennyson to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Loading byron to %f1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Subtracting */
/* line number 19*/
/* Loading float - float to %f0 */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Storing variable 9999.50 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_8, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 19*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* setting wordsworth = float - float */
    set         -60, %l0
    add         %fp, %l0, %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 20*/
/* Done. */
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Subtracting */
/* line number 20*/
/* Loading shakespeare to %f0 */
    set         shakespeare, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading byron to %f1 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Adding */
/* line number 20*/
/* Loading float - float to %f0 */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading tennyson to %f1 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Multiplying */
/* line number 20*/
/* Loading float + float to %f0 */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Storing variable 1.00 into  */
    set         4, %l5
    add         %fp, %l5, %l5
    set         float_9, %l3
    add         %g0, %l3, %l3
    ld          [%l3], %f1
    st          %f1, [%l5]
/* line number 20*/
/* Loading  to %f1 */
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Loading sucksAlot to %l1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 20*/
/* Adding */
/* line number 20*/
/* Loading float * float to %f0 */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Loading sucksAlot to %f1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 22*/
/* setting lilwayne = float + int */
    set         -80, %l0
    add         %fp, %l0, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 22*/
/* Done. */
/* line number 22*/
/* printing float STO.VarSTO@ea5d87 */
/* line number 22*/
/* Loading shakespeare to %f0 */
    set         shakespeare, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 22*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* printing float STO.VarSTO@1a183d2 */
/* line number 23*/
/* Loading marlowe to %f0 */
    set         marlowe, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 23*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 24*/
/* printing float STO.VarSTO@d55a0f */
/* line number 24*/
/* Loading goethe to %f0 */
    set         goethe, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 24*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 25*/
/* printing float STO.VarSTO@10bb83e */
/* line number 25*/
/* Loading shelley to %f0 */
    set         shelley, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 25*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 26*/
/* printing float STO.VarSTO@67211b */
/* line number 26*/
/* Loading byron to %f0 */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 26*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing float STO.VarSTO@ae8542 */
/* line number 27*/
/* Loading tennyson to %f0 */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 27*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 28*/
/* printing float STO.VarSTO@1aec0d1 */
/* line number 28*/
/* Loading wordsworth to %f0 */
    set         -60, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 28*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 29*/
/* printing float STO.VarSTO@1f4ea9d */
/* line number 29*/
/* Loading lilwayne to %f0 */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 29*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 30*/
/* Printing int twilightSeries */
    set         _intFmt, %o0
/* line number 30*/
/* Loading twilightSeries to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 30*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Printing int reallyReally */
    set         _intFmt, %o0
/* line number 31*/
/* Loading reallyReally to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 31*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 32*/
/* Printing int sucksAlot */
    set         _intFmt, %o0
/* line number 32*/
/* Loading sucksAlot to %o1 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 80) & -8
