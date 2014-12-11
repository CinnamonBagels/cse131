! DEFAULT STRING FORMATTERS -------------
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
arrOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d).\n"
nullptrException:    .asciz       "Attempt to dereference NULL pointer.\n"

_str1:          .asciz       "fooI():"   
_str2:          .asciz       "fooF():"   
_str4:          .asciz       "fooB():"   
_str5:          .asciz       "fooV()"    
_str6:          .asciz       "fooG()"    
_str7:          .asciz       "bar()"     
_str8:          .asciz       "F0: "      
_str9:          .asciz       " "         
_str10:         .asciz       " "         
_str11:         .asciz       "F1: "      
_str12:         .asciz       " "         
_str13:         .asciz       " "         
_str14:         .asciz       "F2: "      
_str15:         .asciz       " "         
_str16:         .asciz       " "         
_str17:         .asciz       "foo()"     
_str18:         .asciz       "ST00: "    
_str19:         .asciz       " "         
_str20:         .asciz       "OP00: "    
_str21:         .asciz       " "         
_str22:         .asciz       "ST01: "    
_str23:         .asciz       " "         
_str24:         .asciz       "OP01: "    
_str25:         .asciz       " "         
_str26:         .asciz       "ST02: "    
_str27:         .asciz       " "         
_str28:         .asciz       "OP02: "    
_str29:         .asciz       " "         
_str30:         .asciz       "ST03: "    
_str31:         .asciz       " "         
_str32:         .asciz       "OP03: "    
_str33:         .asciz       " "         
_str34:         .asciz       "ST04: "    
_str35:         .asciz       " "         
_str36:         .asciz       "OP04: "    
_str37:         .asciz       " "         
_str38:         .asciz       "ST05: "    
_str39:         .asciz       " "         
_str40:         .asciz       "OP05: "    
_str41:         .asciz       " "         
_str42:         .asciz       "ST06: "    
_str43:         .asciz       " "         
_str44:         .asciz       "OP06: "    
_str45:         .asciz       " "         
_str46:         .asciz       "ST07: "    
_str47:         .asciz       " "         
_str48:         .asciz       "OP07: "    
_str49:         .asciz       " "         
_str50:         .asciz       "ST08: "    
_str51:         .asciz       " "         
_str52:         .asciz       "OP08: "    
_str53:         .asciz       " "         
_str54:         .asciz       "ST09: "    
_str55:         .asciz       " "         
_str56:         .asciz       "OP09: "    
_str57:         .asciz       " "         
_str58:         .asciz       "ST10: "    
_str59:         .asciz       " "         
_str60:         .asciz       "OP10: "    
_str61:         .asciz       " "         
_str62:         .asciz       "ST11: "    
_str63:         .asciz       " "         
_str64:         .asciz       "OP11: "    
_str65:         .asciz       " "         
_str66:         .asciz       "ST12: "    
_str67:         .asciz       " "         
_str68:         .asciz       "BAD"       
_str69:         .asciz       "REC: "     
_str72:         .asciz       "AFTER"     
_str73:         .asciz       "BAD"       
                .section     ".data"
                .align 4
                .global      g
C_FLOAT1:       .single      0r1.0       
_float2:        .single      0r3.14      
g:              .word        1           
.static_init0:    .word        0           
.glb_init:      .word        0           
                .section     ".bss"
                .align 4
rec_x:          .skip        4           


                .section     ".text"
                .global      fooI
                .align 4
fooI:
    set         SAVE.fooI, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str1, %o1
    call    printf
    nop

!Returning a value from fooI with 42 
/* At line 6*/ 
set         42, %i0
ba      fooIend
nop
fooIend:
    ret 
    restore

SAVE.fooI = -(92+4) & -8
                .section     ".text"
                .global      fooF
                .align 4
fooF:
    set         SAVE.fooF, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str2, %o1
    call    printf
    nop

!Returning a value from fooF with 3.14 
/* At line 12*/ 
!! -- loading variable 3.14 into reg %f0
 
/* At line 12*/ 
!Loading final 3.14-STO.ConstSTO@1acfa31 
/* At line 12*/ 
set         _float2, %l0
add         %g0, %l0, %l0
ld          [%l0], %f0

ba      fooFend
nop
fooFend:
    ret 
    restore

SAVE.fooF = -(92+4) & -8
                .section     ".text"
                .global      fooB
                .align 4
fooB:
    set         SAVE.fooB, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str4, %o1
    call    printf
    nop

!Returning a value from fooB with true 
/* At line 18*/ 
set         1, %i0
ba      fooBend
nop
fooBend:
    ret 
    restore

SAVE.fooB = -(92+4) & -8
                .section     ".text"
                .global      fooV
                .align 4
fooV:
    set         SAVE.fooV, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str5, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

ba      fooVend
nop
fooVend:
    ret 
    restore

SAVE.fooV = -(92+4) & -8
                .section     ".text"
                .global      fooG
                .align 4
fooG:
    set         SAVE.fooG, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str6, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

!incrementing g 
/* At line 31*/ 
!! -- loading variable g into reg %l0
 
/* At line 31*/ 
!Loading final g-STO.VarSTO@c943d1 
/* At line 31*/ 
set         g, %l0
add         %g0, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         g, %l3
add         %l3, %g0, %l3
st          %l0, [%l3]
dec     %l0
set         -8, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!Returning a value from fooG with g++ 
/* At line 32*/ 
!! -- loading variable g++ into reg %i0
 
/* At line 32*/ 
!Loading final g++-STO.ExprSTO@18352d8 
/* At line 32*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %i0

ba      fooGend
nop
fooGend:
    ret 
    restore

SAVE.fooG = -(92+8) & -8
                .section     ".text"
                .global      bar
                .align 4
bar:
    set         SAVE.bar, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str7, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str8, %o1
    call    printf
    nop

call    fooI
nop

! -- Storing return val into stack fooI() -- !
st          %o0, [%fp+-8]
!! -- loading variable fooI() into reg %o1
 
/* At line 37*/ 
!Loading final fooI()-STO.VarSTO@b40ec4 
/* At line 37*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str9, %o1
    call    printf
    nop

call    fooF
nop

! -- Storing return val into stack fooF() -- !
st          %f0, [%fp+-12]
!! -- loading variable fooF() into reg %f0
 
/* At line 37*/ 
!Loading final fooF()-STO.VarSTO@13576a2 
/* At line 37*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %f0

    call    printFloat
    nop

    set         _strFmt, %o0
    set         _str10, %o1
    call    printf
    nop

call    fooB
nop

! -- Storing return val into stack fooB() -- !
st          %o0, [%fp+-16]
set         _strFmt, %o0
!! -- loading variable fooB() into reg %l0
 
/* At line 37*/ 
!Loading final fooB()-STO.VarSTO@ff8c74 
/* At line 37*/ 
set         -16, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

cmp         %l0, %g0
be      _printBool0
nop
set         _boolT, %o1
ba      _printBool1
nop
_printBool0:
set         _boolF, %o1
_printBool1:
    call    printf
nop
    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str11, %o1
    call    printf
    nop

call    fooF
nop

! -- Storing return val into stack fooF() -- !
st          %f0, [%fp+-20]
!! -- loading variable fooF() into reg %f0
 
/* At line 38*/ 
!Loading final fooF()-STO.VarSTO@15e2ccd 
/* At line 38*/ 
set         -20, %l0
add         %fp, %l0, %l0
ld          [%l0], %f0

    call    printFloat
    nop

    set         _strFmt, %o0
    set         _str12, %o1
    call    printf
    nop

call    fooB
nop

! -- Storing return val into stack fooB() -- !
st          %o0, [%fp+-24]
set         _strFmt, %o0
!! -- loading variable fooB() into reg %l0
 
/* At line 38*/ 
!Loading final fooB()-STO.VarSTO@1cf7491 
/* At line 38*/ 
set         -24, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

cmp         %l0, %g0
be      _printBool2
nop
set         _boolT, %o1
ba      _printBool3
nop
_printBool2:
set         _boolF, %o1
_printBool3:
    call    printf
nop
    set         _strFmt, %o0
    set         _str13, %o1
    call    printf
    nop

call    fooI
nop

! -- Storing return val into stack fooI() -- !
st          %o0, [%fp+-28]
!! -- loading variable fooI() into reg %o1
 
/* At line 38*/ 
!Loading final fooI()-STO.VarSTO@edf730 
/* At line 38*/ 
set         -28, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str14, %o1
    call    printf
    nop

call    fooB
nop

! -- Storing return val into stack fooB() -- !
st          %o0, [%fp+-32]
set         _strFmt, %o0
!! -- loading variable fooB() into reg %l0
 
/* At line 39*/ 
!Loading final fooB()-STO.VarSTO@ff94b1 
/* At line 39*/ 
set         -32, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

cmp         %l0, %g0
be      _printBool4
nop
set         _boolT, %o1
ba      _printBool5
nop
_printBool4:
set         _boolF, %o1
_printBool5:
    call    printf
nop
    set         _strFmt, %o0
    set         _str15, %o1
    call    printf
    nop

call    fooI
nop

! -- Storing return val into stack fooI() -- !
st          %o0, [%fp+-36]
!! -- loading variable fooI() into reg %o1
 
/* At line 39*/ 
!Loading final fooI()-STO.VarSTO@17b0998 
/* At line 39*/ 
set         -36, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str16, %o1
    call    printf
    nop

call    fooF
nop

! -- Storing return val into stack fooF() -- !
st          %f0, [%fp+-40]
!! -- loading variable fooF() into reg %f0
 
/* At line 39*/ 
!Loading final fooF()-STO.VarSTO@b30913 
/* At line 39*/ 
set         -40, %l0
add         %fp, %l0, %l0
ld          [%l0], %f0

    call    printFloat
    nop

    set         _endl, %o0
    call    printf
    nop

call    fooV
nop

!! -- loading variable g into reg %o1
 
/* At line 42*/ 
!Loading final g-STO.VarSTO@c943d1 
/* At line 42*/ 
set         g, %l0
add         %g0, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

call    fooG
nop

! -- Storing return val into stack fooG() -- !
st          %o0, [%fp+-44]
!! -- loading variable fooG() into reg %o1
 
/* At line 43*/ 
!Loading final fooG()-STO.VarSTO@84ce7a 
/* At line 43*/ 
set         -44, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

!! -- loading variable g into reg %o1
 
/* At line 44*/ 
!Loading final g-STO.VarSTO@c943d1 
/* At line 44*/ 
set         g, %l0
add         %g0, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

barend:
    ret 
    restore

SAVE.bar = -(92+44) & -8
                .section     ".text"
                .global      foo
                .align 4
foo:
    set         SAVE.foo, %g1
    save        %sp, %g1, %sp
    set         _strFmt, %o0
    set         _str17, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

!setting value to x = 4 
/* At line 50*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 50*/ 
set         -8, %l0
add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]

!setting value to y = 3 
/* At line 51*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 51*/ 
set         -12, %l0
add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]

    set         _strFmt, %o0
    set         _str18, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 53*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 53*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str19, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 53*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 53*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str20, %o1
    call    printf
    nop

!incrementing x 
/* At line 55*/ 
!! -- loading variable x into reg %l0
 
/* At line 55*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 55*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -16, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 55*/ 
!Loading final x++-STO.ExprSTO@162e295 
/* At line 55*/ 
set         -16, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str21, %o1
    call    printf
    nop

!incrementing y 
/* At line 55*/ 
!! -- loading variable y into reg %l0
 
/* At line 55*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 55*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -20, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 55*/ 
!Loading final y++-STO.ExprSTO@109de5b 
/* At line 55*/ 
set         -20, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str22, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 56*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 56*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str23, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 56*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 56*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str24, %o1
    call    printf
    nop

!incrementing x 
/* At line 57*/ 
!! -- loading variable x into reg %l0
 
/* At line 57*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 57*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -24, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 57*/ 
!Loading final x++-STO.ExprSTO@e53220 
/* At line 57*/ 
set         -24, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str25, %o1
    call    printf
    nop

!incrementing y 
/* At line 57*/ 
!! -- loading variable y into reg %l0
 
/* At line 57*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 57*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -28, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 57*/ 
!Loading final y++-STO.ExprSTO@13e0aba 
/* At line 57*/ 
set         -28, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str26, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 58*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 58*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str27, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 58*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 58*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str28, %o1
    call    printf
    nop

!incrementing x 
/* At line 59*/ 
!! -- loading variable x into reg %l0
 
/* At line 59*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 59*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -32, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 59*/ 
!Loading final x++-STO.ExprSTO@3257b8 
/* At line 59*/ 
set         -32, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str29, %o1
    call    printf
    nop

!incrementing y 
/* At line 59*/ 
!! -- loading variable y into reg %l0
 
/* At line 59*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 59*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -36, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 59*/ 
!Loading final y++-STO.ExprSTO@11d2572 
/* At line 59*/ 
set         -36, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str30, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 60*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 60*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str31, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 60*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 60*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str32, %o1
    call    printf
    nop

!incrementing x 
/* At line 61*/ 
!! -- loading variable x into reg %l0
 
/* At line 61*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 61*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -40, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 61*/ 
!Loading final x++-STO.ExprSTO@859a68 
/* At line 61*/ 
set         -40, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str33, %o1
    call    printf
    nop

!incrementing y 
/* At line 61*/ 
!! -- loading variable y into reg %l0
 
/* At line 61*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 61*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -44, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 61*/ 
!Loading final y++-STO.ExprSTO@15c62bc 
/* At line 61*/ 
set         -44, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str34, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 63*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 63*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str35, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 63*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 63*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str36, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 65*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 65*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -48, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 65*/ 
!Loading final x---STO.ExprSTO@b7b3f9 
/* At line 65*/ 
set         -48, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str37, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 65*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 65*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -52, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 65*/ 
!Loading final y---STO.ExprSTO@88df60 
/* At line 65*/ 
set         -52, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str38, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 66*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 66*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str39, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 66*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 66*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str40, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 67*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 67*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -56, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 67*/ 
!Loading final x---STO.ExprSTO@1318b 
/* At line 67*/ 
set         -56, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str41, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 67*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 67*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -60, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 67*/ 
!Loading final y---STO.ExprSTO@5bb966 
/* At line 67*/ 
set         -60, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str42, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 68*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 68*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str43, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 68*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 68*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str44, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 69*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 69*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -64, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 69*/ 
!Loading final x---STO.ExprSTO@1e903d5 
/* At line 69*/ 
set         -64, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str45, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 69*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 69*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -68, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 69*/ 
!Loading final y---STO.ExprSTO@faa550 
/* At line 69*/ 
set         -68, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str46, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 70*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 70*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str47, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 70*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 70*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str48, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 71*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 71*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -72, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 71*/ 
!Loading final x---STO.ExprSTO@17b6643 
/* At line 71*/ 
set         -72, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str49, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 71*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 71*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -76, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 71*/ 
!Loading final y---STO.ExprSTO@76e8a7 
/* At line 71*/ 
set         -76, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str50, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 73*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 73*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str51, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 73*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 73*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str52, %o1
    call    printf
    nop

!incrementing x 
/* At line 75*/ 
!! -- loading variable x into reg %l0
 
/* At line 75*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 75*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -80, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 75*/ 
!Loading final x++-STO.ExprSTO@a45536 
/* At line 75*/ 
set         -80, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str53, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 75*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 75*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -84, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 75*/ 
!Loading final y---STO.ExprSTO@d66426 
/* At line 75*/ 
set         -84, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str54, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 76*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 76*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str55, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 76*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 76*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str56, %o1
    call    printf
    nop

!incrementing x 
/* At line 77*/ 
!! -- loading variable x into reg %l0
 
/* At line 77*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 77*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -88, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x++ into reg %o1
 
/* At line 77*/ 
!Loading final x++-STO.ExprSTO@1490eb5 
/* At line 77*/ 
set         -88, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str57, %o1
    call    printf
    nop

!! -- loading variable y into reg %l0
 
/* At line 77*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 77*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -92, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y-- into reg %o1
 
/* At line 77*/ 
!Loading final y---STO.ExprSTO@164b09c 
/* At line 77*/ 
set         -92, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str58, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 78*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 78*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str59, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 78*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 78*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str60, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 79*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 79*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -96, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 79*/ 
!Loading final x---STO.ExprSTO@186f247 
/* At line 79*/ 
set         -96, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str61, %o1
    call    printf
    nop

!incrementing y 
/* At line 79*/ 
!! -- loading variable y into reg %l0
 
/* At line 79*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 79*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
dec     %l0
set         -100, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 79*/ 
!Loading final y++-STO.ExprSTO@8c4a77 
/* At line 79*/ 
set         -100, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str62, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 80*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 80*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str63, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 80*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 80*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str64, %o1
    call    printf
    nop

!! -- loading variable x into reg %l0
 
/* At line 81*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 81*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

dec     %l0
set         -8, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
inc     %l0
set         -104, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x-- into reg %o1
 
/* At line 81*/ 
!Loading final x---STO.ExprSTO@6d0040 
/* At line 81*/ 
set         -104, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str65, %o1
    call    printf
    nop

!incrementing y 
/* At line 81*/ 
!! -- loading variable y into reg %l0
 
/* At line 81*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 81*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         -12, %l3
add         %l3, %fp, %l3
st          %l0, [%l3]
set         -108, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable y++ into reg %o1
 
/* At line 81*/ 
!Loading final y++-STO.ExprSTO@2b9406 
/* At line 81*/ 
set         -108, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str66, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 83*/ 
!Loading final x-STO.VarSTO@1e2befa 
/* At line 83*/ 
set         -8, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _strFmt, %o0
    set         _str67, %o1
    call    printf
    nop

!! -- loading variable y into reg %o1
 
/* At line 83*/ 
!Loading final y-STO.VarSTO@7c3885 
/* At line 83*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

call    bar
nop

!! -- loading variable 5 into reg %o0
 
/* At line 88*/ 
set         5, %o0
call    exit

nop
    set         _strFmt, %o0
    set         _str68, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

ba      fooend
nop
fooend:
    ret 
    restore

SAVE.foo = -(92+108) & -8
                .section     ".text"
                .global      rec
                .align 4
rec:
    set         SAVE.rec, %g1
    save        %sp, %g1, %sp
set         .static_init0, %l0
ld          [%l0], %l1
cmp         %l1, %g0
bne     .static_init_done0
nop
!setting value to x = 0 
/* At line 93*/ 
!Loading final x-STO.VarSTO@983d95 
/* At line 93*/ 
set         rec_x, %l0
add         %g0, %l0, %l0
    set         0, %l1
    st          %l1, [%l0]

set         .static_init0, %l1
set         1, %l0
st          %l0, [%l1]
.static_init_done0:
!incrementing x 
/* At line 95*/ 
!! -- loading variable x into reg %l0
 
/* At line 95*/ 
!Loading final x-STO.VarSTO@983d95 
/* At line 95*/ 
set         rec_x, %l0
add         %g0, %l0, %l0
ld          [%l0], %l0

inc     %l0
set         rec_x, %l3
add         %l3, %g0, %l3
st          %l0, [%l3]
set         -8, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
    set         _strFmt, %o0
    set         _str69, %o1
    call    printf
    nop

!! -- loading variable x into reg %o1
 
/* At line 97*/ 
!Loading final x-STO.VarSTO@983d95 
/* At line 97*/ 
set         rec_x, %l0
add         %g0, %l0, %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

!! -- loading variable x into reg %l1
 
/* At line 99*/ 
!Loading final x-STO.VarSTO@983d95 
/* At line 99*/ 
set         rec_x, %l0
add         %g0, %l0, %l0
ld          [%l0], %l1

!! -- loading variable 5 into reg %l2
 
/* At line 99*/ 
set         5, %l2
cmp         %l1, %l2
bge     _ltOp6
nop
set         1, %l0
ba      _ltOp7
nop
_ltOp6:
set         0, %l0
ba      _ltOp7
nop
_ltOp7:
set         -12, %l3
add         %fp, %l3, %l3
st          %l0, [%l3]
!! -- loading variable x<5 into reg %l0
 
/* At line 99*/ 
!Loading final x<5-STO.ExprSTO@2b323e 
/* At line 99*/ 
set         -12, %l0
add         %fp, %l0, %l0
ld          [%l0], %l0

cmp         %l0, %g0
be      _ifelse69
nop
call    rec
nop

ba      recend
nop
ba      _ifelse70
nop
_ifelse69:
_ifelse70:
    set         _strFmt, %o0
    set         _str72, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

recend:
    ret 
    restore

SAVE.rec = -(92+12) & -8
                .section     ".text"
                .global      main
                .align 4
main:
    set         SAVE.main, %g1
    save        %sp, %g1, %sp
set         .glb_init, %l0
ld          [%l0], %l1
cmp         %l1, %g0
bne     .glb_init_done
nop
set         .glb_init, %l1
set         1, %l0
st          %l0, [%l1]
.glb_init_done:
call    foo
nop

    set         _strFmt, %o0
    set         _str73, %o1
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

mainend:
    ret 
    restore

SAVE.main = -(92+4) & -8
