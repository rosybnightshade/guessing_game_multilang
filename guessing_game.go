package main
import (
	"fmt"
	"math/rand/v2"
	"strconv"
	"os"
)

var random_number int
var attempts int

func main() {
	random_number = rand.IntN(101)
	attempts = 0
	promptUser()
} 

func promptUser() {
	var guess string
	
	fmt.Println("Chose a number between 1-100")
	fmt.Scanln(&guess)
	g, err := strconv.Atoi(guess)
	if err != nil {
		fmt.Println("error")
    }
	attempts++
	identifyAccuracy(g)
}

func identifyAccuracy(g int) {
	if g == random_number {
		fmt.Println("Correct! You got the answer in " + strconv.Itoa(attempts) + " attempts")
		playAgain()
	} else if g < random_number {
		fmt.Println("Too Low, Try Again")
		promptUser()
	} else if g > random_number {
		fmt.Println("Too High, Try Again")
		promptUser()
	}
}

func playAgain() {
	var answer string
	fmt.Println("Would you like to play again? Y/N")
	fmt.Scanln(&answer)
	if answer == "Y" {
		main()
	} else if answer == "N" {
		os.Exit(1)
	} else {
		fmt.Println("Response Invalid. Try Again")
		playAgain()
	}
}