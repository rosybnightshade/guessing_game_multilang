#include <iostream>
#include <random>

int num() {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> distrib(1, 100);
    int randomNumber = distrib(gen);
    return randomNumber;
}

int userguess() {
    int guess;
    std::cout << "Enter a Number Between 1-100: ";
    std::cin >> guess;
    if (isdigit(guess)) {
        return guess;
    } else {
        std::cout << "Invalid Input" << std::endl;
        std::cin.clear();
        std::cin.ignore(10, '\n');
        return userguess();
    }
     
}
int main() {
    int randomNumber = num();
    int attempts = 0;
    int guess;

    do {
        guess = userguess();
        attempts++;

        if (guess == randomNumber) {
            std::cout << "You have guessed the number in " << attempts << " attempts" << std::endl;
        } else if (guess > randomNumber) {
            std::cout << "Too High" << std::endl;
        } else {
            std::cout << "Too Low" << std::endl;
        }
    } while (guess != randomNumber);

    return 0;
}
