#include <cstdio>

/// Jump off of uninitialized memory
/// \return 0, side effect of printing out a message if the uninitialized memory is read
int main(int argc, char **) {
    int *a = new int[10];
    // Jump off uninitialized memory
    if (not a[argc])
        printf("The uninitialized memory at index %d was zero", argc);
    return 0;
}