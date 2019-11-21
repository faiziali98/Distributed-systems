icc: sudoku_solver.c
	icc sudoku_solver_serial.c -o sudoku_solver_serial -qopenmp -lm
	icc sudoku_solver.c -o sudoku_solver_a -qopenmp -lm
	icc sudoku_solver_pb.c -o sudoku_solver_b -qopenmp -lm
	icc sudoku_solver_pc.c -o sudoku_solver_c -qopenmp -lm

gcc: sudoku_solver.c
	gcc -o sudoku_solver sudoku_solver_pc.c -fopenmp -lm
