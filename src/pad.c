/*3:*/
#line 86 "./cod.w"

/*1:*/
#line 5 "./cod.w"

#include <stdio.h> 
#include <stdlib.h> 
#include <string.h> 

/*:1*/
#line 87 "./cod.w"

#include <math.h> 

#define NPAD 63

struct l{
long pad[NPAD];
struct l*next;
};

int main(int argc,char**argv){
int exp;
long nelems,i;
struct l*L,*p;

if(argc==2){
exp= atoi(argv[1]);
printf("working with exponent %d\n",exp);
}else{
fprintf(stderr,"%s #exponent of 2^#exp\n",argv[0]);
exit(-1);
}


nelems= pow(2,exp);
printf("Creating %ld elements of array field of list.\n",nelems);

p= L= (struct l*)calloc(nelems,sizeof(struct l));

for(i= 0;i<nelems;i++)
p++;

free(L);

return 0;
}/*:3*/
