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
    BNE delayloop ;end delay
    CLC
    INX  
    CPX #$95
    BNE hit ;end move missile

draw_invalid:  ;start draw blank sprit

    LDA #$01
    STA $0211 ;end draw blank sprit
        
    RTI

hit:
    LDA $0210 ;start verify if the missile hit in the ship
    CLC
    SBC $0214
    CMP #$06
    BNE up_missile
    LDA $0213
    CLC
    SBC $0217
    CLC
    CMP #$00
    BNE up_missile ;end verify

    JMP draw_explosion
 
draw_explosion: ;start draw explosion

    LDA #$0b
    STA $0215 ;end draw explosion
    JMP draw_invalid 

.endproc

sprites_missile:
  .byte $80, $0a, $00, $80

sprites_invalid:
    .byte $00, $01, $00, $00

sprites_explosion:
    .byte $80, $0b, $00, $80
    



