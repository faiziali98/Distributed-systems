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
#SBATCH --time=00:30:00

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
for ((i=0; i<7; i=i+1));
do
	echo "Serial version..."
	./image_blurring cilek.png
done
# #parallel version
# for ((i=1; i<33; i=i*2));
# do 
# 	echo "Parallel version with $i threads"
# 	export OMP_NUM_THREADS=$i 
# 	export KMP_AFFINITY=verbose,granularity=fine,compact
# 	./image_blurring_parallel cilek.png
# done

# echo "Parallel version with 16 threads Compact"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,compact
# ./image_blurring_parallel coffee.png

# echo "Parallel version with 16 threads Scattered"
# export OMP_NUM_THREADS=16
# export KMP_AFFINITY=verbose,granularity=fine,scatter
# ./image_blurring_parallel coffee.png
