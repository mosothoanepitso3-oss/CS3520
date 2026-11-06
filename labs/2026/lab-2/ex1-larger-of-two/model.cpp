#include <iostream>

int main() {
    int a = 42;
    int b = 87;
    int larger;

    if (a > b) {
        larger = a;
    } else {
        larger = b;
    }

    std::cout << larger << std::endl;
    return 0;
}
