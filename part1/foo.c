#include <stdio.h>

static int a[65536];
static int b[65536];


int main() {
    int n = 0;
    int sum_m = 0;
    int sum_p = 0;

    scanf("%d", &n);
    for (int i = 0; i < n; ++i) {
        scanf("%d", &a[i]);
    }
    for (int i = 0; i < n; ++i) {
        if (a[i] < 0) {
            sum_m += a[i];
        } else {
            sum_p += a[i];
        }
    }
    for (int i = 0; i < n; ++i) {
        if (i % 2 == 0) {
            b[i] = sum_p;
        } else {
            b[i] = sum_m;
        }
    }

    for (int i = 0; i < n; ++i) {
        printf("%d ", b[i]);
    }
    return 0;
}
