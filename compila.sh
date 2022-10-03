ca65 src/spaceship.asm
ca65 src/reset.asm
ca65 src/read_right.asm
ca65 src/read_left.asm
ca65 src/read_ax.asm
ca65 src/read_by.asm
ca65 src/read_down.asm
ca65 src/read_start.asm
ca65 src/read_up.asm

ld65 src/reset.o src/read_ax.o src/read_by.o src/read_down.o src/read_start.o src/read_up.o src/read_right.o src/read_left.o src/spaceship.o -C nes.cfg -o spaceship.nes