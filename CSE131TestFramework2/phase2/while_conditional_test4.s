! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_0:        .single      0r9.0       
float_1:        .single      0r14.5      
str_2:          .asciz       "unwanted is less than awesome"
str_3:          .asciz       "unwanted is still less than awesome"
str_4:          .asciz       "this should not be printed"
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
! --storing constant puppy with value 5.0
    set         -8, %l0
    add         %fp, %l0, %l0
    set         5, %l1
    st          %l1, [%l0]
! --storing constant kitten with value 9.0
    set         -12, %l0
    add         %fp, %l0, %l0
    set         float_0, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
! --storing constant kitty with value 3.0
    set         -16, %l0
    add         %fp, %l0, %l0
    set         3, %l1
    st          %l1, [%l0]
! --storing constant dog with value 14.5
    set         -20, %l0
    add         %fp, %l0, %l0
    set         float_1, %l1
    add         %g0, %l1, %l1
    ld          [%l1], %f0
    st          %f0, [%l0]
/* line number 14*/
/* setting unwanted = 4 */
    set         4, %l0
    st          %l0, [%fp-24]
/* line number 14*/
/* Done. */
/* line number 16*/
/* setting awesome = 8 */
    set         8, %l0
    st          %l0, [%fp-28]
/* line number 16*/
/* Done. */
/* line number 16*/
/* Prepping Comparison Calculations by loading */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 16*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_0
    nop
    set         0, %l3
    ba      lessEnd_0
    nop
less_0:
    set         1, %l3
lessEnd_0:
/* line number 16*/
/* Storing result of Comparison Op */
    set         -32, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 18*/
/* Prepping Comparison Calculations by loading */
/* line number 18*/
/* Starting greater than */
    set         -20, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fcmps       %f0, %f1
    fbg     greater_1
    nop
    set         0, %l3
    ba      greaterEnd_1
    nop
greater_1:
    set         1, %l3
greaterEnd_1:
/* line number 18*/
/* Storing result of Comparison Op */
    set         -36, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -36, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_0
    nop
if_0:
/* line number 20*/
/* Prepping Comparison Calculations by loading */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 20*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_2
    nop
    set         0, %l3
    ba      lessEnd_2
    nop
less_2:
    set         1, %l3
lessEnd_2:
/* line number 20*/
/* Storing result of Comparison Op */
    set         -40, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 22*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 22*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 23*/
/* Incrementing */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -24, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 23*/
/* Post Increment */
    dec     %l0
    set         -44, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
! --storing constant unwanted with value 4.0
    set         -24, %l0
    add         %fp, %l0, %l0
    set         4, %l1
    st          %l1, [%l0]
/* line number 28*/
/* Prepping Comparison Calculations by loading */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         -28, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l1
/* line number 28*/
/* Starting Less than */
    cmp         %l0, %l1
    bl      less_3
    nop
    set         0, %l3
    ba      lessEnd_3
    nop
less_3:
    set         1, %l3
lessEnd_3:
/* line number 28*/
/* Storing result of Comparison Op */
    set         -48, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 30*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 30*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
/* line number 31*/
/* Prepping Arithmetic Calculations by loading */
    set         -24, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    set         2, %l1
/* line number 31*/
/* Adding */
    add         %l0, %l1, %l3
/* line number 31*/
/* Storing result of Binary Op */
    set         -52, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
/* line number 31*/
/* Storing variable int + int into unwanted */
    set         -24, %l5
    add         %fp, %l5, %l5
    set         -52, %l3
    add         %fp, %l3, %l3
    ld          [%l3], %l3
    st          %l3, [%l5]
    ba      endIf_1
    nop
else_0:
endIf_1:
/* line number 36*/
/* Prepping Comparison Calculations by loading */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
/* line number 36*/
/* Starting greater than */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f1
    fitos       %f0, %f0
    fcmps       %f0, %f1
    fbg     greater_4
    nop
    set         0, %l3
    ba      greaterEnd_4
    nop
greater_4:
    set         1, %l3
greaterEnd_4:
/* line number 36*/
/* Storing result of Comparison Op */
    set         -56, %l4
    add         %fp, %l4, %l4
    st          %l3, [%l4]
    set         -56, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    cmp         %l0, %g0
    be      else_2
    nop
if_2:
/* line number 38*/
/* printing string */
    set         _strFmt, %o0
    set         str_4, %o1
    call    printf
    nop
/* line number 38*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    ba      endIf_3
    nop
else_2:
endIf_3:
/* line number 41*/
/* Incrementing */
    set         -16, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %l0
    inc     %l0
    set         -16, %l2
    add         %fp, %l2, %l2
    st          %l0, [%l2]
/* line number 41*/
/* Post Increment */
    dec     %l0
    set         -60, %l1
    add         %fp, %l1, %l1
    st          %l0, [%l1]
main_end:
    ret 
    restore
SAVE.main = -(92 + 60) & -8
