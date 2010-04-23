/*
 * A program that does a bunch of matrix multiplication and times it
 */

#include <iostream>
#include <cstdlib>
#include <ctime>
#include <boost/progress.hpp>

namespace {
    const unsigned int SIZE = 500;
    const unsigned int MAXVAL = 100;
    const unsigned int TIMES = 50;

    void fill_with_random(int M[SIZE][SIZE])
    {
        for (unsigned int row = 0; row < SIZE; ++row) {
            for (unsigned int col = 0; col < SIZE; ++col) {
                M[row][col] = rand() % MAXVAL;
            }
        }
    }

    void static_multi()
    {
        static int A_s[SIZE][SIZE];
        static int B_s[SIZE][SIZE];
        static int C_s[SIZE][SIZE];

        fill_with_random(A_s);
        fill_with_random(B_s);
        fill_with_random(C_s);

        boost::progress_timer t;
        for (unsigned int counter = 0; counter < TIMES; ++counter) {
            for (unsigned int row = 0; row < SIZE; ++row) {
                for (unsigned int col = 0; col < SIZE; ++col) {
                    C_s[row][col] = 0;
                    for (unsigned int acol = 0, brow = 0; acol < SIZE && brow < SIZE; ++acol, ++brow) {
                        C_s[row][col] += A_s[row][acol] * B_s[brow][col];
                    }
                }
            }
        }
    }

    void stack_dynamic_multi()
    {
        int A[SIZE][SIZE];
        int B[SIZE][SIZE];
        int C[SIZE][SIZE];

        fill_with_random(A);
        fill_with_random(B);
        fill_with_random(C);

        boost::progress_timer t;
        for (unsigned int counter = 0; counter < TIMES; ++counter) {
            for (unsigned int row = 0; row < SIZE; ++row) {
                for (unsigned int col = 0; col < SIZE; ++col) {
                    C[row][col] = 0;
                    for (unsigned int acol = 0, brow = 0; acol < SIZE && brow < SIZE; ++acol, ++brow) {
                        C[row][col] += A[row][acol] * B[brow][col];
                    }
                }
            }
        }
    }
}

int main()
{
    srand((unsigned int)time(NULL));
    std::cout << "Static:" << std::endl;
    static_multi();
    std::cout << "Stack-dynamic:" << std::endl;
    stack_dynamic_multi();
    return 0;
}

