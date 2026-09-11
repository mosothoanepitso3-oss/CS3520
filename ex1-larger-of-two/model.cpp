#include <iostream>

int main() {
    int a = 15;
    int b = 42;
    int max;

    if (a >= b) {
        max = a;
    } else {
        max = b;
    }

    std::cout << max << std::endl;
    return 0;
}

