.segment "CODE"
.import main
.export read_right
.proc read_right

 	CLC ;start mov ship rigth
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
	STA $20f ;end mov ship right


	;LDA $0213 ;update enemy
	;STA $0214 ;update 

    RTI



.endproc