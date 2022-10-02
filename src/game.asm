.include "constants.inc"
.include "header.inc"

.segment "CODE"
.proc irq_handler
  RTI
.endproc

.proc nmi_handler

  	LDA #$00
  	STA OAMADDR
  	LDA #$02
  	STA OAMDMA
	LDA #$00
	STA $2005
	STA $2005

LatchController:
	LDA #$01
	STA $4016
	LDA #$00
	STA $4016       ; tell both the controllers to latch buttons
	

ReadAandX: 
  LDA $4016       ; player 1 - A
  AND #%00000001 
  BEQ ReadAandXDone
  RTI 
 
ReadAandXDone:

ReadBandY: 
	LDA $4016       ; player 1 - A
	AND #%00000001  
	BEQ ReadBandYDone
	RTI 

ReadBandYDone:
	
ReadBack: 
  LDA $4016       ; player 1 - A
  AND #%00000001 
  BEQ ReadStart  
  JMP reset_handler
  

ReadStart: 
  LDA $4016       ; player 1 - A
  AND #%00000001 
  BEQ ReadStartDone 
  RTI

ReadStartDone:

ReadUp: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadUpDone  

  CLD
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
  STA $20c

  RTI


ReadUpDone:

ReadDown: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadDownDone

  CLD
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
  STA $20c

  RTI

ReadDownDone:

 
ReadLeft: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadLeftDone 

	CLD
    LDA $0203
	TAX
	DEX
	DEX
	DEX
	DEX
	DEX
	TXA
	STA $0203
	
	CLD
	LDA $0207
	TAX
	DEX
	DEX
	DEX
	DEX
	DEX
	TXA
	STA $0207	

	CLD
	LDA $20b
	TAX
	DEX
	DEX
	DEX
	DEX
	DEX
	TXA
	STA $20b

	CLD
	LDA $20f
	TAX
	DEX
	DEX
	DEX
	DEX
	DEX
	TXA
	STA $20f

	RTI



ReadLeftDone:
	

ReadRight: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadRigthDone 

  	CLC
	LDA $0203
	TAX
	INX
	INX
	INX
	INX
	INX
	TXA
	STA $0203
	
	CLD
	LDA $0207
	TAX
	INX
	INX
	INX
	INX
	INX
	TXA
	STA $0207	

	CLD
	LDA $20b
	TAX
	INX
	INX
	INX
	INX
	INX
	TXA
	STA $20b

	CLD
	LDA $20f
	TAX
	INX
	INX
	INX
	INX
	INX
	TXA
	STA $20f

	RTI



ReadRigthDone:
	RTI  

.endproc

.import reset_handler

.export main
.proc main
  ; write a palette
  LDX PPUSTATUS
  LDX #$3f
  STX PPUADDR
  LDX #$00
  STX PPUADDR
load_palettes:
  LDA palettes,X
  STA PPUDATA
  INX
  CPX #$20
  BNE load_palettes
  LDX #$00
 
load_sprites:
	LDA sprites1,X
	STA $0200,X
	CPX #$10
	INX
	BNE load_sprites
	LDX #$00


	; LDA $0204
	; CLD
	; ADC #$05
	; STA $0204

	; LDA $0208
	; CLD
	; ADC #$05
	; STA $0208

	; LDA $20c
	; CLD
	; ADC #$05
	; STA $20c

	; write nametables
	; big stars first
	LDA #$20
	STA PPUADDR
	LDA #$4b
	STA PPUADDR
	LDX #$2f
	STX PPUDATA

	LDA #$21
	STA PPUADDR
	LDA #$59
	STA PPUADDR
	STX PPUDATA

	LDA #$22
	STA PPUADDR
	LDA #$23
	STA PPUADDR
	STX PPUDATA

	LDA #$23
	STA PPUADDR
	LDA #$52
	STA PPUADDR
	STX PPUDATA

	; next, small star 1
	LDA #$20
	STA PPUADDR
	LDA #$74
	STA PPUADDR
	LDX #$2d
	STX PPUDATA

	LDA #$21
	STA PPUADDR
	LDA #$43
	STA PPUADDR
	STX PPUDATA

	LDA #$21
	STA PPUADDR
	LDA #$5d
	STA PPUADDR
	STX PPUDATA

	LDA #$21
	STA PPUADDR
	LDA #$73
	STA PPUADDR
	STX PPUDATA

	LDA #$22
	STA PPUADDR
	LDA #$2f
	STA PPUADDR
	STX PPUDATA

	LDA #$22
	STA PPUADDR
	LDA #$f7
	STA PPUADDR
	STX PPUDATA

	; finally, small star 2
	LDA #$20
	STA PPUADDR
	LDA #$f1
	STA PPUADDR
	LDX #$2e
	STX PPUDATA

	LDA #$21
	STA PPUADDR
	LDA #$a8
	STA PPUADDR
	STX PPUDATA

	LDA #$22
	STA PPUADDR
	LDA #$7a
	STA PPUADDR
	STX PPUDATA

	LDA #$23
	STA PPUADDR
	LDA #$44
	STA PPUADDR
	STX PPUDATA

	LDA #$23
	STA PPUADDR
	LDA #$7c
	STA PPUADDR
	STX PPUDATA

	
	; finally, attribute table
	LDA #$23
	STA PPUADDR
	LDA #$c2
	STA PPUADDR
	LDA #%01000000
	STA PPUDATA

	LDA #$23
	STA PPUADDR
	LDA #$e0
	STA PPUADDR
	LDA #%00001100
	STA PPUDATA

vblankwait:       ; wait for another vblank before continuing
  BIT PPUSTATUS
  BPL vblankwait

  LDA #%10010000  ; turn on NMIs, sprites use first pattern table
  STA PPUCTRL
  LDA #%00011110  ; turn on screen
  STA PPUMASK

forever:
  JMP forever
.endproc

.segment "VECTORS"
.addr nmi_handler, reset_handler, irq_handler

.segment "RODATA"
palettes:
.byte $0f, $12, $23, $27
.byte $0f, $2b, $3c, $39
.byte $0f, $0c, $07, $13
.byte $0f, $19, $09, $29

.byte $0f, $2d, $10, $15
.byte $0f, $19, $09, $29
.byte $0f, $19, $09, $29
.byte $0f, $19, $09, $29

sprites1:
.byte $70, $05, $00, $10
.byte $70, $06, $00, $18	
.byte $78, $07, $00, $10
.byte $78, $08, $00, $18




.segment "CHR"
.incbin "graphics.chr"