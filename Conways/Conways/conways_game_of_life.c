#include "conways_game_of_life.h"
//#include "coordinate.h"
//#include "binary_matrix.h"
#include <stdio.h>
#include <stdlib.h>



/*
 * Input:
 *      int num_rows, the number of rows in the game
 *      int num_cols, the number of cols in the game
 * Output:
 *      Returns a BinaryMatrix* that corresponds to the
 *      first generation game state
 * Summary:
 *      Returns the game state of the first generation
 */
BinaryMatrix* FirstGeneration(int num_rows, int num_cols, List* seed_cells) {
	int i, j; 
	List *temp = (List*) malloc(sizeof(List));
	temp -> head = (ListNode*) malloc(sizeof(ListNode));
	temp = seed_cells; //Create a list* to go through each value in seed_cells
	//Allocate memory for the pointer
	BinaryMatrix* first_generation;
	first_generation = ConstructBinaryMatrix(num_rows,num_cols);
	//Potential change to while (temp -> head != NULL) ?
	while (temp -> head != (ListNode*)(NULL)){
	//Tests validity of coordinate from rows and cols
		UpdateEntry(first_generation, temp -> head -> data.x, temp -> head -> data.y, 1);
		temp -> head = temp -> head -> next; //Need to check for NULL?
	}
	

	return first_generation; 
}

/*
 * Input:
 * 	BinaryMatrix* generation, a pointer to a game state
 * Output:
 * 	Returns a BinaryMatrix*, a pointer to a game state
 * Summary:
 * 	Calculates the game state of the generation directly
 * 	after *generation and returns it
 */

BinaryMatrix* NextGeneration(BinaryMatrix* generation) {
	int i, j, alive_count, live; //Initializes counters: i and j go through the matrix
	//And alive_count counts number of living neighbors
	BinaryMatrix* next_generation = ConstructBinaryMatrix((*generation).num_rows, (*generation).num_cols);
	Coordinate coord; //Creates coordinate data type to store the row and col
	List *neighbor_list; //Creates a List* to store all the neighbors for the coordinate
	neighbor_list = ConstructList(); 


	for (i = 0; i < generation -> num_rows; i++){
		for (j = 0; j < generation -> num_cols; j++){ //Goes through every index in the matrix
			coord = ConstructCoordinate(i,j); //Create a Coordinate from the index
			neighbor_list = NeighboringCells(coord, generation); //Creates the neighbor list from the coordinate
			alive_count = LivingNeighbors(generation, neighbor_list); //Get number of neighbors alive
			live = (Live(generation, coord)); //Tests if the coordinate is a living cell
		//Now test the coordinates using Conway's four rules
		//Make a list of neighbors that are aroudn the current coordinate
		//First Test: To see if the coordinate is first alive
			if (live == 1){ //Coordinate is alive
			//Second Test: See if there are two or three neighbors
				if (alive_count == 2 || alive_count == 3){//Cell is alive
					UpdateEntry(next_generation, coord.x, coord.y, 1);
				}else if (alive_count >= 4){//Cell dies from overcrowding
					UpdateEntry(next_generation, coord.x, coord.y, 0);
				}else if (alive_count == 0 || alive_count == 1){ //Cell dies from starvation
					UpdateEntry(next_generation, coord.x, coord.y, 0);					
				}
			}else if (live == 0){ //Cell is dead
				if (alive_count == 3){//Cell is born
					UpdateEntry(next_generation, coord.x, coord.y, 1);
				}
			}
			
		}
			 
	}
	return next_generation;
}

/*
 * Input:
 *      BinaryMatrix* generation, a pointer to a game state
 *      Coordinate coord, a cell of the game state
 * Output:
 *      Returns true if the cell is Live
 * Summary:
 *      Checks if coord is a valid index of *generation and
 *      its corresponding cell is Live
 */
int Live(BinaryMatrix* generation, Coordinate coord) {
	
	if ((*generation).data[coord.x][coord.y] == 1){//Test if cell is alive
		return 1;
	}else{
		return 0;
	}

}	

/*
 * Input:
 *      Coordinate coord, a cell of the game state
 *      BinaryMatrix* generation, a pointer to a game state
 * Output:
 *      Returns a List* to a List of neighboring cells
 * Summary:
 *      Calculates neighboring cells of *generation at coord and
 *      returns them as a List
 */
List* NeighboringCells(Coordinate coord, BinaryMatrix* generation) {
    List* result = ConstructList();
    int i, j;
    if (result == (List*) NULL) {
        printf("Error in NeighboringCells: List construction failed\n");
        exit(EXIT_FAILURE);
    }
    for (i = -1; i <= 1; i++) {
        for (j = -1; j <= 1; j++) {
            Coordinate coord_neighbor = ConstructCoordinate(coord.x + i, coord.y + j);
            if (IsNeighbor(coord, coord_neighbor) && IsMatrixIndex(generation, coord.x + i, coord.y + j)) {
                PushFrontList(result, coord_neighbor);
            }
        }
    }
    return result;
}

/*
 * Input:
 *      BinaryMatrix* generation, a pointer to a game state
 *      List* neighbors, a List of neighbors of a coordinate
 * Output:
 *      Returns the number of neighboring cells that are Live
 * Summary:
 *      Counts the number of Coordinates in *neighbors that
 *      correspond to live cells in *generation
 */
int LivingNeighbors(BinaryMatrix* generation, List* neighbors) {
	int living_number = 0;
	List *temp_neighbors; //Creates a List* that will be iterated through
	temp_neighbors = (List*) malloc(sizeof(List));
	temp_neighbors -> head = (ListNode*) malloc(sizeof(ListNode)); //Allocates memory for
	//the first in the list
	temp_neighbors = neighbors; //Copies the inputted list into the newly created list
	while (temp_neighbors -> head != (ListNode*) NULL){ 
		Coordinate temp; //Creates a coordinate value from the input
		temp.x = temp_neighbors -> head -> data.x;
		temp.y = temp_neighbors -> head -> data.y;	
		if (Live(generation,temp) == 1){ //Now tests coordinate value if it is living using Live
			living_number++;
		}
		temp_neighbors -> head = temp_neighbors -> head -> next;//Goes to next in the list
	}

	return living_number;
}

/*
 * Input:
 *      BinaryMatrix* generation, a pointer to a game state
 *      FILE* fp, a file opened for writing
 * Summary:
 *      Prints the game state of *generation to *fp
 */
void PrintGeneration(BinaryMatrix* generation, FILE* fp) {
    int i, j;
    for (i = 0; i < generation->num_rows; i++) {
        for (j = 0; j < generation->num_cols; j++) {
            if (Live(generation, ConstructCoordinate(i, j))) {
                fprintf(fp, "#");
            } else {
                fprintf(fp, " ");
            }
        }
        fprintf(fp, "\n");
    }
    return;
}
