! --globals--
                .section     ".data"
                .align 4
float_0:        .single      0r420.25    
float_1:        .single      0r662.5     
float_2:        .single      0r1082.75   
str_3:          .asciz       "\n"        

! DEFINING INTERNAL CONSTANTS --
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
rfmt:           .asciz       "%.21f"     

/* AUTOMATICALLY GENERATED FLOAT PRINTER */
                .section     ".text"
            .align 4
            .global    printFloat
printFloat:
    set         SAVE.printFloat, %g1
    save        %sp, %g1, %sp

    fstod       %f0, %f0
    std         %f0, [%fp-8]

    set         rfmt, %o0
    ld          [%fp-8], %o1
    ld          [%fp-4], %o2
    call    printf
    nop

    ret 
    restore
SAVE.printFloat = -(92 + 8) & -8
                .section     ".text"
                .align 4
                .global      main
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
/* printf on int */
    set         _intFmt, %o0
    set         420, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
/* printf on int */
    set         _intFmt, %o0
    set         214, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    set         float_2, %l0
    ld          [%l0], %f0
    call    printFloat

/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* Done printing string. */
/* printf on int */
    set         _intFmt, %o0
    set         4, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop
    ret 
    restore
SAVE.main = -(92 + 0) & -8
