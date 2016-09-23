#include <stdio.h>

#define N 1536
float A[N][N];
float B[N][N];
float C[N][N];

void init_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            A[i][j] = (1+(i*j)%1024)/2.0;
            B[i][j] = (1+(i*j)%1024)/2.0;
        }
    }
}

void print_array()
{
    int i, j;

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            fprintf(stdout, "%lf ", C[i][j]);
            if (j%80 == 79) fprintf(stdout, "\n");
        }
        fprintf(stdout, "\n");
    }
}

int main(int argc, char* argv[])
{
    int i, j, k;
    double t_start, t_end;

    init_array();

    int Q = argv[0];

    for(i=0; i<N; i++)  {
        for(j=0; j<N; j++)  {
            C[i+Q][j] = 0;
            for(k=0; k<N; k++)
                C[i+Q][j] = C[i][j] + A[i][k] * B[k][j];
        }
    }

#ifdef TEST
    print_array();
#endif
    return 0;
}
