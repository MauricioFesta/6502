.segment "CODE"
.import main
.export ship_enemies
.export move_enemies


.proc ship_enemies

    LDX #$00

draw_enemies: ;start draw ship enemies

    LDA sprites_enemies,X
    STA $0214,X 
    INX
    CPX $0303
    BNE draw_enemies ;end draw ship enemies
    
.endproc


.proc move_enemies ;start to move ship enemies

    LDX #$00
    LDY #$00

    LDA $0214
    TAX
    INX
    INX
    TXA
    STA $0214

    LDX #$00
    LDY #$00
move_enemies_loop: 
    INY
    INX
    CPX #$04
    BNE move_enemies_loop
    LDA $0214,Y
    TAX
    INX
    INX
    TXA
    STA $0214,Y
    LDX #$00
    CPY $0303
    BNE move_enemies_loop ;end move ship enemies

    RTS

.endproc
 
sprites_enemies:
    .byte $01, $0c, $00, $18
    .byte $50, $0c, $00, $40 
    .byte $60, $0c, $00, $80
    .byte $33, $0c, $00, $25
    .byte $22, $0c, $00, $70

