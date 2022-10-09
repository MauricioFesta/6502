
.segment "CODE"
.import main
.export read_up

.proc read_up

  CLD ;start movm ship up
  LDA $0200
  TAX
  DEX
  DEX
  DEX
  DEX
  DEX
  TXA
  STA $0200

  CLD
  LDA $0204
  TAX
  DEX
  DEX
  DEX
  DEX
  DEX
  TXA
  STA $0204

  CLD
  LDA $0208
  TAX
  DEX
  DEX
  DEX
  DEX
  DEX
  TXA
  STA $0208

  CLD 
  LDA $20c
  TAX
  DEX
  DEX
  DEX
  DEX
  DEX
  TXA
  STA $20c ;end mov ship up

  RTI


.endproc