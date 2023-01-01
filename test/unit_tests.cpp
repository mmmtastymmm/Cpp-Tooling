#include <catch2/catch_all.hpp>
#include <catch2/catch_test_macros.hpp>

struct ContainerHolds12 {
    int* x;

    ContainerHolds12() {
        x = new int(12);
    }

    ~ContainerHolds12() {
        delete x;
    }
};

TEST_CASE("Example_Int", "[example_tests]") {
    CHECK(1 == 2 - 1);
}

TEST_CASE("Example_Float", "[example_tests]") {
    Catch::Matchers::WithinAbs(4.0 == std::pow(2, 2), 1e-19);
}

TEST_CASE("Example_Heap", "[example_tests]") {
    const auto container = ContainerHolds12();
    CHECK(*container.x == 12);
}