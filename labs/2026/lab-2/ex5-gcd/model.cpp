#include <iostream>

// GCD procedure using Euclid's subtraction method
int gcd(int a, int b) {
    while (a != b) {
        if (a > b) {
            a = a - b;
        } else {
            b = b - a;
        }
    }
    return a; // or return b, since they are equal
}

int main() {
    int num1 = 24;
    int num2 = 60;
    int result = gcd(num1, num2);

    std::cout << result << std::endl; // Should print 12
    return 0;
}
