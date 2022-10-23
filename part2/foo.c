#include <stdio.h>

static int a[65536];
static int b[65536];

void fill_array(int sum_m, int sum_p, int n) {
    for (int i = 0; i < n; ++i) {
        if (i % 2 == 0) {
            b[i] = sum_p;
        } else {
            b[i] = sum_m;
        }
    }
}

int find_neg_sum(int n) {
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        if (a[i] < 0) {
            sum += a[i];
        }
    }
    return sum;
}

int find_pos_sum(int n) {
    int sum = 0;
    for (int i = 0; i < n; ++i) {
        if (a[i] > 0) {
            sum += a[i];
        }
    }
    return sum;
}

int main() {
    int n, i;
    int sum_m;
    int sum_p;

    scanf("%d", &n);
    for (i = 0; i < n; ++i) {
        scanf("%d", &a[i]);
    }
    sum_m = find_neg_sum(n);
    sum_p = find_pos_sum(n);
    fill_array(sum_m, sum_p, n);
    for (i = 0; i < n; ++i) {
        printf("%d ", b[i]);
    }
    return 0;
}
