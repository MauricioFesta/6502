.export delay
.proc delay

delayloop:  ;start delay loop
    ADC #08
    BNE delayloop
    CLC
    INC $41
    BNE delayloop ;end delay
    RTS


.endproc