! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
                 .global     x,y
x:              .word        0           
y:              .word        0           
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
    set         globalInit_, %l0
    ld          [%l0], %l0
    cmp         %l0, %g0
    bne     globalInit_end
    nop
    set         globalInit_, %l0
    set         1, %l1
    st          %l1, [%l0]
globalInit_end:
! --storing constant x with value 5.0
    set         x, %l0
    add         %g0, %l0, %l0
    set         x, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant y with value 6.0
    set         y, %l0
    add         %g0, %l0, %l0
    set         y, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %l0
    set         6, %l1
    st          %l1, [%l0]
/* line number 8*/
/* Printing int x */
    set         _intFmt, %o0
    set         x, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %o1
    call    printf
    nop
/* line number 8*/
/* Done printing int. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      foo
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
    call    main
    nop
    call    main
    nop
foo_end:
    ret 
    restore
SAVE.foo = -(92 + 4) & -8
