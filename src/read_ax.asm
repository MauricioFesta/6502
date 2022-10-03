
.segment "CODE"
.import main
.export read_ax

.proc read_ax

    ;   drawShip:
    ;   LDA ammunition,X
    ;   STA $0212,X
    ;   CPX #$04
    ;   INX
    ;   BNE drawShip
  
  RTI 


.endproc