/// Leaks memory that the leak sanitizer should catch
/// \return 0, leak some memory as well
#include <cstdlib>
[[maybe_unused]] void* p;
int main() {
    p = malloc(7);
    p = nullptr; // The memory is leaked here.
    return 0;
}