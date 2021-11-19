#pragma warning(disable : 4996)
#define ZF_DLL  /* Required only for dynamically linked libraries. */
#include <iris-cdzf.h>  /* Required for all Callout code. */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//#define DEBUG 
int print() {
   printf(u8"あいうえお\n");
   fflush(stdout);
   return ZF_SUCCESS;   /* set the exit status code */
}

int addTwoIntegers(int a, int b, int *outsum) {
   *outsum = a+b;   /* set value to be returned by the $ZF function call */
   return ZF_SUCCESS;   /* set the exit status code */
}

#define SIZEOFELEMENT 10
#define IRISLISTTYPEDOUBLE 8
#define ELEMENTCOUNT 1000

int decode(int seq, char *line, int *out) {
   double *p;
   int   rc= 0;
   Callin_char_t *gloref="";
   Callin_char_t val[30000];

#ifdef DEBUG
   /* hex dump of input parameter line */
   for (int i=0;i<ELEMENTCOUNT*sizeof(double);i++) {
      printf("%d %02x\r\n",i,line[i]&0x000000FF);
   }   
#endif

   gloref="Util.RecordD";
   rc = IRISPUSHGLOBAL(strlen((const char *)gloref), gloref);
   rc = IRISPUSHINT(seq);

   p=(double*)line;
   for (int i=0;i<ELEMENTCOUNT;i++) {

#ifdef DEBUG
      double d;
      d=(double)*p;
      /* value of each element */
      printf("%p %d %lf\r\n",p,i,d);
#endif

      val[i*SIZEOFELEMENT+0]=SIZEOFELEMENT;
      val[i*SIZEOFELEMENT+1]=IRISLISTTYPEDOUBLE;

#ifdef DEBUG
      /* hex dump of each element */
      for (int j=0;j<sizeof(double);j++) {
         char *x;
         x=(char*)p+j;
         printf("\t%d %02x\r\n",j,*x&0x000000FF);
      }  
#endif
      memcpy(&val[i*SIZEOFELEMENT+2],(char*)p,8);
      p++;
   }
   rc = IRISPUSHSTR(SIZEOFELEMENT*ELEMENTCOUNT, val);

#ifdef DEBUG
   fflush(stdout);
#endif

   rc=IRISGLOBALSET(1);  
   if (rc!=IRIS_SUCCESS) {return !ZF_SUCCESS;}
   return ZF_SUCCESS;   /* set the exit status code */
}

ZFBEGIN
   ZFENTRY("Print","",print)
   ZFENTRY("AddInt","iiP",addTwoIntegers)
   ZFENTRY("Decode","icP",decode)
ZFEND