import random
def Game():
    def start():
        randomNumber = random.randint(1,100)
        userguess(randomNumber, 1)

    def userguess(randomNumber, attempts):
        guess = input("Please Enter a Number Between 1-100: ")
        guess = guess.strip()
        try:
            guess = int(guess)
        except ValueError:
            print("Invalid Input")
            return userguess(randomNumber, attempts)

        if guess == randomNumber:
            print(f"You guessed the number in {attempts} attempts.")
        else:
            if guess < randomNumber:
                print("Too low")
            else:
                print("Too high")
            userguess(randomNumber, attempts + 1)
    start()
Game()