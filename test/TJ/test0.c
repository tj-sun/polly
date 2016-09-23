#define N 1536

float A[N];
float B[N];
float C[N];

float AA[N][N];
float BB[N][N];
float CC[N][N];


int main(int argc, char* argv[]){
    // int i,j,k;
    int q = argv[0][0];
    A[q] = B[q] + C[q];
    // for (i=0; i<N; i++){
    //     C[i] = A[i] + B[i];
    //     CC[q][i] = AA[q][i] + BB[q][i];
    // }
    // for(i=0; i<N; i++)  {
    //     for(j=0; j<N; j++)  {
    //         CC[i][j] = 0;
    //         for(k=0; k<N; k++)
    //             C[i][j] = C[i][j] + A[i][k] * B[k][j];
    //     }
    // }
}