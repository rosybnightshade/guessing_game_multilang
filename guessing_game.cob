       IDENTIFICATION DIVISION.                                         *> sudo apt install gnucobal
       PROGRAM-ID. HELLO-WORLD.                                         *> cobc -x guessing_game.cob -o guessing_game

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 RANDOM-VAL PIC V9(10).
       01 RANDOM-NUM PIC 999.
       01 ATTEMPTS PIC 9(2) VALUE 0.
       01 GUESS PIC 999 VALUE 999.
       01 CURRENT-TIME.
           05 CURRENT-HOUR PIC 99.
           05 CURRENT-MIN PIC 99.
           05 CURRENT-SEC PIC 99.
           05 CURRENT-HUND PIC 99.

       PROCEDURE DIVISION.
           ACCEPT CURRENT-TIME FROM TIME.
           MOVE FUNCTION RANDOM(CURRENT-HUND) TO RANDOM-VAL.            *> We have random numbers at home
           COMPUTE RANDOM-NUM = (RANDOM-VAL * 100) + 1.

           DISPLAY RANDOM-NUM.

           PERFORM UNTIL GUESS = RANDOM-NUM
               DISPLAY "Pick a number between 1-100: "
               ACCEPT GUESS
               ADD 1 TO ATTEMPTS

               EVALUATE TRUE
                   WHEN GUESS > RANDOM-NUM
                       DISPLAY "Too high, please try again"
                   WHEN GUESS < RANDOM-NUM
                       DISPLAY "Too low, please try again"
               END-EVALUATE
                
           END-PERFORM.

           DISPLAY "You got it in " ATTEMPTS " attempts!".

           STOP RUN.
