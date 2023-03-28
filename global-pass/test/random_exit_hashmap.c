#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define SIZE 20

int RANDOM_UNIT;
int RANDOM_INIT = 0;
time_t t;
struct tm *timeinfo;
struct DataItem {
   int data;   
   int key;
};

struct DataItem* hashArray[SIZE]; 
struct DataItem* dummyItem;
struct DataItem* item;

int hashCode(int key) {
   return key % SIZE;
}

struct DataItem *search(int key) {
   //get the hash 
   int hashIndex = hashCode(key);  
	
   //move in array until an empty 
   while(hashArray[hashIndex] != NULL) {
	
      if(hashArray[hashIndex]->key == key)
         return hashArray[hashIndex]; 
			
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= SIZE;
   }        
	
   return NULL;        
}

void insert(int key,int data) {

   struct DataItem *item = (struct DataItem*) malloc(sizeof(struct DataItem));
   item->data = data;  
   item->key = key;

   //get the hash 
   int hashIndex = hashCode(key);

   //move in array until an empty or deleted cell
   while(hashArray[hashIndex] != NULL && hashArray[hashIndex]->key != -1) {
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= SIZE;
   }
	
   hashArray[hashIndex] = item;
}

struct DataItem* delete(struct DataItem* item) {
   int key = item->key;

   //get the hash 
   int hashIndex = hashCode(key);

   //move in array until an empty
   while(hashArray[hashIndex] != NULL) {
	
      if(hashArray[hashIndex]->key == key) {
         struct DataItem* temp = hashArray[hashIndex]; 
			
         //assign a dummy item at deleted position
         hashArray[hashIndex] = dummyItem; 
         return temp;
      }
		
      //go to next cell
      ++hashIndex;
		
      //wrap around the table
      hashIndex %= SIZE;
   }      
	
   return NULL;        
}

void display() {
   int i = 0;
	
   for(i = 0; i<SIZE; i++) {
	
      if(hashArray[i] != NULL)
         printf(" (%d,%d)",hashArray[i]->key,hashArray[i]->data);
      else
         printf(" ~~ ");
   }
	
   printf("\n");
}


int possibleValue()
{
    return rand() % 10;
}

void possibleExit()
{
    if (possibleValue() > 4)
    {
        exit(0);
    }
    
}

void doStuff()
{
    time(&t);
    timeinfo = localtime(&t);
    printf("%d %d %d %d:%d:%d\n",timeinfo->tm_mday, timeinfo->tm_mon + 1, timeinfo->tm_year + 1900, timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
    if (timeinfo->tm_sec%3 == 1)
    {
        exit(0);
    }
    else
    {
        possibleExit();
    }
    printf("%d", timeinfo->tm_sec);
}

void bigAllocation()
{
    char* foo = (char*)malloc(500000000);

    
    for (int i=0; i<500000000; i++)
    {
        foo[i] = (char)i;
    }
    

    int bar; scanf("%d", &bar); // wait so I can see what's goin on

    free(foo);

    return 0;
}
}

int main(int argc, char *argv[])
{
    srand(time(NULL));
    printf("___BEFORE INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);

    RANDOM_UNIT = rand() % 10;
    RANDOM_INIT = rand() % 10;

    doStuff();

    if (RANDOM_UNIT - RANDOM_INIT > 0)
    {
        printf("\nRANDOM SUBTRACTION EXIT TRIGGERED, HOPEFULLY THIS IS AVOIDED!!!!\n");
        exit(0);
    }
    printf("\n___AFTER INITIALIZING RANDOMS___\n");
    printf("Random Unintialized Value: %d\n", RANDOM_UNIT);
    printf("Random initilized Value: %d\n", RANDOM_INIT);
    printf("-----------------------------------\n");
    possibleExit();


   dummyItem = (struct DataItem*) malloc(sizeof(struct DataItem));
   dummyItem->data = -1;  
   dummyItem->key = -1; 

   insert(1, 20);
   insert(2, 70);
   insert(42, 80);
   insert(4, 25);
   insert(12, 44);
   insert(14, 32);
   insert(17, 11);
   insert(13, 78);
   insert(37, 97);

   display();
   item = search(37);

   if(item != NULL) {
      printf("Element found: %d\n", item->data);
   } else {
      printf("Element not found\n");
   }

   delete(item);
   item = search(37);

   if(item != NULL) {
      printf("Element found: %d\n", item->data);
   } else {
      printf("Element not found\n");
   }

   return 0;
}