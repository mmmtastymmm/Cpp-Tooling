#include <catch2/catch.hpp>

TEST_CASE("Example_Test", "[t1]") {
    CHECK(1 == 1);
}

TEST_CASE("Example_2", "[t2]") {
    CHECK(4.0 == std::pow(2, 2));
}