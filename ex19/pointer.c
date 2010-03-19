/* vim: sw=4 sts=4 et
 * pointer.c
 * OHJ-2050 Exercise 19
 * Ilkka Laukkanen
 */
#include <stdlib.h>

#define SIZE 1000

int main(int argc, char* argv[])
{
    int array[SIZE][SIZE];
    int count = SIZE * SIZE;

    (void)argc;
    (void)argv;

    srand(1);

    while(count > 0) {
        int offset1 = (int) (((double)SIZE) * (rand() / (RAND_MAX + 1.0)));
        int offset2 = (int) (((double)SIZE) * (rand() / (RAND_MAX + 1.0)));
        *(*(array + offset1)+offset2) = rand();
        --count;
    }

    return 0;
}

