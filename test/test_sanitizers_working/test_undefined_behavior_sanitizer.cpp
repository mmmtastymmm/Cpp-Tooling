/// Overflow an int for undefined behavior protection
int main(int argc, char **) {
    int k = 0x7fffffff;
    k += argc;
    return not k;
}
