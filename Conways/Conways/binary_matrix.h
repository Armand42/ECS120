/*
 * binary_matrix.h
 * Garland Yee / 912739579 
 * An implementation of a Binary Matrix
 */

#ifndef _BINARY_MATRIX_H_
#define _BINARY_MATRIX_H_

typedef struct{
	int num_rows;
	int num_cols;
	int ** data;
}BinaryMatrix;

BinaryMatrix* ConstructBinaryMatrix(int num_rows, int num_cols);
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

void DeleteBinaryMatrix(BinaryMatrix* M);
/*Input:
 * 	BinaryMatrix type pointer
 *Output:
 *	None
 *Summary:
 *	Deallocates all the space taken up by the BinaryMatrix
 *	type pointer
 */

void UpdateEntry(BinaryMatrix*M, int row, int col, int content);
/*Input:
 * 	BinaryMatrix type pointer, row, col, and content
 * 	to be stored in BinaryMatrix* M
 * Output:
 * 	None
 * Summary:
 * 	Updates the BinaryMatrix with the value of content
 * 	if index from row and col is a valid index and contains
 * 	the value of 0 or 1, else, returns an error message and 
 * 	exits the program
 */

int IsMatrixIndex(BinaryMatrix* M, int row, int col);
/*Input:
 * 	Binary Matrix type pointer, row, and col
 * Output:
 * 	returns 1 if true and 0 if false
 * Summary:
 * 	Tests whether or not the index from row and col is valid
 * 	returning True if it is and False otherwise. Also tests
 * 	if index contains a null terminator and prints an error
 * 	message and exits the program if false and 1 if true
 */

void PrintMatrix(BinaryMatrix* M);
/*Input:
 * 	Binary Matrix type pointer
 *Output:
 *	Does not return any value but prints out each value in
 *	the BinaryMatrix one row at a time
 *Summary:
 *	Prints out each value in the Binary Matrix one row at
 *	a time
 */
#endif /* _BINARY_MATRIX_H_ */
