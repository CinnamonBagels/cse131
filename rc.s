! --globals--
                .section     ".data"
                .align 4
                 .global     shakespeare,marlowe
shakespeare:    .single      0r0.0       
marlowe:        .single      0r0.0       
globalInit_:    .word        0           
float_0:        .single      0r9000.0    
float_1:        .single      0r5000.0    
float_2:        .single      0r5.6       
float_3:        .single      0r9.2       
float_4:        .single      0r51.52     

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
/* line number 12*/
/* setting twilightSeries = 5000 */
    set         5000, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 12*/
/* Subtracting */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
/* line number 12*/
/* Storing Arithmetic Op into  */
    set         4, %l0
    add         %fp, %l0, %l0
    set         float_4, %l2
    add         %g0, %l2, %l2
    ld          [%l2], %f1
    st          %f1, [%l0]
    set         4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fsubs       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -12, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 14*/
/* setting byron = int - float */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* printing float byron */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
