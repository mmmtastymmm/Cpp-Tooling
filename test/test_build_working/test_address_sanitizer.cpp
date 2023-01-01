
/// Read from out of bounds memory
/// \return memory off the end of an allocated array
int main(int argc, char**) {
    int* array = new int[1];
    return array[argc + 1]; // BOOM
}