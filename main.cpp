#include <iostream>
#include <thread>
#include <vector>

auto add_1(int &value) {
    value += 1;
}

auto add_1_multiple_times(int times, int &value) {
    for (int i = 0; i < times; i++) {
        add_1(value);
    }
}

auto getInt() -> int {
    return *(new int);
}

struct something {
    int return5() {
        return 5;
    }
};

int main() {
    std::cout << "Hello, World!" << std::endl;
    auto a = new int(12);
    std::cout << a << std::endl;
    auto value = 0;
    auto t1 = std::thread(add_1_multiple_times, 10000, std::ref(value));
    auto t2 = std::thread(add_1_multiple_times, 20000, std::ref(value));

    t1.join();
    t2.join();

    std::cout << value << std::endl;

    int f = getInt();
    std::cout << f << std::endl;

    std::vector<double> vector{1, 2, 3, 4};
    for (decltype(vector.size()) i = 0; i < vector.size(); i++) {
        std::cout << vector.at(i) << std::endl;
    }

    return 0;
}
