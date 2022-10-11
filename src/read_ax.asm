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
    LDA #$00
    INX
    CPX #$018
    BNE up_shot

    LDX $00
draw_invalid:  ;start draw blank sprit

    LDA sprites_invalid, X
    STA $0210,X
    INX
    CPX #$04
    BNE draw_invalid ;end draw blank sprit
        

    RTI

  
.endproc

sprites_ammunition:
  .byte $80, $0a, $00, $80

sprites_invalid:
    .byte $00, $01, $00, $00
    



