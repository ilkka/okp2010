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
        int offset = (int) (((double)SIZE*SIZE) * (rand() / (RAND_MAX + 1.0)));
        **(array + offset) = rand();
        --count;
    }

    return 0;
}

