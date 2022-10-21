ca65 src/spaceship.asm
ca65 src/reset.asm
ca65 src/read_right.asm
ca65 src/read_left.asm
ca65 src/read_ax.asm
ca65 src/read_by.asm
ca65 src/read_down.asm
ca65 src/read_start.asm
ca65 src/read_up.asm
ca65 src/background_tiles.asm
ca65 src/ship_enemies.asm
ca65 src/missile.asm

ld65 src/reset.o src/background_tiles.o src/read_ax.o src/read_by.o src/read_down.o src/read_start.o src/read_up.o src/read_right.o src/read_left.o src/spaceship.o src/ship_enemies.o src/missile.o -C nes.cfg -o spaceship.nes