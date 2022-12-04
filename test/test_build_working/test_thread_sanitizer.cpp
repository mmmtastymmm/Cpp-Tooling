#include <thread>

// There are two of the same function to make the thread logs easier to understand

/// Adds 1 to the value reference n number of times
/// \param value The value to add to
/// \param times How many times to do it
void add1(int &value, int times) {
    for (int i = 0; i < times; i++) {
        value += 1;
    }
}

/// Adds 1 to the value reference n number of times
/// \param value The value to add to
/// \param times How many times to do it
void add2(int &value, int times) {
    for (int i = 0; i < times; i++) {
        value += 1;
    }
}

/// Generates two threads that should conflict with one another
int main() {
    auto value = 0;
    auto times = 1000;
    auto t1 = std::thread(add1, std::ref(value), times);
    auto t2 = std::thread(add2, std::ref(value), times);
    t1.join();
    t2.join();
    return not value;
}
