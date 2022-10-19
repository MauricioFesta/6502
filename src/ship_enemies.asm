.segment "CODE"
.import main
.export ship_enemies
.export move_enemies

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


.proc move_enemies

  ;LDA $0203
  ;STA $0217
  LDA $0214  ;move enemie
  CLD
  ADC #$01
  STA $0214

  RTS

.endproc
 
sprites_enemies:
    .byte $01, $00, $00, $18