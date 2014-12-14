! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     kick,sucker
sucker:         .single      0r0.0       
str_0:          .asciz       "dick is: " 
globalInit_:    .word        0           
                .section     ".bss"
                .align 4
kick:           .skip        4           


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
                .global      moby
moby:
    set         SAVE.moby, %g1
    save        %sp, %g1, %sp
/* line number 8*/
/* Storing parameter a */
    st          %i0, [%fp+68]
/* line number 9*/
/* Incrementing */
/* line number 9*/
/* Loading a to %f0 */
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %f0
    set         FLOAT_FORCE_1, %l6
    ld          [%l6], %f1
    fadds       %f0, %f1, %f2
    set         68, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    st          %f2, [%l1]
    fsubs       %f2, %f1, %f2
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %f2, [%l1]
/* line number 11*/
/* Returning value from moby */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    mov         %l0, %i0
    ba      mobyend
    nop
    ba      moby_end
    nop
moby_end:
    ret 
    restore
SAVE.moby = -(92 + 8) & -8
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
/* line number 17*/
/* Converting int 44 to float. */
/* line number 17*/
/* promoting */
/* line number 17*/
/* Storing variable 44 into promoteCasting */
    set         -4, %l5
    add         %fp, %l5, %l5
    set         44, %l3
    st          %l3, [%l5]
/* line number 17*/
/* Loading promoteCasting to %f1 */
    set         -4, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
/* line number 17*/
/* done promoting */
/* line number 17*/
/* Assigning converted 44 to dick */
    set         -8, %l2
    add         %fp, %l2, %l2
    st          %f1, [%l2]
/* line number 17*/
/* Preparing argument dick */
    set         -8, %l0
    add         %fp, %l0, %l0
    mov         %l0, %o0
    call    moby
    nop
/* line number 17*/
/* Saving return value on to stack */
    st          %f0, [%fp+-12]
/* line number 19*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 19*/
/* Done printing string. */
/* line number 19*/
/* printing float STO.VarSTO@6d234c */
/* line number 19*/
/* Loading dick to %f0 */
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
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
