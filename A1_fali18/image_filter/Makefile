icc: image_blurring.c stb_image.h stb_image_write.h
	icc image_blurring.c -o image_blurring_parallel -qopenmp -lm

gcc: image_blurring.c stb_image.h stb_image_write.h
	icc -g -o image_blurring image_blurring_serial.c -fopenmp -lm
