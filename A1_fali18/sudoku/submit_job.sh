#!/bin/bash
#
# You should only work under the /scratch/users/<username> directory.
#
# Example job submission script
#
# -= Resources =-
#
#SBATCH --job-name=image-blurring-jobs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --partition=short
#SBATCH --time=00:01:00

################################################################################
##################### !!! DO NOT EDIT ABOVE THIS LINE !!! ######################
################################################################################
# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a
echo

echo "Running Job...!"
echo "==============================================================================="
echo "Running compiled binary..."

# # serial version
# echo "Serial version..."
# ./sudoku_solver_cserial 16 grids/4x4_hard_3.csv

# parallel version
# for ((i=1; i<33; i=i*2));
# do 
# 	echo "Parallel part b version with $i threads"
# 	export OMP_NUM_THREADS=$i 
# 	export KMP_AFFINITY=verbose,granularity=fine,compact
# 	./sudoku_solver_cpar 16 grids/4x4_hard_3.csv
# done

# echo "Parallel part c version with 16 threads Compact"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,compact
# ./sudoku_solver_cpar 16 grids/4x4_hard_3.csv

# echo "Parallel part c version with 16 threads Scattered"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,scatter
# ./sudoku_solver_cpar 16 grids/4x4_hard_3.csv

echo "Parallel part s version with serial threads grids/4x4_hard_1.csv"
export OMP_NUM_THREADS=16
export KMP_AFFINITY=verbose,granularity=fine,scatter
./sudoku_solver_serial 16 grids/4x4_hard_1.csv

echo "Parallel part s version with serial threads grids/4x4_hard_2.csv"
export OMP_NUM_THREADS=16
export KMP_AFFINITY=verbose,granularity=fine,scatter
./sudoku_solver_serial 16 grids/4x4_hard_2.csv

echo "Parallel part s version with serial threads grids/4x4_hard_3.csv"
export OMP_NUM_THREADS=16
export KMP_AFFINITY=verbose,granularity=fine,scatter
./sudoku_solver_serial 16 grids/4x4_hard_3.csv

# echo "Parallel part c version with 16 threads grids/4x4_hard_2.csv"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,scatter
# ./sudoku_solver_cpar 16 grids/4x4_hard_2.csv

# echo "Parallel part c version with 16 threads grids/4x4_hard_3.csv"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,scatter
# ./sudoku_solver_cpar 16 grids/4x4_hard_3.csv

lscpu