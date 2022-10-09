
.segment "CODE"
.import main
.export read_left

.proc read_left

    CLD  ;start moc ship left
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
	STA $20f ;end mov ship left

	RTI


.endproc