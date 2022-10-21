.include "constants.inc"
.segment "CODE"
.import main
.export background_tiles
.export background_scroll

.proc background_tiles
	
	LDA #$20 ;big stars first
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
	STX PPUDATA ;end big star

	
	LDA #$20  ;start small star 1
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
	STX PPUDATA ;end small star 1

	
	LDA #$20 ;start small star 2
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
	STX PPUDATA ;end small star 2
	
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

	RTS


.endproc


.proc background_scroll

	; LDA PPUSTATUS
	; LDA #$20 ;start number
	; STA PPUADDR
	; LDA PPUADDR
	; CLD
	; ADC #$01
	; STA PPUADDR
	; LDX #$1f
	; STX PPUDATA ;end number


	LDA #$00 ;start scroll
	STA PPUSCROLL 
	CLD
	DEC $0300
	LDA $0300
	CMP #$00
	BEQ reset_scroll
	STA PPUSCROLL ;end scroll
	STA $0300


	RTS


reset_scroll:

  LDA #239
  STA PPUSCROLL
  STA $0300
  RTS

.endproc