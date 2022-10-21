.segment "CODE"
.import main
.import reset_handler
.export read_ax
.import missile_one

.proc read_ax


 JSR missile_one

 RTI

.endproc

    



