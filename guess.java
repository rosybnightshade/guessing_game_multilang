import java.util.Scanner;
public class guess {
    static int guess; // shared thoughout the public class
    static int randomNumber;
    static int attempts = 0;
    public static int converseGuess () {
        if (guess == randomNumber) {
            System.out.printf("You guessed the number in %d attempts", attempts);
        } else if (guess > randomNumber) {
            System.out.println("Too High");
        } else if (guess < randomNumber) {
            System.out.println("Too Low");
        }
        attempts++;
        return guess;
    }
    public static void main(String[]args) {
        randomNumber = Math.round(Math.round(Math.floor(Math.random() * 100)) + 1);

        Scanner initialGuess = new Scanner(System.in);

        while (true) {
            try {
                System.out.println("Enter A Number Between 1-100: ");
                String guessing = initialGuess.nextLine();
                guess = Integer.parseInt(guessing);

                if (guess < 0 || guess > 100) {
                    System.err.println("error");
                } else {
                    converseGuess();
                    if (guess == randomNumber) {
                        break;
                    }
        }
            }
            catch (Exception e) {
                System.out.println("Wrong");
            }
        }
    }
};