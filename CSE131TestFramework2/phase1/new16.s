! --globals--
                .section     ".data"
                .align 4
foo_x:          .word        0           
staticGuard_foo_x:    .word        0           
foo_y:          .word        0           
staticGuard_foo_y:    .word        0           
str_0:          .asciz       "foo"       
str_1:          .asciz       "main"      
str_2:          .asciz       "end"       
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
    set         staticGuard_foo_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_foo_x
    nop
    set         staticGuard_foo_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_foo_x:
    set         staticGuard_foo_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_foo_y
    nop
    set         staticGuard_foo_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_foo_y:
! --storing constant x with value 1.0
    set         foo_x, %l0
    add         %g0, %l0, %l0
    set         foo_x, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
! --storing constant y with value 0.0
    set         foo_y, %l0
    add         %g0, %l0, %l0
    set         foo_y, %l0
    add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]
/* line number 7*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 7*/
/* Done printing string. */
/* line number 7*/
/* Printing bool x */
    set         foo_x, %l1
    add         %g0, %l1, %l1
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
/* line number 7*/
/* Done printing bool. */
/* line number 7*/
/* Printing bool y */
    set         foo_y, %l1
    add         %g0, %l1, %l1
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
/* line number 7*/
/* Done printing bool. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Returning value from foo */
    set         foo_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %i0
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
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    call    foo
    nop
/* line number 13*/
/* Saving return value */
    st          %o0, [%fp+-8]
/* line number 13*/
/* Printing bool foo() */
    set         -8, %l1
    add         %fp, %l1, %l1
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
/* line number 13*/
/* Done printing bool. */
/* line number 13*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 13*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
