.segment "CODE"
.import main
.export ship_enemies
.export move_enemies


.proc ship_enemies

    LDX #$00

draw_enemie_one: ;start draw ship one

    LDA sprites_enemies_one,X
    STA $0214,X 
    INX
    CPX #$04
    BNE draw_enemie_one ;end draw ship one
    LDX #$00


draw_enemie_two: ;start draw ship two

    LDA sprites_enemies_two,X
    STA $0218,X 
    INX
    CPX #$04
    BNE draw_enemie_two ;end draw ship two
    LDX #$00

 

draw_enemie_three: ;start draw ship three

    LDA sprites_enemies_three,X
    STA $021c,X 
    INX
    CPX #$04
    BNE draw_enemie_three ;end draw ship three

    RTS


.endproc


.proc move_enemies

    ;LDA $0203
    ;STA $0217
    LDA $0214  ;start move enemie 1
    TAX
    INX
    INX
    TXA
    STA $0214 ;end move enemie 1

    LDA $0218  ;start move enemie 2
    TAX
    INX
    INX
    TXA
    STA $0218 ;end move enemie 2

    LDA $021c  ;start move enemie 3
    TAX
    INX
    INX 
    TXA
    STA $021c ;end move enemie 3

    RTS

.endproc
 
sprites_enemies_one:
    .byte $01, $0c, $00, $18

sprites_enemies_two:
    .byte $50, $0c, $00, $40    

sprites_enemies_three:
    .byte $60, $0c, $00, $80  