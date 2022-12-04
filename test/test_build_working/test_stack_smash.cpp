#include <cstring>

int main() {
    char buffer[3];
    auto words = "Hello I am smashing your stack now thank you";
    strcpy(buffer, words);
    return 0;
}