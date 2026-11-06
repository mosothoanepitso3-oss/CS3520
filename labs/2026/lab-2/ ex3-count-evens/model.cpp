#include <iostream>

int main() {
    // An array of integers to test
    int array[] = {12, 7, 19, 24, 5, 8, 14, 3};
    int size = 8; // Number of elements in the array
    int even_count = 0;

    for (int i = 0; i < size; i++) {
        // If the number divided by 2 has a remainder of 0, it is even
        if (array[i] % 2 == 0) {
            even_count++;
        }
    }

    // Print the final count of even numbers
    std::cout << even_count << std::endl;
    return 0;
}
