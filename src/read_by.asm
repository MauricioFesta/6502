
.segment "CODE"
.import main
.import ship_enemies
.export read_by

.proc read_by
    LDA $0305 ;validate if already hited all enemieship
    TAX
    CPX #$01
    BEQ new_level ;end validate
    JSR ship_enemies

    RTI

new_level: 
  
    LDA $0303 ;increase by enemies ship each level
    TAX
    INX
    INX
    INX
    INX
    TXA
    STA $0303 ;end increase

    LDA #$02
    STA $0304 ;qtd / 4

    LDA $0306 ;increase one leval
    TAX
    INX
    TXA 
    STA $0306 ;end increase

    LDA #$00
    STA $0305

    JSR ship_enemies
 

    RTI

.endproc