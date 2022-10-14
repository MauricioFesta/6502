.segment "CODE"
.import main
.export ship_enemies

.proc ship_enemies

    LDX #$00

draw_enemies:

    LDA sprites_enemies,X
    STA $0214,X 
    INX
    CPX #$04
    BNE draw_enemies

    RTS


.endproc

 
sprites_enemies:
    .byte $50, $00, $00, $18