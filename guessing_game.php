<?php

resetGame();
function resetGame() {
    $randomNumber = mt_rand(1,100);
    $attempts = 1;
    echo $randomNumber . "\n";
    ask($randomNumber, $attempts);
}

function ask($randomNumber, $attempts) {
    echo "Guess a number between 1 and 100: ";
    $guess = trim(fgets(STDIN));
    identify($guess, $randomNumber, $attempts);
    return $guess;
}

function identify($guess, $randomNumber, $attempts) {
    if ($guess == $randomNumber) {
        echo "Good Job! You got the number in " . $attempts . " attempts! \n";
        playAgain();
    } elseif ($guess < $randomNumber){
        echo "Too Low \n";
        $attempts++;
        ask($randomNumber, $attempts);
    } elseif ($guess > $randomNumber) {
        echo "Too High \n";
        $attempts++;
        ask($randomNumber, $attempts);
    }
}

function playAgain() {
    $stance;
    echo "Play Again? Y/N \n";
    $answer = trim(fgets(STDIN));
    if ($answer == "Y") $stance = true;
    elseif ($answer == "N") $stance = false;
    else {
        echo "Answer Not Acceptable. Please Try Again \n";
        playAgain();
    }
    $stance ? resetGame() : exit;
}
?>