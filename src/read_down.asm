.segment "CODE"
.import main
.export read_down

.proc read_down

  CLD   ;start mov ship down
  LDA $0200 
  TAX
  INX
  INX
  INX
  INX
  INX
  TXA
  STA $0200

  CLD
  LDA $0204
  TAX
  INX
  INX
  INX
  INX
  INX
  TXA
  STA $0204

  CLD
  LDA $0208
  TAX 
  INX
  INX
  INX
  INX
  INX
  TXA	
  STA $0208

  CLD
  LDA $20c
  TAX
  INX
  INX
  INX
  INX
  INX
  TXA
  STA $20c ;end mov ship down

  RTI


.endproc