.include "constants.inc"
.segment "CODE"
.import main
.export read_ax

.proc read_ax

   
load_ammu:
    LDA sprites_ammunition,X
    STA $0210,X
    INX
    CPX #$04
    BNE load_ammu
    
    CLD
    LDA $0203
    ADC #$03
    STA $0213

    CLD
    LDA $0200
    SBC #$0d
    STA $0210

  
.endproc

sprites_ammunition:
  .byte $80, $09, $00, $80
    



