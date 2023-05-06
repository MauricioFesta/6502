.segment "CODE"
.import main
.export ship_enemies
.export move_enemies
.import reset_handler



.proc ship_enemies

    LDX #$00

draw_enemies: ;start draw ship enemies

    LDA sprites_enemies,X
    STA $0214,X 
    INX
    CPX $0303
    BNE draw_enemies ;end draw ship enemies
    
.endproc


.proc move_enemies ;start to move ship enemies foward
    
    LDA $0304
    TAX
    CPX #$00 
    BEQ nothing

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
    TXA
    PHA
    TYA
    PHA
    LDX #$00
    LDY #$03
    JSR ifhited ;verify if enemie's ship hited the player
    PLA
    TAX
    PLA
    TAY

    RTS


nothing:
  RTS

ifhited:

    INX
    TXA
    PHA
   
    JSR valid_y

    INY
    INY
    INY
    INY

    PLA
    TAX
  
    CPX $0304
    BNE ifhited
    
    RTS

valid_y:

    TYA
    TAX
    DEX
    DEX
    DEX
   
    LDA $0200
    CLD
    SBC $0214,X
    JSR compare_y
    LDA $0204
    CLD
    SBC $0214,X
    JSR compare_y
    LDA $0208
    CLD
    SBC $0214,X
    JSR compare_y
    LDA $20c
    CLD
    SBC $0214,X
    JSR compare_y

    RTS


compare_y:
    CMP #$00
    BEQ valid_x
    CMP #$02
    BEQ valid_x
    CMP #$04
    BEQ valid_x
    CMP #$06
    BEQ valid_x
    CMP #$08
    BEQ valid_x
    CMP #$0a
    BEQ valid_x
    RTS


valid_x:
  
    LDA $0203
    CLD
    SBC $0214,Y
    JSR compare_x
    LDA $0207
    CLD
    SBC $0214,Y
    JSR compare_x
    LDA $20b
    CLD
    SBC $0214,Y
    JSR compare_x
    LDA $20f
    CLD
    SBC $0214,Y
    JSR compare_x

    RTS


compare_x:
    CMP #$00
    BEQ died
    CMP #$02
    BEQ died
    CMP #$04
    BEQ died
    CMP #$06
    BEQ died
    CMP #$08
    BEQ died
    CMP #$0a
    BEQ died
    RTS

.endproc

died:

   
  
    LDA #$75 ;move ship when hited
    STA $0203
    LDA #$7d
    STA $0207
    LDA #$75
    STA $20b
    LDA #$7d
    STA $20f

    LDA #$B4
    STA $0200
    STA $0204
    LDA #$BC
    STA $0208
    STA $20c ;end move ship

    LDA $0302  ;decrease life
    TAX
    DEX
    TXA
    STA $0302 ;end decrease

    LDX #$00
    LDY #$00
    
    CLD
    LDA $0302
    CMP #$00 
    BEQ draw
    

    RTS

draw:

    INY
    INX
    CPY #$04
    BNE draw
    JSR store
    CPX #$14
    BNE draw

    RTS

store:
    TXA
    PHA
    DEX
    DEX
    DEX
    LDA sprites_explosion,X
    STA $0200,X
    PLA
    TAX
    LDY #$00
    RTS

 
 
sprites_enemies:
    .byte $01, $0c, $00, $18    
    .byte $50, $0c, $00, $36 
    .byte $60, $0c, $00, $68
    .byte $33, $0c, $00, $77
    .byte $22, $0c, $00, $37

sprites_explosion:
    .byte $49, $0d, $00, $36
    .byte $46, $0d, $00, $36
    .byte $43, $0d, $00, $36
    .byte $49, $0e, $00, $41
    .byte $46, $0e, $00, $41


