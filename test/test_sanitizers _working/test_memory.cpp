#include <catch2/catch.hpp>

int read_from_uninitialized_memory() {
    int *a = new int[10];
    a[5] = 0;
    if (a[2])
        printf("xx\n");
    return 0;
}

TEST_CASE("ShouldFailMemorySanitizer", "[should_fail]") {
    read_from_uninitialized_memory();
}