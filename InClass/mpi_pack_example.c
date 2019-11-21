int i;
char c[100];
char buffer[110];
int position=0;

//pack
MPI_Pack(&i,1,MPI_INT,buffer,110,&position,MPI_COMM_WORLD);
MPI_Pack(c,100,MPI_CHAR,buffer,110,&position,MPI_COMM_WORLD);
//send
MPI_Send(buffer,position,MPI_PACKED,1,0,MPI_COMM_WORLD);
