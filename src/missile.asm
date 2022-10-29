
.segment "CODE"
.import main
.import delay
.export missile_one 


.proc missile_one 

load_missile_one:  

    LDA $0210
    LDA sprites_missile,X
    STA $0210,X
    INX
    CPX #$04
    BNE load_missile_one ;end draw missile
    
    CLD   ;start align missile with the ship
    LDA $0203
    ADC #$03
    STA $0213

    CLD
    LDA $0200
    SBC #$0d    
    STA $0210   ;end align missile

    LDX #$00


move_missile_one:
     
    CLD ;start move missile
    LDA $0210
    SBC #$01
    STA $0210

    JSR delay
    
    INX 
    CPX #$95
    BNE valid_hit_y ;end move missile
    LDX #$00


draw_invalid:  ;start draw blank sprit

    LDA #$01
    STA $0211 ;end draw blank sprit
    LDX #$00
        
    RTS

valid_hit_y: ;start valitadion Y | and x ___
    INY
    INY
    INY
    INY
    LDA $0210
    CLC
    SBC $0210,Y
    CMP #$06
    BEQ valid_hit_x
    CPY $0303
    BNE valid_hit_y
    JMP move_missile_one

valid_hit_x:
    LDA $0213
    CLC
    SBC $0213,Y
    CMP #$00
    BEQ draw_explosion  
    CPY $0303
    BNE valid_hit_y
    JMP move_missile_one ;end validation y | ans x ___
    
   
draw_explosion: ;start draw explosion

    LDA #$0b
    STA $0211,Y
    JMP draw_invalid  ;end draw explosion


.endproc


sprites_missile:
  .byte $80, $0a, $00, $80

sprites_invalid:
    .byte $00, $01, $00, $00

sprites_explosion:
    .byte $80, $0b, $00, $80