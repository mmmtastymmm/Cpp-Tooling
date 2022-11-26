#include <iostream>
#include <thread>

auto add_1(int &value) {
    value += 1;
}

auto add_1_multiple_times(int times, int &value) {
    for (int i = 0; i < times; i++) {
        add_1(value);
    }
}

auto getInt() -> int {}

int main() {

    return 0;
}
