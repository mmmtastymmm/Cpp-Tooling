#include <catch2/catch_all.hpp>

struct ContainerHolds12 {
    int* x;

    ContainerHolds12() {
        x = new int(12);
    }

    ~ContainerHolds12() {
        delete x;
    }
};

TEST_CASE("Example_Test", "[t1]") {
    CHECK(1 == 2 - 1);
}

TEST_CASE("Example_2", "[t2]") {
    CHECK(4.0 == std::pow(2, 2));
}

TEST_CASE("Example_Heap", "[t3]") {
    const auto container = ContainerHolds12();
    CHECK(*container.x== 12);
}