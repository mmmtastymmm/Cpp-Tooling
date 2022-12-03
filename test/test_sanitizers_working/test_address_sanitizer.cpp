
/// Read off of freed memory
/// \return some already freed memory, which should cause address sanitizer to fail
int main(int argc, char **) {
    int *array = new int[100];
    delete[] array;
    return array[argc];// BOOM
}