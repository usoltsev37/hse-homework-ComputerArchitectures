#include <stdint.h>
#include <stdio.h>

void print_hello(const char *name);

int main() {
	char name[256];
    scanf("%s", name);
	print_hello(name);
	return 0;
}
