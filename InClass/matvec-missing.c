#include <mpi.h>
#include <stdio.h>
#include <sys/time.h>

#define N 3000

int main(int argc, char *argv[])
{
  int P, i, myrank, M;
  int i, j;
  double t_start, t_end;
  double **my_A, *my_x, *my_y, *x, *y;

  /* Initializations */
  MPI_Init(&argc, &argv);
  MPI_Comm_size(MPI_COMM_WORLD, &P);
  MPI_Comm_rank(MPI_COMM_WORLD, &myrank);

  M = N / P; // Assuming N is a multiple of P

  my_x = (double*) malloc(M * sizeof(double));
  my_y = (double*) malloc(M * sizeof(double));
  x = (double*) malloc(N * sizeof(double));
  y = (double*) malloc(N * sizeof(double));
  
  A = (double**) malloc(M * sizeof(double*));
  
  for (i = 0; i < M; ++i)
    A[i] = (double*) malloc(N * sizeof(double));

  //initialize local arrays (e.g. from a file)
  srand(time(NULL));
  for (i = 0; i < M; ++i) {
    my_x[i] = rand()/N;
    my_y[i] = rand()/N;
    for (j = 0; j < N; ++j)
      A[i][j] = rand()/N;
  }

  /* collect x vector on all processors */
  /* first copy my_x into x */
  for (j = 0; j < M; ++j)
    x[myrank*M +j] = my_x[j];




  /* local computations */
  for (i = 0; i < M; ++i)
    for (j = 0; j < N; ++j)
      my_y[i] += A[i][j] * x[j];





  MPI_Finalize();
  return 0;
}
