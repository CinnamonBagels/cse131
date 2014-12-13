! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
y:              .word        0           
staticGuard_y:    .word        0           
main_y:         .word        0           
staticGuard_main_y:    .word        0           
str_0:          .asciz       "YES!"      
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
    set         staticGuard_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_y
    nop
    set         y, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
    set         staticGuard_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_y:
    set         staticGuard_main_y, %l0
    ld          [%l0], %l1
    cmp         %g0, %l1
    bne     staticGuardLabel_main_y
    nop
    set         staticGuard_main_y, %l2
    set         1, %l3
    st          %l3, [%l2]
staticGuardLabel_main_y:
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
! --storing constant y with value 1.0
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 8*/
/* setting x = 0 */
    set         0, %l0
    st          %l0, [%fp-8]
/* line number 8*/
/* Done. */
! --storing constant y with value 1.0
    set         main_y, %l0
    add         %g0, %l0, %l0
    set         1, %l1
    st          %l1, [%l0]
/* line number 10*/
/* Short-circuiting && with true */
/* line number 10*/
/* Loading true to %l1 */
    set         1, %l1
    cmp         %l1, %g0
    be      andF_0
    nop
/* line number 10*/
/* Prepping Arithmetic Calculations by loading */
/* line number 10*/
/* Loading true to %l0 */
    set         1, %l0
/* line number 10*/
/* Loading true to %l1 */
    set         1, %l1
/* line number 10*/
/* &&-ing */
    cmp         %l1, %g0
    bne     andT_0
    nop
andF_0:
    set         0, %l2
    ba      andEnd_0
    nop
andT_0:
    set         1, %l2
andEnd_0:
/* line number 10*/
/* Storing result of Binary Op */
    set         1, %l4
    add         %g0, %l4, %l4
    st          %l2, [%l4]
/* line number 11*/
/* Loading true to %l0 */
    set         1, %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_1
    nop
else_0:
endIf_1:
main_end:
    ret 
    restore
SAVE.main = -(92 + 8) & -8
