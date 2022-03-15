#include <stdio.h>
#include <stdlib.h>
int massiv[4] = { 128, 10, 12, 144 };
int main()
{
	int i;
	int summ = 0;
	for (i = 0; i < 4; i++)
	{
		if ((massiv[i] & 128) == 128)
		{
			massiv[i] = massiv[i] >> 1;
			summ = summ + massiv[i];
		}
	}
	printf("%i\n", summ);
	return 0;
}