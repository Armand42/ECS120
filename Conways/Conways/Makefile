all: conways_game_of_life_driver

clean:

binary_matrix_driver: binary_matrix.o binary_matrix_driver.c
	gcc -g binary_matrix.o binary_matrix_driver.c -o binary_matrix_driver

coordinate_driver: coordinate.o coordinate_driver.c
	gcc -g coordinate.o coordinate_driver.c -o coordinate_driver

conways_game_of_life_driver: coordinate.o binary_matrix.o list.o conways_game_of_life.o conways_game_of_life_driver.c
	gcc -g coordinate.o binary_matrix.o list.o conways_game_of_life.o conways_game_of_life_driver.c -lm

list_driver: coordinate.o list.o list_driver.c
	gcc -g coordinate.o list.o list_driver.c -o list_driver -lm

binary_matrix.o:
	gcc -g -c binary_matrix.c

coordinate.o: coordinate.c
	gcc -g -c coordinate.c -lm

conways_game_of_life.o: conways_game_of_life.c
	gcc -g -c conways_game_of_life.c


list.o: list.c
	gcc -g -c list.o




