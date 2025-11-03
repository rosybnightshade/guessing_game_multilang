const readline = require("readline");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

let randomNumber = Math.round(Math.random() * 100 + 1);
let attempts = 1;

function promptGuess() {
  rl.question("What's your guess?  ", (input) => {
    const guess = parseInt(input);

    if (input > 100 || isNaN(input)) {
      console.log("Out of range. Guess Again");
      promptGuess();
      return;
    }

    if (input == randomNumber) {
      console.log(`Correct! You guessed in ${attempts} attempts!`);
      rl.question("Would you like to play again? Y or N ", (answer) => {
        let real = answer.toUpperCase();
        switch (real) {
          case "Y":
            randomNumber = Math.round(Math.random() * 100 + 1);
            attempts = 1;
            promptGuess();
            break;
          case "N":
            rl.close();
            break;
          default:
            console.log("Invalid");
            rl.close();
        }
      });
      return;
    } else if (input > randomNumber) {
      console.log("Too High");
      attempts++;
      promptGuess();
    } else if (input < randomNumber) {
      console.log("Too Low");
      attempts++;
      promptGuess();
    }
  });
}
promptGuess();