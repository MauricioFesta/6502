.include "constants.inc"
.segment "CODE"
.import main
.export read_ax

.proc read_ax

   
load_ammu:  ;draw shot
    LDA sprites_ammunition,X
    STA $0210,X
    INX
    CPX #$04
    BNE load_ammu ;end draw shot
    
    CLD   ;start align shot with the ship
    LDA $0203
    ADC #$03
    STA $0213

    CLD
    LDA $0200
    SBC #$0d
    STA $0210   ;end align shot


    LDX #$00

up_shot:
    CLD
    LDA $0210
    SBC #$05
    STA $0210

delayloop:  ;start delay loop
    ADC #01
    BNE delayloop
    CLC
    INC $41
    BNE delayloop
    CLC ;end delay

    INX
    CPX #$4
    BNE up_shot

    RTI

  
.endproc

sprites_ammunition:
  .byte $80, $09, $00, $80
    



