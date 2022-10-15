.segment "CODE"
.import main
.export ship_enemies

.proc ship_enemies

    LDX #$00

draw_enemie_one:

    LDA sprites_enemies,X
    STA $0214,X 
    INX
    CPX #$04
    BNE draw_enemie_one

    RTS


.endproc

 
sprites_enemies:
    .byte $50, $00, $00, $18