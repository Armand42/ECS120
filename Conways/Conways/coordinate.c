#include "coordinate.h"

#include <stdio.h>
#include <stdlib.h>
#include <math.h> //Calculate distance with square root

/*
 *Input:
 *	int x, an x-coordinate
 *	int y, a y-coordinate
 *Output:
 *	A Coordinate
 *Summary:
 *	Initializes a Coordinate to (x,y)
 */


Coordinate ConstructCoordinate(int x, int y) {
	Coordinate initialize_coordinate;//Create Coordinate data type
	initialize_coordinate.x = x; //Assign inputs to struct
	initialize_coordinate.y = y;
	return initialize_coordinate;
}


/*
 *Input:
 *	Coordinate C1, a coordinate
 *	Coordinate C2, another coordinate
 *Output:
 *	true if C2 is a neighbor of C1, false otherwise
 *Summary:
 *	Checks if C1 and C2 are neighbors, that is, if they
 * 	are in adjacent squares (including squares that are
 *	diagonally adjacent) and not equal
 */


int IsNeighbor(Coordinate C1, Coordinate C2) {
	double distance = sqrt(pow((double)(C2.y - C1.y),2.0) + pow((double)(C2.x - C1.x),2.0));
	if (distance == 0.0){ //Meanse C1 and C2 are the same coordinate point
		return 0;
	}else if (distance == sqrt(2.0)){//Means coordinates are diagonal to each other
		return 1;
	}else if (distance == 1.0){//Means Coordinates are adjacent to each other
		return 1;
	}else{
		return 0;
	}
}

/*
 *Input:
 *	Coordinate* C, a pointer to a Coordinate
 *Summary:
 *	Swaps the entries of the Coordinate pointed to by C
 */


void SwapCoordinates(Coordinate* C) {
	int temp_x_coord = (*C).x;
	(*C).x = (*C).y;
	(*C).y = temp_x_coord;
}

