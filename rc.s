! --globals--
                .section     ".data"
                .align 4
                 .global     shakespeare,marlowe,goethe,shelley,b
shakespeare:    .single      0r0.0       
marlowe:        .single      0r0.0       
goethe:         .single      0r0.0       
shelley:        .single      0r0.0       
b:              .single      0r0.0       
globalInit_:    .word        0           
float_0:        .single      0r9000.0    
float_1:        .single      0r5000.0    
float_2:        .single      0r12000.0   
float_3:        .single      0r7000.0    
float_4:        .single      0r5.6       
float_5:        .single      0r9.2       
float_6:        .single      0r51.52     
float_7:        .single      0r1.0       
float_8:        .single      0r9999.5    
float_9:        .single      0r1.0       

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
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant marlowe with value 5000.0
    set         marlowe, %l0
    add         %g0, %l0, %l0
    set         float_1, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant goethe with value 12000.0
    set         goethe, %l0
    add         %g0, %l0, %l0
    set         float_2, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
! --storing constant shelley with value 7000.0
    set         shelley, %l0
    add         %g0, %l0, %l0
    set         float_3, %l1
    ld          [%l1], %f1
    st          %f1, [%l0]
/* line number 15*/
/* setting twilightSeries = 5000 */
    set         5000, %l0
    st          %l0, [%fp-8]
/* line number 15*/
/* Done. */
/* line number 16*/
/* setting reallyReally = 1000 */
    set         1000, %l0
    st          %l0, [%fp-12]
/* line number 16*/
/* Done. */
/* line number 18*/
/* setting sucksAlot = 9000 */
    set         9000, %l0
    st          %l0, [%fp-16]
/* line number 18*/
/* Done. */
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Subtracting */
    set         shakespeare, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         marlowe, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -20, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 18*/
/* Adding */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fadds       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 18*/
/* Prepping Arithmetic Calculations by loading */
/* line number 18*/
/* Subtracting */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 18*/
/* Storing Arithmetic Op into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         float_7, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 18*/
/* Storing result of Binary Op */
    set         -28, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* setting byron = float - float */
    set         -32, %l0
    add         %fp, %l0, %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 19*/
/* Done. */
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Subtracting */
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         shelley, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
/* line number 19*/
/* Multiplying */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 19*/
/* Storing 1.0 into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         float_7, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 19*/
/* Prepping Arithmetic Calculations by loading */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 19*/
/* Subtracting */
    set         -40, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fsubs       %f0, %f1, %f3
/* line number 19*/
/* Storing result of Binary Op */
    set         -44, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* setting tennyson = float - int */
    set         -48, %l0
    add         %fp, %l0, %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 20*/
/* Done. */
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Subtracting */
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 20*/
/* Prepping Arithmetic Calculations by loading */
/* line number 20*/
/* Subtracting */
    set         -52, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 20*/
/* Storing 9999.50 into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         float_8, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 20*/
/* Storing result of Binary Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* setting wordsworth = float - float */
    set         -60, %l0
    add         %fp, %l0, %l0
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 21*/
/* Done. */
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Subtracting */
    set         shakespeare, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fsubs       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -64, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Adding */
    set         -64, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -48, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -68, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
/* line number 21*/
/* Multiplying */
    set         -68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 21*/
/* Storing 1.00 into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         float_9, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fmuls       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -72, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 21*/
/* Prepping Arithmetic Calculations by loading */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 21*/
/* Adding */
    set         -72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 21*/
/* Storing result of Binary Op */
    set         -76, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 23*/
/* setting lilwayne = float + int */
    set         -80, %l0
    add         %fp, %l0, %l0
    set         -76, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 23*/
/* Done. */
/* line number 23*/
/* printing float shakespeare */
    set         shakespeare, %l1
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
/* printing float marlowe */
    set         marlowe, %l1
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
/* printing float goethe */
    set         goethe, %l1
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
/* printing float shelley */
    set         shelley, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 26*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 27*/
/* printing float byron */
    set         -32, %l1
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
/* printing float tennyson */
    set         -48, %l1
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
/* printing float wordsworth */
    set         -60, %l1
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
/* printing float lilwayne */
    set         -80, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 30*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Printing int twilightSeries */
    set         _intFmt, %o0
    set         -8, %l1
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
/* Printing int reallyReally */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 32*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 33*/
/* Printing int sucksAlot */
    set         _intFmt, %o0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 33*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 80) & -8
