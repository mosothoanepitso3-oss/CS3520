#include <iostream>

// Factorial procedure that main calls
int factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

int main() {
    int input = 5; // Compute 5! (5 * 4 * 3 * 2 * 1)
    int final_ans = factorial(input);

    std::cout << final_ans << std::endl;
    return 0;
}
