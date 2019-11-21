#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

int Compute_next_value(){
    return 10;
}

// Reduction?

int main(int argc, char *argv[])
{
    int sum = 0;
    int N = 40;
    int my_sum = 0, my_x;

    #pragma omp parallel shared(sum, N) private(my_sum, my_x)
    {
        #pragma omp for
            // divides n amoung threads automatically
            for(int i = 0; i < N; i++) {
                printf("Hello from thread %d\n", i);
                my_x = Compute_next_value();
                my_sum += my_x;
            }

        #pragma omp critical(sum_lock)
            sum += my_sum;

    }

    printf("Hello from thread %d\n", sum);
}