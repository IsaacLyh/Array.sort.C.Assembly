// Put your name(s) and PID(s) here and a quick summary of what this does here
//PID:A91018743
//NAME:YUHANG LIAN

#include <stdio.h>
#include <stdlib.h>

#include "arraysort.h"

//test for createList
list* test_createList(int max){
    printf("setting max size to %d \n",max);
    list * ptr = createlist(max);
    return ptr;
}

//test for insert
void test_insert(list* ptr,int val){
    printf("inserting val = %d \n",val);
    insert(ptr,val);
    printf("size = %d \n",ptr->size);
}

//test for remove
int test_remove(list* ptr,int val){
   return remove_val(ptr, val);
}

//test for get_max_value
int test_getMax(list* ptr){
   return get_max_value(ptr);
}
//test for get_min_value
int test_getMin(list* ptr){
   return get_min_value(ptr);
}

//test for search
int test_search(list* ptr, int val){
   print(ptr);
   return search(ptr, val);
}

//test for pop_min
int test_popMin(list* ptr){
    return pop_min(ptr);
}

//test print
void test_print(list* ptr){
    print(ptr);
}

int main(void)
{
    //Put your test code here
    //test for createList
    list* ptr = test_createList(5);
    list* null = NULL;
    //test for insert;
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,1);
    test_insert(ptr,2);
    test_insert(ptr,3);
    test_insert(ptr,1);
    test_insert(ptr,2);
    test_insert(ptr,3);
    test_insert(ptr,4);
    test_insert(ptr,4);
    test_insert(ptr,5);
    test_insert(ptr,6);
    //test for get_max
    printf("test for get_max : %d\n" ,test_getMax(ptr));
    printf("test for null input = %d \n",test_getMax(null));
    //test for get min
    printf("test for get_min : %d\n" ,test_getMin(ptr));
    printf("test for null input = %d \n",test_getMin(null));
    //test for search
    printf("test for search  %d : @index %d\n" ,2,test_search(ptr, 2));
    printf("test for search  %d : @index %d\n" ,1,test_search(ptr, 1));
    printf("test for search  %d : @index %d\n" ,1323,test_search(ptr, 1323));
    printf("test for null input = %d \n",test_search(null,123123));
    //test for pop_min
    printf("test for pop_Min : Removed %d \n" , test_popMin(ptr));
    printf("test for null input = %d \n",test_popMin(null));
    //test for print
    test_print(ptr);
	  //test for remove
    test_remove(ptr,2);
    print(ptr);
    test_remove(ptr,6);
    print(ptr);
    //test for null
    printf("test to remove null = %d \n",test_remove(null,18));
    printf("test to remove null num = %d \n",test_remove(ptr,100));
  
  
  //test for get_max_value;
	int result = get_max_ARM(ptr);
	int result2 = get_min_ARM(ptr);
	printf("test for get max ARM = %d \n",result);
	printf("test for get min ARM = %d \n",result2);
  test_remove(ptr,17);
  print(ptr);
  int resultm = get_max_ARM(ptr);
  printf("test for get max ARM after insert new max = %d \n",resultm);
  test_insert(ptr,8);
  int resultx = get_max_ARM(ptr);
   printf("test for get max ARM after insert new max = %d \n",resultx);
   test_insert(ptr,10);
   int resulty = get_max_ARM(ptr);
   printf("test for get max ARM after insert new max = %d \n",resulty);
  
  
  test_insert(ptr,1);
  int result3 = get_min_ARM(ptr);
  printf("test for get min ARM after insert = %d \n",result3);
  //test for null
  printf("test for getMax Null ARM = %d \n",get_max_ARM(null));
  printf("test for getMax Null ARM = %d \n",get_min_ARM(null));
  free(ptr->sortedList);
  free(ptr);
  return 1;
}
