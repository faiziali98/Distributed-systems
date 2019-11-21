#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

// Threads are created well before the parellel region but are used agfter
// It creates the thread pool

int main (int argc, char* argv[]){
    int thread_count = 5;

    // removing num_threads will give the number of available threads

    #pragma omp parallel num_threads(thread_count) 
    {
        int myID = omp_get_thread_num();

        int num_threads = omp_get_num_threads;
        printf("Hello from thread %d of %d\n", myID, num_threads);
    }

    return 0;
}