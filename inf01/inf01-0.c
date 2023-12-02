#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    double x;
    int y;
    int z;
    scanf("%lf", &x);
    scanf("%x", &y);   
    z = strtoll(argv[1], NULL, 27);
    printf("%.3lf\n", x + y + z);

    return 0;
}