/// Have an integer overflow which should be caught by a undefined behavior sanitizer
int main(int argc, char **) {
    int k = 0x7fffffff;
    k += argc;
    return not k;
}