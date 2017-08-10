//PID:A91018743
//NAME:YUHANG LIAN

#include <stdio.h>
#include <stdlib.h>

#include "arraysort.h"
/**
 * This function creates an empty list, with space allocated for an array of
 * maxElements ints (pointed to by int *sortedList) and returns a pointer to the
 * list.
 */
list* createlist(int maxElements)
{
    //CREATE POINTER TO THE ALLOCATED MEMORY
    list* ptr = calloc(maxElements,sizeof(int));
    //POINT EACH ELEMENT TO MEMORY ADDRESS AND VALUE
    ptr->sortedList =calloc(maxElements,sizeof(int));
    ptr->maxSize= maxElements;
    ptr->size = 0;
    return ptr;
}

/**
 * This function takes a pointer to the list and an integer value as input. It
 * should insert the value 'val' into sortedList, update the number of elements
 * in the list and return the index where the element was inserted. If the list
 * is full before inserting the element, it should increase the size of the list
 * to double its previous size and then insert the element. If the result of the
 * insert was not successful it should return -1. Note that the resulting list
 * should be sorted and there should be no information loss. The function should
 * return -1 if no valid list was passed to it..
 */
int insert(list *ls, int val)
{
//CHECK IF THE LIST IS NULL
  if(ls==NULL){
     return -1;
     }   
  //CHECK IF EXCEED THE MAXIMUM SIZE OF THE ARRAY
    if(ls->size+1>ls->maxSize){
        printf("SIZE_EXCEEDED_MAXSIZE---REALLOCATING SIZE \n");
        ls->sortedList = realloc(ls->sortedList, 2*ls->maxSize*sizeof(int));
        ls->maxSize =2*ls->maxSize;
        printf("DONE, NEW_SIZE = %d \n",ls->maxSize);
    }
    //CHECK IF THE SIZE IS 0, IF IT IS ADD THE ELEMENT AND
    //INCREASE THE SIZE
    if(ls->size == 0){
        ls->sortedList[0]=val;
        ls->size = 1;
        return val;
    }
    //CHECK FOR THE POSITION WHERE TO INSERT THE VAL
    int i = ls->size-1;
    int pos = 0;
        if(ls->sortedList[i]>val){
            for(int x = i;x>=0;x--){
                if(ls->sortedList[x]<val){
                    pos = x+1;
                    break;
                }
            }
            //SHIFT ALL THE ELEMENT TO MAKE ROOM FOR THE NEW VAL
            for(int j = ls->size;j>pos;j--){
                ls->sortedList[j]=ls->sortedList[j-1];
            }
            ls->sortedList[pos] = val;
            ls->size++;
            return pos;
        }
        else{
        //IF THE ELEMENT IF LARGEST, ADD IT TO THE END
            ls->sortedList[i+1]=val;
            ls->size++;
            return i+1;
        }
    
    
    return val;
}

// THIS METHOD IS USED TO CHECK IF THERE ARE DUPILCATED VAL
int checkExist(list* ls, int val){
    for(int i = 0; i<ls->size;i++){
        if(ls->sortedList[i]==val){
            return 1;
        }
    }
    return 0;
}
/**
 * This function takes a pointer to the list and an integer value as input. It
 * should delete all instances of elements in the sortedList with value 'val',
 * update the number of elements remaining in the list and return the number of
 * elements that were deleted. Once again the resulting list should be sorted.
 */
int remove_val(list *ls, int val)
{
//CHECK IF THE LIST IS EMPTY
    if(ls==NULL){
        return -1;
    }
    int index = 0;
    int exist = 1;
    //GO THOUGH THE MEMORY, CHECK FOR VAL, AND REMOVE ALL OF THEM!
    while(exist  ==  1){
        for(int i = 0; i<ls->size;i++){
            if(ls->sortedList[i]==val){
                index = i;
                //SHIFT ALL THE NUMBER TO REMOVE VAL
                for(int j = i;j+1<ls->size;j++){
                    ls->sortedList[j] = ls->sortedList[j+1];
                }
                ls->size--;
            }
            //CHECK IF THERE ARE STILL VALS REMAIN
            exist = checkExist(ls, val);
        }
    }
    return -1;
}


/**
 * This function takes a pointer to the the list as input and returns the
 * maximum value in the list OR -1 if the list is empty.
 */
int get_max_value(list *ls)
{
//CHECK IF THE LIST IS EMPTY 
    if(ls ==NULL){
    return -1;
    }
    //RETURN MAX NUM
    return ls->sortedList[ls->size-1];
}

/**
 * This function takes a pointer to the list and returns the minimum value in
 * the list OR -1 if the list is empty.
 */
int get_min_value(list *ls){
//CHECK IF IT IS EMPTY
   if(ls == NULL){
   return -1;
   }
//RETURN THE MIN VAL
    return ls->sortedList[0];
}

/**
 * This function returns the index of the first occurrence of 'val' in the
 * list. It returns -1 if the value 'val' is not present in the list.
 */
int search(list *ls, int val){
    
    //FIRST CHECK IF THE LIST IS EMPTY 
    if(ls == NULL){
    return -1;
    }
    //IF NOT, GO THOUGHT IT AND FIND THE POSITION OF THE VAL
    for(int i = 0; i < ls->size;i++){
        if(ls->sortedList[i]==val){
            return i;
        }
    }
    //RETURN -1 IF FOUND NOTHING
    return -1;
}

/**
 * This function returns the minimum value from the list and removes it from the
 * list. It returns -1 if the list is empty.
 */
int pop_min(list *ls){
    //CHECK NULL
    if(ls == NULL){
    return -1;
    }
    //CHECK IF THE SIZE IS 0
    if(ls->size == 0){
    return -1;
    }
    //GO THOUGH THE LIST AND REMOVE THE MIN
    int min = ls->sortedList[0];
    while(ls->sortedList[0] == min){
        //REMOVE ALL THE SAME MIN VAL
        ls->size--;
        for(int i = 0;i<ls->size;i++){
            ls->sortedList[i]=ls->sortedList[i+1];
        }
    }
    return min;
}

/**
 * This function print the contents of the sorted list on a single line as follows:
 * 1 4 6 7 8
 */
void print(list *ls){
//CHECK THE LIST FIRST IF EMPTY JUST RETURN
    if(ls == NULL){
    return; 
    }
    //GO THOUGH THE LIST AND PRINT OUT ALL THE ELEMENTS;
    for(int i = 0; i < ls->size;i++){
        printf("%d ",ls->sortedList[i]);
    }
    printf("\n");
}

/**
 * Identical to get_min_value(), but implemented in ARM assembly
 * (use given file get_min_ARM.s)
 */
int get_min_ARM(list *ls);

/**
 * Identical to get_max_value(), but implemented in ARM assembly
 * (use given file get_max_ARM.s)
 */
int get_max_ARM(list *ls);
