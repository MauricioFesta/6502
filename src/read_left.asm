
.segment "CODE"
.import main
.export read_left

.proc read_left

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


.endproc