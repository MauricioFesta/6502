.include "constants.inc"
.segment "CODE"
.import main
.export read_ax

.proc read_ax

load_ammu:
    LDA sprites_ammunition,X
    STA $0248,X
    INX
    CPX #$04
    BNE load_ammu
    
    RTI 

.endproc

sprites_ammunition:
  .byte $90, $09, $00, $80
    



