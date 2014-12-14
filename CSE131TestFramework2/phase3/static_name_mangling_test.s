! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
x:              .word        0           
staticGuard_x:    .word        0           
main_x:         .word        0           
staticGuard_main_x:    .word        0           
main_x:         .word        0           
staticGuard_main_x:    .word        0           
main_x:         .word        0           
staticGuard_main_x:    .word        0           
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
    set         staticGuard_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_x
    nop
    set         x, %l0
    add         %g0, %l0, %l0
    set         2, %l1
    st          %l1, [%l0]
    set         staticGuard_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_x:
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
    set         staticGuard_main_x, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_x
    nop
    set         staticGuard_main_x, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_x:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
! --storing constant x with value 2.0
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 3*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 3*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 3*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant x with value 3.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
/* line number 5*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 5*/
/* Loading x to %o1 */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 5*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 6*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
! --storing constant x with value 4.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 8*/
/* Loading x to %o1 */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 9*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_1
    nop
if_1:
! --storing constant x with value 5.0
    set         main_x, %l0
    add         %g0, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
/* line number 11*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 11*/
/* Loading x to %o1 */
    set         main_x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 11*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 12*/
/* Printing int x */
    set         _intFmt, %o0
/* line number 12*/
/* Loading x to %o1 */
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 12*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_2
    nop
else_1:
endIf_2:
    ba      endIf_3
    nop
else_0:
endIf_3:
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
