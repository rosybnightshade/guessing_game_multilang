import kotlin.system.exitProcess

var random_number = (0..100).random()
var attempts = 0

fun generate() {
    random_number = (0..100).random()
    attempts = 0
    main()
}

fun main() {
    print("Enter a number between 1-100: ")
    var guess = readln()
    var g: Int = guess.toInt();
    attempts++
    determine(g, random_number)
}

fun determine(g: Int, random_number: Int) {
    if (g == random_number) {
        println("Correct! You got the number in $attempts attempts!")
        playagain()
    } else if (g > random_number) {
        println("Too High! Try again")
        main()
    } else if (g < random_number) {
        println("Too Low! Try again")
        main()
    }
}

fun playagain() {
    println("Would you like to play again? Y/N")
    var answer = readln()
    var stance = null
    if (answer == "Y") generate()
    else if (answer  == "N") exitProcess(0)
    else {
        println("Answer unacceptable. Please try again")
        playagain()
    }
}