# A quick and dirty makefile for compiling hw2

all:
	gcc -std=c99  search_ARM.s pop_min_ARM.s createlist_ARM.s insert_ARM.s array_tester.c arraysort.c get_max_ARM.s get_min_ARM.s -o test_hw2
arm:   
	gcc -std=c99 -g print_ARM.s get_max_ARM.s get_min_ARM.s remove_val_ARM.s search_ARM.s pop_min_ARM.s createlist_ARM.s insert_ARM.s array_tester_ARM.c -o test_ARM


run:
	./test_hw2
