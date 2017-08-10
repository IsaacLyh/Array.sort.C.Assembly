#include <stdio.h>
#include <stdlib.h>
#include "arraysort_ARM.h"



int main(){
  list* ptr = createlist_ARM(1);
  int c1 =insert_ARM(ptr,13);
  int xs = insert_ARM(ptr,14);
  int sss = insert_ARM(ptr,11); 
  int e= insert_ARM(ptr,11);
  int d= insert_ARM(ptr,11);
 int gfd= insert_ARM(ptr,11);
 int sed= insert_ARM(ptr,11);
 int rrred= insert_ARM(ptr,11);
 int eeed= insert_ARM(ptr,11);
 int sssed= insert_ARM(ptr,11);
 int ssed= insert_ARM(ptr,11);
 int xxed= insert_ARM(ptr,11);
  print_ARM(ptr);
  int x = remove_val_ARM(ptr,11);
  printf("\n %d \n",x);
  
  print_ARM(ptr); 
  }
  
  
