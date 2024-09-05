#include <stdio.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char** argv) {
	if (argc != 2) {
    	return -1;
	}
	bool rel = true;
	if (argv[1][1] == '/') {
    	rel = false;
	}
	char* last = strrchr(argv[1], '/');
	*last = '\0';
	puts(argv[1]);
	return 0;
}
