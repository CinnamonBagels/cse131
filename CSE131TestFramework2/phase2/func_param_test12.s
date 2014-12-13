! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_2:        .single      0r351.22    
float_3:        .single      0r44.55     
str_0:          .asciz       "r is: "    
str_1:          .asciz       "modifying a"
str_4:          .asciz       "noob is: " 
str_5:          .asciz       "c is: "    
str_6:          .asciz       "noob is now: "
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
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 2*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 2*/
/* Storing parameter r */
    st          %i1, [%fp+72]
/* line number 3*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 3*/
/* Done printing string. */
/* line number 3*/
/* Printing int r */
    set         _intFmt, %o0
/* line number 3*/
/* Loading r to %o1 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
    set         _endl, %o0
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
    set         _endl, %o0
    call    printf
    nop
! --storing constant a with value 351.22
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         float_2, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 7*/
/* Returning value from foo */
/* line number 7*/
/* Loading r to %f0 */
    set         72, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fitos       %f0, %f0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
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
/* line number 14*/
/* setting noob = 44.55 */
    set         -8, %l0
    add         %fp, %l0, %l0
/* line number 14*/
/* setting float */
    set         float_3, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* Done. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 14*/
/* printing float STO.VarSTO@183bfee */
/* line number 14*/
/* Loading noob to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 14*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 15*/
/* Preparing argument noob */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
/* line number 15*/
/* Preparing argument 88 */
/* line number 15*/
/* Loading 88 to %o1 */
    set         88, %o1
    call    foo
    nop
/* line number 15*/
/* Saving return value on to stack */
    st          %f0, [%fp+-12]
/* line number 17*/
/* setting c = foo() */
    set         -16, %l0
    add         %fp, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 17*/
/* Done. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* printing float STO.VarSTO@15978e7 */
/* line number 17*/
/* Loading c to %f0 */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* printing float STO.VarSTO@183bfee */
/* line number 19*/
/* Loading noob to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 19*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 22*/
/* Returning value from main */
    set         44, %i0
    ba      main_end
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 16) & -8
