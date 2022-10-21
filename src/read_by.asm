
.segment "CODE"
.import main
.import ship_enemies
.export read_by

.proc read_by

    JSR ship_enemies

    RTI

.endproc