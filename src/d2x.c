#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include <fcntl.h>
#include <unistd.h>

typedef double f64;
typedef uint64_t u64;

typedef union {
    f64 f;
    u64 u;
} num;


void display_float(num n) {
    u64 one = 1;
    u64 sign_bit = one<<63;
    printf("0x%llx\n", n.u);

    char *sign_str = sign_bit & n.u ? "1" : "0";
    printf("sign: %s\n", sign_str);

    u64 twelve_bits = (one<<11)-1;
    u64 mantissa_mask = twelve_bits << 51;
    char mantissa_str[13];
    mantissa_str[12] = '\0';
    u64 mantissa_bits = (n.u & mantissa_mask)>>51;
    for (int i = 0; i < 12; i++) {
        mantissa_str[11-i] = (mantissa_bits & 1) ? '1': '0';
        mantissa_bits >>= 1;
    }
    printf("mantissa: %s\n", mantissa_str);
}

int main() {
    int hi = open("/tmp/hi.dot", O_RDONLY);
    if (hi != -1) close(hi);
    num a = {.f = 0./0};
    display_float(a);
    while (true) {
        num i;
        scanf("%le", &i.f);
        display_float(i);
    }
    return 0;
}
