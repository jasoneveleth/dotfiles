#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

// GENERATOR {{{ https://en.wikipedia.org/wiki/Xorshift
struct xorshift128_state {
    uint32_t a, b, c, d;
};

static struct xorshift128_state state = {349, 3429, 21398, 893};

uint32_t xorshift128()
{
    uint32_t t = state.d;

    uint32_t const s = state.a;
    state.d = state.c;
    state.c = state.b;
    state.b = s;

    t ^= t << 11;
    t ^= t >> 8;
    return state.a = t ^ s ^ (s >> 19);
}
// }}}

#define BSIZE 16384

static inline void
yeet(long size) {
    // write BSIZEs {{{
    long written = 0;
    while (size - written > BSIZE) {
        char buf[BSIZE];
        uint64_t next = 0;
        for (int i = 0; i < BSIZE; i++) {
            if (!next) next = xorshift128();
            char digit = (next % 10) + 48; // int -> ascii
            next /= 10;
            buf[i] = digit;
        }
        write(1, buf, BSIZE);
        written += BSIZE;
    }
    // }}}

    // write leftovers {{{
    uint64_t next = 0;
    for (; written < size; written++) {
        if (!next) next = xorshift128();
        char digit = (next % 10) + 48; // int -> ascii
        next /= 10;
        putc(digit, stdout);
    }
    // }}}
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("usage: %s num\n", argv[0]);
        exit(1);
    }
    yeet(atol(argv[1]));
    return 0;
}
