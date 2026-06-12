/* sample.c - demonstration file for Polyspace analysis */
#include <stdlib.h>
#include <string.h>

/* Potential division by zero */
int divide(int a, int b) {
    return a / b;
}

/* Potential null pointer dereference */
void process(int *ptr) {
    *ptr = 42;
}

/* Potential array out-of-bounds */
void fill_array(void) {
    int arr[5];
    for (int i = 0; i <= 5; i++) {   /* off-by-one: writes arr[5] */
        arr[i] = i;
    }
}

/* Potential memory leak */
void memory_leak(void) {
    int *p = (int *)malloc(sizeof(int) * 10);
    /* p is never freed */
    p[0] = 1;
}

int main(void) {
    /* May pass b=0, causing divide-by-zero */
    int x = divide(10, 0);

    /* Passes NULL pointer */
    process(NULL);

    fill_array();
    memory_leak();

    return 0;
}
