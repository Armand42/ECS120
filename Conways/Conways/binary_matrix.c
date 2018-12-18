#include "binary_matrix.h"

#include <stdio.h>
#include <stdlib.h>

/*Input:
 *	num_rows, num_cols
 *Output:
 *	A new dynamically allocated BinaryMatrix if true
 *Summary:
 *	Dynamically allocates a new BinaryMatrix in the form
 *	of a 2d array if num_rows and num_cols are greater
 *	than zero. Else, returns an error message and exits
 *	the program
 */


BinaryMatrix* ConstructBinaryMatrix(int num_rows, int num_cols) {
	int i; //Initializes a coutner to go through each value in the column
	BinaryMatrix* matrix; //Declares the new matrix
	if (num_rows > 0 && num_cols > 0){ //Tests if num_rows and num_cols are greater than 0, if true then memory will be allocated for it
		matrix = (BinaryMatrix*) malloc(sizeof(BinaryMatrix)); //Now allocate memory for the pointer 
	}else{ //If false return message and exit out of program
		printf("Error in CreateMatrix: number of rows and columns must be positive\n");
		exit(EXIT_FAILURE);
	}
	(*matrix).data = (int**) malloc(sizeof(int*) * num_rows); //Used calloc to initalize all values to 0
	for (i = 0; i < num_rows; i++){
//		(*matrix).data[i] = (int*) calloc(sizeof(int),num_cols);
		(*matrix).data[i] = (int*) calloc(num_cols, sizeof(int));
	}

	(*matrix).num_rows = num_rows; //Store value of num_rows and num_cols in matrix
	(*matrix).num_cols = num_cols;
	return matrix;
}

/*Input:
 *	BinaryMatrix type pointer
 *Output:
 *	None
 *Summary:
 *	Deallocates all the space taken up by the BinaryMatrix
 *	type pointer
 */
	
	
void DeleteBinaryMatrix(BinaryMatrix* M) {
	int j; //Create a counter to go through each index
	for (j = 0; j < (*M).num_rows; j++){
		free((*M).data[j]);
	}

	free((*M).data); //Once done, frees the entire matrix
}

/*Input:
 *	BinaryMatrix type pointer, row, col, and content
 *	to be stored in BinaryMatrix* M
 *Output:
 *	None
 *Summary:
 *	Updates the BinaryMatrix with the value of content
 *	if index from row and col is a valid index and contains
 *	the value of 0 or 1, else, returns an error message and
 *	exits the program
 */


void UpdateEntry(BinaryMatrix* M, int row, int col, int content) {
	if (content == 0 || content == 1){
		if((*M).num_rows < row || (*M).num_cols < col){
			printf("Error in Update Entry: index out of bounds\n");
			exit(EXIT_FAILURE);
		}else if ((*M).num_rows < 0 || (*M).num_cols < 0){
			printf("Error in Update Entry: index out of bounds\n");
			exit(EXIT_FAILURE);
		}else{
			(*M).data[row][col] = content;
		}
	}else{
		printf("Error in UpdateEntry: content must be 0 or 1\n");
		exit(EXIT_FAILURE);
	}
}	

/*Input:
 *	Binary Matrix type pointer, row, and col
 *Output:
 *	returns 1 if true and 0 if false
 *Summary:
 *	Tests whether or not the index from row and col is valid
 *	returning True if it is and False otherwise. Also tests
 *	if index contains a null terminator and prints an error
 *	message and exits the program if false and 1 if true
 */


int IsMatrixIndex(BinaryMatrix* M, int row, int col) {
	if (M == NULL){ //Tests if NULL
		printf("IsMatrixIndex Error: NULL parameter passed\n");
		exit(EXIT_FAILURE);
	}else{
		if ((*M).num_rows > row && row >= 0){ //Tests if row and cols are within bounds
			if ((*M).num_cols <= col){
				return 0; //Returns 0 or False if not
			}else if (col < 0){
				return 0;
			}else{
				return 1;
		
			}
		}else{
			return 0;
		} 
	}
}

/*Input:
 *	Binary Matrix type pointer
 *Output:
 *	Does not return any value but prints out each value in
 *	the BinaryMatrix one row at a time
 *Summary:
 *	Prints out each value in the Binary Matrix one row at
 *	a time
 */


void PrintMatrix(BinaryMatrix* M) {
	int i, j;
	for (i = 0; i < (*M).num_rows; i++){
		for(j = 0; j < (*M).num_cols; j++){
			printf("%d", (*M).data[i][j]);
		}printf("\n");
	}
}

