! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
y:              .single      0r4.44      
x:              .word        3           
str_0:          .asciz       "main"      
str_1:          .asciz       "end"       
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
                .global      boo
boo:
    set         SAVE.boo, %g1
    save        %sp, %g1, %sp
/* line number 7*/
/* Returning value from boo */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    fitos       %f0, %f0
    ba      boo_end
    nop
boo_end:
    ret 
    restore
SAVE.boo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
/* line number 12*/
/* setting z = 1 */
    set         1, %l0
    st          %l0, [%fp-8]
/* line number 12*/
/* Done. */
/* line number 12*/
/* Preparing argument z */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    boo
    nop
/* line number 12*/
/* Saving return value */
    st          %f0, [%fp+-12]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 12*/
/* Adding */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f1, %f1
    fadds       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -16, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 12*/
/* Preparing argument z */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o0
    call    boo
    nop
/* line number 12*/
/* Saving return value */
    st          %f0, [%fp+-20]
/* line number 12*/
/* Prepping Arithmetic Calculations by loading */
/* line number 12*/
/* Adding */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fadds       %f0, %f1, %f3
/* line number 12*/
/* Storing result of Binary Op */
    set         -24, %l4
    add         %fp, %l4, %l4
    st          %f3, [%l4]
/* line number 13*/
/* Returning value from foo */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 24) & -8
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
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    call    foo
    nop
/* line number 17*/
/* Saving return value */
    st          %f0, [%fp+-8]
/* line number 17*/
/* printing float STO.VarSTO@2709da */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 17*/
/* Done printing float. */
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
