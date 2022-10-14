.segment "CODE"
.import main
.import reset_handler
.export read_ax

.proc read_ax

   
load_missile:  ;draw missile
    LDA sprites_missile,X
    STA $0210,X
    INX
    CPX #$04
    BNE load_missile ;end draw missile
    
    CLD   ;start align missile with the ship
    LDA $0203
    ADC #$03
    STA $0213

    CLD
    LDA $0200
    SBC #$0d
    STA $0210   ;end align missile

    LDX #$00

up_missile:
    CLD ;start move missile
    LDA $0210
    SBC #$01
    STA $0210

delayloop:  ;start delay loop
    ADC #08
    BNE delayloop
    CLC
    INC $41
    BNE delayloop
    CLC ;end delay
    INX  
    CPX #$95
    BNE hit ;end move missile

    LDX $00
draw_invalid:  ;start draw blank sprit

    LDA sprites_invalid, X
    STA $0210,X
    INX
    CPX #$04
    BNE draw_invalid ;end draw blank sprit
        
    RTI

hit:

    LDY $10
    LDA $0210
    CLC
    SBC $0214
    CMP #$00
    BNE up_missile
    LDA $0213
    CLC
    SBC $0217
    CMP #$00
    ;EOR #$01
    ;EOR #$02
    BNE up_missile
   
    JMP reset_handler
  
.endproc

sprites_missile:
  .byte $80, $0a, $00, $80

sprites_invalid:
    .byte $00, $01, $00, $00
    



