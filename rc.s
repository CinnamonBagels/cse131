! --globals--
                .section     ".data"
                .align 4
                 .global     glb1,glb2,glb3
glb3:           .single      0r66.99     
float_0:        .single      0r99.44     
glb1:           .word        0           
glb2:           .word        9821        
str_1:          .asciz       " "         
str_2:          .asciz       " "         
str_3:          .asciz       " "         
str_4:          .asciz       " "         
str_5:          .asciz       " "         
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
/* line number 9*/
/* Returning value from foo */
    set         123, %i0
    ba      foo_end
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 13*/
/* Returning value from foo2 */
    set         0, %i0
    ba      foo2_end
    nop
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo3
foo3:
    set         SAVE.foo3, %g1
    save        %sp, %g1, %sp
/* line number 17*/
/* Returning value from foo3 */
    set         1, %i0
    ba      foo3_end
    nop
foo3_end:
    ret 
    restore
SAVE.foo3 = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo4
foo4:
    set         SAVE.foo4, %g1
    save        %sp, %g1, %sp
/* line number 21*/
/* Returning value from foo4 */
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
                .global      foo5
foo5:
    set         SAVE.foo5, %g1
    save        %sp, %g1, %sp
! --storing constant glb1 with value 1.0
    set         glb1, %l0
    add         %g0, %l0, %l0
    set         glb1, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 25*/
/* Prepping Arithmetic Calculations by loading */
    set         glb2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         1, %l1
/* line number 25*/
/* Subtracting */
    sub         %l0, %l1, %l3
/* line number 25*/
/* Storing result of Binary Op */
    set         -8, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 25*/
/* Storing variable int - int into glb2 */
    set         glb2, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
foo5_end:
    ret 
    restore
SAVE.foo5 = -(92 + 8) & -8
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
    call    foo
    nop
/* line number 29*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 30*/
/* setting a = foo() */
    set         -12, %l0
    add         %fp, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 30*/
/* Done. */
    call    foo2
    nop
/* line number 30*/
/* Saving return value */
    st          %o0, [%fp+-16]
/* line number 31*/
/* setting b = foo2() */
    set         -20, %l0
    add         %fp, %l0, %l0
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 31*/
/* Done. */
    call    foo3
    nop
/* line number 31*/
/* Saving return value */
    st          %o0, [%fp+-24]
/* line number 32*/
/* setting c = foo3() */
    set         -28, %l0
    add         %fp, %l0, %l0
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l2
    st          %l2, [%l0]
/* line number 32*/
/* Done. */
    call    foo4
    nop
/* line number 32*/
/* Saving return value */
    st          %f0, [%fp+-32]
/* line number 33*/
/* setting d = foo4() */
    set         -36, %l0
    add         %fp, %l0, %l0
    set         -32, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 33*/
/* Done. */
    call    foo5
    nop
/* line number 35*/
/* Printing int a */
    set         _intFmt, %o0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 35*/
/* Done printing int. */
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Printing bool b */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_0
    nop
printTrue_0:
    set         _boolT, %o1
    ba      branchEnd_0
    nop
printFalse_0:
    set         _boolF, %o1
branchEnd_0:
    call    printf
    nop
/* line number 35*/
/* Done printing bool. */
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* Printing bool c */
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_1
    nop
printTrue_1:
    set         _boolT, %o1
    ba      branchEnd_1
    nop
printFalse_1:
    set         _boolF, %o1
branchEnd_1:
    call    printf
    nop
/* line number 35*/
/* Done printing bool. */
/* line number 35*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 35*/
/* Done printing string. */
/* line number 35*/
/* printing float STO.VarSTO@f30494 */
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 35*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 36*/
/* Printing bool glb1 */
    set         glb1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %l0
    set         _strFmt, %o0
    cmp         %l0, %g0
    be      printFalse_2
    nop
printTrue_2:
    set         _boolT, %o1
    ba      branchEnd_2
    nop
printFalse_2:
    set         _boolF, %o1
branchEnd_2:
    call    printf
    nop
/* line number 36*/
/* Done printing bool. */
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* Printing int glb2 */
    set         _intFmt, %o0
    set         glb2, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 36*/
/* Done printing int. */
/* line number 36*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 36*/
/* Done printing string. */
/* line number 36*/
/* printing float STO.VarSTO@5bb966 */
    set         glb3, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 36*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 36) & -8
