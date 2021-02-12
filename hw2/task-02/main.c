#include <stdio.h>
#include <assert.h>
#include <stdint.h>
#include <inttypes.h>

uint64_t product_of_min_and_max_primes(const uint32_t *data, uint32_t size);

uint64_t checkPrime(uint32_t n);

uint32_t mySqrt(uint32_t n);

int main() {
    uint32_t data[256];
    int sz;
    scanf("%d", &sz);

    for(int i = 0; i < sz; i++) {
        scanf("%d", &data[i]);
    }

    printf("%" PRId64 "\n", product_of_min_and_max_primes(data, sz));

    return 0;
}
