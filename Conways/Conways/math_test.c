#include <stdio.h>
#include <math.h> //This is the library you can use for math functions
int main(){
	int x, y;
	printf("Enter a number: ");
	scanf("%d",&x);
	printf("\nEnter another number: ");
	scanf("%d",&y);
	float z;
	z = pow(x, y);
	printf("%d to the power of %d is %.2f\n",x,y,z);
	return 0;
}
