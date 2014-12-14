! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     j,i,ip
j:              .word        0           
i:              .word        0           
ip:             .word        0           
str_0:          .asciz       "i is: "    
str_1:          .asciz       "value of ip is: "
str_2:          .asciz       "value of ip is: "
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
                .global      foo1
foo1:
    set         SAVE.foo1, %g1
    save        %sp, %g1, %sp
/* line number 4*/
/* Storing parameter p */
    st          %i0, [%fp+68]
/* line number 5*/
/* Dereferencing p */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    ld          [%l0], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *p with value 5.0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
/* getting address of j */
    set         j, %l0
    add         %g0, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 6*/
/* Storing variable &j into p */
    set         68, %l5
    add         %fp, %l5, %l5
    ld          [%l5], %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
foo1_end:
    ret 
    restore
SAVE.foo1 = -(92 + 12) & -8
                .section     ".text"
                .align 4
                .global      foo2
foo2:
    set         SAVE.foo2, %g1
    save        %sp, %g1, %sp
/* line number 8*/
/* Storing parameter p */
    st          %i0, [%fp+68]
/* line number 9*/
/* Dereferencing p */
    set         68, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant *p with value 7.0
    set         -8, %l0
    add         %fp, %l0, %l0
    ld          [%l0], %l0
    set         7, %l1
    st          %l1, [%l0]
/* getting address of j */
    set         j, %l0
    add         %g0, %l0, %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 10*/
/* Storing variable &j into p */
    set         68, %l5
    add         %fp, %l5, %l5
    set         -12, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
foo2_end:
    ret 
    restore
SAVE.foo2 = -(92 + 12) & -8
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
/* getting address of i */
    set         i, %l0
    add         %g0, %l0, %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 4*/
/* Storing variable &i into ip */
    set         ip, %l5
    add         %g0, %l5, %l5
    set         -8, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
/* line number 15*/
/* Preparing argument ip */
/* line number 15*/
/* Loading ip to %o0 */
    set         ip, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o0
    call    foo2
    nop
/* line number 17*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 17*/
/* Done printing string. */
/* line number 17*/
/* Printing int i */
    set         _intFmt, %o0
/* line number 17*/
/* Loading i to %o1 */
    set         i, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 17*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
/* line number 18*/
/* printing string */
    set         _strFmt, %o0
    set         str_1, %o1
    call    printf
    nop
/* line number 18*/
/* Done printing string. */
/* line number 18*/
/* Dereferencing ip */
    set         ip, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 18*/
/* Printing int *ip */
    set         _intFmt, %o0
/* line number 18*/
/* Loading *ip to %o1 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 18*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
! --storing constant j with value 99.0
    set         j, %l0
    add         %g0, %l0, %l0
    set         99, %l1
    st          %l1, [%l0]
/* line number 23*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 23*/
/* Done printing string. */
/* line number 23*/
/* Dereferencing ip */
    set         ip, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         -12, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
/* line number 23*/
/* Printing int *ip */
    set         _intFmt, %o0
/* line number 23*/
/* Loading *ip to %o1 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 23*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
