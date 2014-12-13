! --globals--
                .section     ".data"
                .align 4
FLOAT_FORCE_1:    .single      0r1.0       
float_1:        .single      0r3.33      
float_4:        .single      0r4.44      
str_0:          .asciz       "getX"      
str_2:          .asciz       "getY1"     
str_3:          .asciz       "getY2"     
str_5:          .asciz       "main"      
str_6:          .asciz       "end"       
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
                .global      getX
getX:
    set         SAVE.getX, %g1
    save        %sp, %g1, %sp
/* line number 6*/
/* printing string */
    set         _strFmt, %o0
    set         str_0, %o1
    call    printf
    nop
/* line number 6*/
/* Done printing string. */
/* line number 8*/
/* Returning value from getX */
/* line number 8*/
/* Loading x to %f0 */
    set         float_1, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    ba      getX_end
    nop
getX_end:
    ret 
    restore
SAVE.getX = -(92 + 4) & -8
                .section     ".text"
                .align 4
                .global      getY
getY:
    set         SAVE.getY, %g1
    save        %sp, %g1, %sp
/* line number 12*/
/* printing string */
    set         _strFmt, %o0
    set         str_2, %o1
    call    printf
    nop
/* line number 12*/
/* Done printing string. */
    call    getX
    nop
/* line number 13*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 13*/
/* printing float STO.VarSTO@1be4050 */
/* line number 13*/
/* Loading getX() to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 13*/
/* Done printing float. */
/* line number 14*/
/* printing string */
    set         _strFmt, %o0
    set         str_3, %o1
    call    printf
    nop
/* line number 14*/
/* Done printing string. */
/* line number 16*/
/* Returning value from getY */
/* line number 16*/
/* Loading y to %f0 */
    set         float_4, %l0
    add         %g0, %l0, %l0
    ld          [%l0], %f0
    ba      getY_end
    nop
getY_end:
    ret 
    restore
SAVE.getY = -(92 + 8) & -8
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
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_5, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
    call    getX
    nop
/* line number 20*/
/* Saving return value on to stack */
    st          %f0, [%fp+-8]
/* line number 20*/
/* printing float STO.VarSTO@170526a */
/* line number 20*/
/* Loading getX() to %f0 */
    set         -8, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    call    getY
    nop
/* line number 20*/
/* Saving return value on to stack */
    st          %f0, [%fp+-12]
/* line number 20*/
/* printing float STO.VarSTO@132e233 */
/* line number 20*/
/* Loading getY() to %f0 */
    set         -12, %l1
    add         %fp, %l1, %l1
    ld          [%l1], %f0
    call    printFloat
    nop
/* line number 20*/
/* Done printing float. */
    set         _endl, %o0
    call    printf
    nop
/* line number 20*/
/* printing string */
    set         _strFmt, %o0
    set         str_6, %o1
    call    printf
    nop
/* line number 20*/
/* Done printing string. */
    set         _endl, %o0
    call    printf
    nop
main_end:
    ret 
    restore
SAVE.main = -(92 + 12) & -8
