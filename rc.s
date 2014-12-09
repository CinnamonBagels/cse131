! DEFAULT STRING FORMATTERS -------------
                .section     ".rodata"
_endl:          .asciz       "\n"        
_intFmt:        .asciz       "%d"        
_strFmt:        .asciz       "%s"        
_boolT:         .asciz       "true"      
_boolF:         .asciz       "false"     
arrOutOfBounds:    .asciz       "Index value of %d is outside legal range [0,%d).\n"
nullptrException:    .asciz       "Attempt to dereference NULL pointer.\n"

                .section     ".data"
                .align 4
C_FLOAT1:       .single      0r1.0       
.glb_init:      .word        0           

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
!Doing array designator on x
!Loading final x-STO.VarSTO@edf389
set         -44, %l3
add         %fp, %l3, %l3
! -- loading variable 8 into reg %o0
set         8, %o0
!checking for out of bounds
cmp         %o0, %g0
bge     array0
nop
set         1, %o0
call    exit

nop
set         arrOutOfBounds, %o0
! -- loading variable 8 into reg %o1
set         8, %o1
set         10, %o2
call    printf
nop
array0:
set         10, %l6
cmp         %o0, %l6
bl      array1
nop
set         arrOutOfBounds, %o0
! -- loading variable 8 into reg %o1
set         8, %o1
set         10, %o2
call    printf
nop
set         1, %o0
call    exit

nop
array1:
!checking for out of bounds
set         4, %o1
call    .mul
nop
mov         %o0, %l4
add         %l3, %l4, %l3
!Storing address result onto stack
set         -48, %l0
add         %fp, %l0, %l0
st          %l3, [%l0]
!Storing constant 4.0 int to x[8]
!Loading final x[8]-STO.VarSTO@fced4
set         -48, %l0
add         %fp, %l0, %l0
!reloading because this is a reference
ld          [%l0], %l0
set         4, %l1
st          %l1, [%l0]
!setting value to y = 8
!Loading final y-STO.VarSTO@6355dc
set         -52, %l0
add         %fp, %l0, %l0
    set         8, %l1
    st          %l1, [%l0]

!Doing array designator on x
!Loading final x-STO.VarSTO@edf389
set         -44, %l3
add         %fp, %l3, %l3
! -- loading variable y into reg %o0
!Loading final y-STO.VarSTO@6355dc
set         -52, %l0
add         %fp, %l0, %l0
ld          [%l0], %o0

!checking for out of bounds
cmp         %o0, %g0
bge     array2
nop
set         1, %o0
call    exit

nop
set         arrOutOfBounds, %o0
! -- loading variable y into reg %o1
!Loading final y-STO.VarSTO@6355dc
set         -52, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

set         10, %o2
call    printf
nop
array2:
set         10, %l6
cmp         %o0, %l6
bl      array3
nop
set         arrOutOfBounds, %o0
! -- loading variable y into reg %o1
!Loading final y-STO.VarSTO@6355dc
set         -52, %l0
add         %fp, %l0, %l0
ld          [%l0], %o1

set         10, %o2
call    printf
nop
set         1, %o0
call    exit

nop
array3:
!checking for out of bounds
set         4, %o1
call    .mul
nop
mov         %o0, %l4
add         %l3, %l4, %l3
!Storing address result onto stack
set         -56, %l0
add         %fp, %l0, %l0
st          %l3, [%l0]
! -- loading variable x[y] into reg %o1
!Loading final x[y]-STO.VarSTO@19a029e
set         -56, %l0
add         %fp, %l0, %l0
!reloading because this is a reference
ld          [%l0], %l0
ld          [%l0], %o1

    set         _intFmt, %o0
    call    printf
    nop

    set         _endl, %o0
    call    printf
    nop

mainend:
    ret 
    restore

SAVE.main = -(92+56) & -8
