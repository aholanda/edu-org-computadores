/*2:*/
#line 12 "./cod.w"

/*1:*/
#line 5 "./cod.w"

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 

/*:1*/
#line 13 "./cod.w"


#define HI 999999
#define LO 8

#define Mij(M, l, c) (M + l)

static long*A[HI];
static long*B[LO];

static void init(){
long j;

for(j= 0;j<HI;j++)
A[j]= (long*)calloc(HI,sizeof(long));

for(j= 0;j<LO;j++)
B[j]= (long*)calloc(LO,sizeof(long));
}

static void shutdown(){
long j;

for(j= HI-1;j>=0;j--)
free(A[j]);

for(j= LO-1;j>=0;j--)
free(B[j]);
}


static void T(long*A[],long*B[]){
long i,j;

for(i= 0;i<HI;i++)
for(j= 0;j<LO;j++)
A[i][j]= B[j][0]+A[j][i];
}

static void S(long*A[],long*B[]){
long i,j;

for(j= 0;j<LO;j++)
for(i= 0;i<HI;i++)
A[i][j]= B[j][0]+A[j][i];
}

int main(int argc,char**argv){
int usage= 0;

if(argc==2){
init();

if(strncmp("-s",argv[1],2)==0)
S(A,B);
else if(strncmp("-t",argv[1],2)==0)
T(A,B);
else
usage= 1;

shutdown();
}else
usage= 1;

if(usage){
printf("%s [-s | -t]",argv[0]);
return-1;
}else
return 0;
}

/*:2*/
