! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     glb3
glb3:           .single      0r66.99     
float_0:        .single      0r99.44     
str_1:          .asciz       " "         
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
                .global      foo4
foo4:
    set         SAVE.foo4, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Returning value from foo4 */
/* line number 7*/
/* Loading 99.44 to %f0 */
    set         float_0, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    ba      foo4_end
    nop
foo4_end:
    ret 
    restore
SAVE.foo4 = -(92 + 4) & -8
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
    call    foo4
    nop
/* line number 10*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 12*/
/* setting d = foo4() */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 12*/
/* Done. */
/* line number 12*/
/* printing float STO.VarSTO@183bfee */
/* line number 12*/
/* Loading d to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
/* line number 12*/
/* printing float STO.VarSTO@e28099 */
/* line number 12*/
/* Loading glb3 to %f0 */
    set         glb3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 12*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
