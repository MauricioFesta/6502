.include "constants.inc"
.include "header.inc"

.segment "CODE"
.proc irq_handler
  RTI
.endproc


.import read_right
.import read_left
.import read_down
.import read_ax
.import read_by
.import read_up
.import read_start

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
  LDX #$00
  JMP read_ax
 ReadAandXDone:

ReadBandY: 
	LDA $4016       ; player 1 - A
	AND #%00000001  
	BEQ ReadBandYDone
	JMP read_by

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
  JMP read_start

ReadStartDone:

ReadUp: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadUpDone  
  JMP read_up

ReadUpDone:

ReadDown: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadDownDone
  JMP read_down

ReadDownDone:

 
ReadLeft: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadLeftDone 
  JMP read_left
	
ReadLeftDone:
	

ReadRight: 
  LDA $4016       ; player 1 - A
  AND #%00000001
  BEQ ReadRigthDone 
  JMP read_right
 
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
	LDA sprites_ship,X
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


ammunition:
.byte $70, $09, $00, 80
palettes:
.byte $0f, $12, $23, $27
.byte $0f, $2b, $3c, $39
.byte $0f, $0c, $07, $13
.byte $0f, $19, $09, $29

.byte $0f, $2d, $10, $15
.byte $0f, $19, $09, $29
.byte $0f, $19, $09, $29
.byte $0f, $19, $09, $29

sprites_ship:
.byte $70, $05, $00, $10
.byte $70, $06, $00, $18	
.byte $78, $07, $00, $10
.byte $78, $08, $00, $18



.segment "CHR"
.incbin "graphics.chr"